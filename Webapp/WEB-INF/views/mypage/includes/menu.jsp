<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
<fmt:formatDate value="${now}" pattern="MM" var="month" />
<fmt:formatDate value="${now}" pattern="dd" var="day" />
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="summary-wrapper">
	<div class="summary clearfix">
		<p class="date">${year}년 ${month}월 ${day}일</p>

		<c:choose>
			<c:when test="${authUser.userType eq 'trainer'}">
				<div class="statistics">
					<h3 class="title left">평점</h3>
					<div class="info">${summary.summaryVo.avgScore}점/
						${summary.summaryVo.reviewCount}개</div>

					<h3 class="title left">현재 회원 수</h3>
					<div class="info">${summary.summaryVo.countCurrent}명</div>

					<h3 class="title left">누적 회원 수</h3>
					<div class="info">${summary.summaryVo.countAll}명</div>
				</div>
				<div class="schedule-wrapper">
					<h3 class="title">오늘의 일정</h3>
						<ul class="schedule-list">
							<c:forEach items="${summary.scheduleList}" var="schedule">
								<li class="schedule"><span class="name">${schedule.userName}
										회원님</span> <span class="time">${schedule.startTime} -
										${schedule.endTime}</span></li>
							</c:forEach>
						</ul>

				</div>
			</c:when>

			<c:otherwise>
				<div class="statistics">
					<h3 class="title left">다음 PT</h3>
					<div class="info">${summaryNormal.nextPt.startTime}-
						${summaryNormal.nextPt.endTime}</div>

					<h3 class="title left">등록기간</h3>
					<div class="info">${summaryNormal.ptVo.startDate}~
						${summaryNormal.ptVo.endDate}</div>

					<h3 class="title left">잔여횟수</h3>
					<div class="info">${summaryNormal.ptVo.regCount-summaryNormal.ptVo.scheduleCount}
						/ ${summaryNormal.ptVo.regCount}</div>
				</div>

				<div class="schedule-wrapper">
					<h3 class="title">예약 현황</h3>
					<div class="reserved-wrapper">
						<ul class="schedule-list">
							<c:forEach items="${summaryNormal.reservList}" var="reservation">
								<li class="schedule"><span class="time"> <c:choose>
											<c:when test="${reservation.state eq 'confirm'}">
												<i class="fas fa-check"></i>
						                    	${reservation.startTime} (확정)
				                    		</c:when>
											<c:when test="${reservation.state eq 'rejected'}">
												<i class="fas fa-times" onclick="reservDel(${reservation.scheduleNo},$(this))"></i>
				                    			${reservation.startTime} (반려)
				                    		</c:when>
											<c:otherwise>
												<i class="far fa-square"></i>
				                    			${reservation.startTime} (예약)
				                    		</c:otherwise>
										</c:choose>
									</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<button id="btn-reserved" class="button sub">PT 예약하기</button>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="menu-wrapper">
	<ul class="menu clearfix">
		<c:choose>
			<c:when test="${authUser.userType eq 'trainer'}">
				<li><a
					href="${pageContext.request.contextPath}/mypage/schedule">스케쥴</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypage/manageExercise">운동
						관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypage2/manageUser">회원
						관리</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/profile">프로필
						수정</a></li>
			</c:when>
			<c:otherwise>
				<li><a
					href="${pageContext.request.contextPath}/mypage2/exerciseRecord">운동기록</a></li>
				<li><a
					href="${pageContext.request.contextPath}/mypage2/inbodyRecord">인바디내역</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/profile">프로필
						수정</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>


<!-- 모달 -->
<div class="modal-layer hide-off" id="reservationModal">
	<div class="modal-wrapper">

		<div id="modalCalender"></div>
		
		<div class="reserv-info">
			<h3 class="title"> · 예약하기 </h3>
			<table>
				<tr>
					<th>예약 날짜</th>
					<td id="reserveDate"> 날짜를 선택 해 주세요 :) </td>
				</tr>
				<tr>
					<th>예약 시간</th>
					<td id="reservTime">
						<select name="hour" disabled>
							<option value="" selected>시간</option>
							<c:forEach var="time" begin="0" end="23">
		                        <option value="${time}">${time}시</option>
							</c:forEach>
	                    </select>
	                    
	                    <select name="minute" disabled>
	                    	<option value="" selected>분</option>
	                        <option value="00">00분</option>
	                        <option value="10">10분</option>
	                        <option value="20">20분</option>
	                        <option value="30">30분</option>
	                        <option value="40">40분</option>
	                        <option value="50">50분</option>
	                    </select>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="modal-btn-area">
			<button type="button" class="modal-cancel" onclick="forceHideModal('#reservationModal')">취소</button>
			<button type="button" class="modal-confirm" onclick="ptReservation()">확인</button>
		</div>
	</div>
</div>

<script type="text/javascript">

	/* 예약버튼클릭 */
	$("#btn-reserved").on("click", function() {
		/* 초기화 */
		$("#modalCalender").datepicker("destroy");
		$("#reserveDate").text(" 날짜를 선택 해 주세요 :) ");
		$("#reservTime select").prop('disabled', true);
		
		var ptNo = ${summaryNormal.ptVo.ptNo};
		
		$.ajax({

            url: "${pageContext.request.contextPath}/mypage2/getEndDate",
            type: "post",
            data: {ptNo: ptNo},

            dataType: "json",
            success: function (endDate) {

				/* 날짜 설정 */
				$("#modalCalender").datepicker({
					dateFormat: 'yy-mm-dd',
					defaultDate: null,
					minDate: new Date(getTimeStamp()),
					maxDate: new Date(endDate),
					onSelect: function(d){
						clickDate(d)
					}
				});
				$("a.ui-state-default").removeClass( "ui-state-active" );

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        })
		
		/* 모달 열기 */
		showModal("#reservationModal");
	});
	
	/* 날짜 클릭했을 때 */
	function clickDate(date){
		$("#reserveDate").text(date);
		$("#reservTime select").prop('disabled', false);
	}
	
	function ptReservation(){
		
		var ptNo = ${summaryNormal.ptVo.ptNo};
		var date = $("#reserveDate").text();
		var hour = $("select[name='hour']").val();
		var minute = $("select[name='minute']").val();
		
		if(hour == ""  || minute == ""){
			alert("날짜를 선택 해 주세요");
			return false;
			
		} else{
			
			$.ajax({

	            url: "${pageContext.request.contextPath}/mypage2/ptReservation",
	            type: "post",
	            data: {ptNo: ptNo,
	            		date: date,
	            		hour: hour,
	            		minute: minute},

	            dataType: "json",
	            success: function (result) {
	            	
					if(result){
						alert("예약 완료되었습니다 :)");
						
						forceHideModal('#reservationModal');

						location.reload(true);
						
					} else{
						alert("관리자에게 문의 바랍니다 :(");
					}
	            },
	            error: function (XHR, status, error) {
	                console.error(status + " : " + error);
	            }
	        })
		}
	}
	
	/* 반려된 예약 삭제 */
	function reservDel(scheduleNo, target){
		
		alert("반려된 예약이 삭제됩니다.");
		
		$.ajax({

            url: "${pageContext.request.contextPath}/mypage2/reservDel",
            type: "post",
            data: {scheduleNo: scheduleNo},

            dataType: "json",
            success: function (result) {
            	
				if(result){
					target.parents("li").remove();
				} else{
					alert("관리자에게 문의 바랍니다 :(");
				}
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        })
	};
	
	
	/* 오늘날짜 가져오기 */
	function getTimeStamp() {
	    var d = new Date();
	    var s =
	        leadingZeros(d.getFullYear(), 4) + '-' +
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	        leadingZeros(d.getDate() + 1, 2);

	    return s;
	}
	
	/* 날짜에 0채우기 */
	function leadingZeros(n, digits) {
	    var zero = '';
	    n = n.toString();

	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}
	
	
	
</script>

