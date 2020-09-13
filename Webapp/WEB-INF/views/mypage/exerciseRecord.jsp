<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>

<!-- icon 사용을 위한 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

<!-- 반드시 넣어야 하는 2가지 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/common.css">

<!-- 반드시 넣어야 하는 2가지 js -->
<script
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

<!-- slide -->
<link
	href="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/css/swiper.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/js/swiper.min.js"></script>

<!-- 해당 페이지 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mypage2.css">

</head>

<body>
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<div id="container">
		<c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
		<div class="wrapper content-wrapper">
			<p>운동 내역</p>

			<div id="first_select" class="box_color">
				<p>운동 날짜</p>
				<div>
					<ul>
						<c:forEach items="${exMap.exRecordDate}" var="date">
							<li onclick = 'showDateList(${date.scheduleNo},"${date.startTime}")'>${date.startTime}</li>
						</c:forEach>

					</ul>
				</div>
			</div>

			<div id="second_select" class="box_color recordList">
				<p class="exDate">${exMap.exRecordDate[0].startTime}</p>
				<div>
					<c:if test="${exMap.exTitleList.size() eq 0}">
						<div class="emtMsg">
							이 날 운동 기록이 없어요 :( 
						</div>
					</c:if>
					<c:forEach items="${exMap.exTitleList}" var="title">
						<table>
							<tr>
								<th rowspan="${title.setCount+1}">${title.exPart}</th>
								<td class="exTitle">${title.exName}(${title.setCount} set)</td>
							</tr>
							<c:forEach items="${exMap.exSetList}" var="detail">
								<c:if test="${title.exName eq detail.exName}">
									<tr>
										<td>${detail.amount}${title.unit} ${detail.count}회</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<script type="text/javascript">
	
	function showDateList(scheduleNo, date){
		$(".recordList>div").children().remove();
        $("p.exDate").text(date);
		
		$.ajax({
                url: "${pageContext.request.contextPath}/mypage2/showExRecord",
                type: "post",
                data: {scheduleNo: scheduleNo},
                
                dataType: "json",
                success: function (map) {
				
               	if(map.thisExList.length != 0){
	                var str = '';
	               	for(i = 0; i < map.thisExList.length; i++){
	                       str += '<table>';
	                       str += '	<tr>';
	                       str += '		<th rowspan="'+(map.thisExList[i].setCount+1)+'">'+map.thisExList[i].exPart+'</th>';
	                       str += '		<td class="exTitle">'+map.thisExList[i].exName+'('+map.thisExList[i].setCount+' set)</td>';
	                       str += '	</tr>';
	                       
	                       for(j = 0; j < map.thisSetList.length; j++){
		                       if(map.thisExList[i].exName == map.thisSetList[j].exName){
			                 		str += '			<tr>';
			                 		str += '				<td>'+map.thisSetList[j].amount+map.thisExList[i].unit+' '+map.thisSetList[j].count+'회</td>';
									str += '			</tr>';
								}
							}
	                		str += '</table>';
	               	}
					$(".recordList>div").append(str);
	               	
                }else {
	               	$(".recordList>div").append('<div class="emtMsg"> 이 날 운동 기록이 없어요 :( </div>');
                }
				
            },
            error: function (XHR, status, error) {
                console.error(status + ":" + error);
            }
        });g
	};



    </script>
</body>
</html>
