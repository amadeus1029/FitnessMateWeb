<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!-- icon 사용을 위한 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

    <!-- 반드시 넣어야 하는 2가지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">

    <!-- 반드시 넣어야 하는 2가지 js -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

    <!-- slide -->
    <link href="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/css/swiper.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/js/swiper.min.js"></script>

    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage2.css">
        
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
        
        <div class="wrapper">
            <form id="userSearchForm" class="clearfix">
                <h3 class="title">회원 검색</h3>
                <div class="radio-wrapper clearfix">
                    <input type="radio" id="nowMember" name="member" value="now" checked>
                    <label for="nowMember" onclick="showUserList($(this));">현재회원</label>
                    <input type="radio" id="formerMember" name="member" value="former">
                    <label for="formerMember" onclick="showUserList($(this));">이전회원</label>
                </div>
                <input type="text" id="searchKeyword" name="searchKeyword" placeholder="이름 혹은 아이디를 입력해주세요" onkeyup="searchByKeyword($(this));">
                <button type="button" id="addUserBtn" class="button main" onclick="showAddUserModal();">회원 추가</button>
            </form>
            
            <ul class="user-list now clearfix">
            	<!-- 반복 -->
            	<c:forEach items="${ptList}" var="pt">
	                <li class="user clearfix" onclick="showUser(${pt.ptNo});">
	                    <img src="${pageContext.request.contextPath}/assets/image/face/LeeHyoRi.jpg" alt="profile image" title="profile image">
	                    <p class="info">
	                        <span class="name">${pt.name}</span>
	                        <span class="id">${pt.userId}</span>
	                    </p>
	                </li>
                </c:forEach>

                <!-- 반복 끝 -->
            </ul>
            
            <ul class="user-list former clearfix off">
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/JungWooSung.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">정우성</span>
                        <span class="id">jsw9232</span>
                    </p>
                </li>
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/Yoo-Jae-Suk.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">유재석</span>
                        <span class="id">yoosansle</span>
                    </p>
                </li>
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/Lee-Kwang-soo.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">이광수</span>
                        <span class="id">kslee0421</span>
                    </p>
                </li>
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/LeeHyoRi.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">이효리</span>
                        <span class="id">dqwhdwqj1232</span>
                    </p>
                </li>
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/Yang-Se-chan.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">양세찬</span>
                        <span class="id">yangcyangc</span>
                    </p>
                </li>
                <li class="user clearfix" onclick="showUser();">
                    <img src="${pageContext.request.contextPath}/assets/image/face/Jeongjae-Lee.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">이정재</span>
                        <span class="id">imking2302</span>
                    </p>
                </li>
            </ul>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <div class="modal-layer" id="userInfoModal">
        <div class="modal-wrapper">
            <button type="button" class="close-btn" onclick="forceHideModal('#userInfoModal')">X</button>
            <div class="label-wrapper clearfix">
                <button type="button" class="label-btn profile-btn on" data-tab="profile" onclick="showTab($(this))">
                    프로필
                </button>
                <button type="button" class="label-btn review-btn" data-tab="inbody" onclick="showTab($(this))">인바디
                </button>
                <button type="button" class="label-btn location-btn" data-tab="exercise" onclick="showTab($(this))">
                    운동기록
                </button>
            </div>
            <div class="modal-content">
                <div class="label-tab profile-wrapper on">
					<img src="../assets/image/face/LeeHyoRi.jpg" alt="profile image" title="profile image">
                    <div>
                        <p class="label">· 회원 이름</p>
                        <p id="userName"></p>
                        
                        <p class="label">· ID</p>
                        <p id="userId"></p>
                        
                        <p class="label">· 연락처</p>
                        <p id="phone"></p>
                        
                        <p class="label">· 등록기간</p>
                        <p id="period"></p>
                        
                        <p class="label">· 잔여횟수</p>
                        <p id="count"></p>
                        
                        <p class="label">· 메모</p>
                        <textarea id="memo"></textarea>
                        <input type="hidden" id="modifyPtNo" value="">
                        <button type="button" onclick="modifyMemo($('textarea#memo').val(), $('input#modifyPtNo').val());">메모 수정</button>
                	</div>
	                <div class="label-tab inbody-wrapper">
	                    인바디 내역이 들어옵니다
	                </div>
	                <div class="label-tab exercise-wrapper">
	                    운동기록 내역이 들어옵니다
	                </div>
	            </div>
	        </div>
    	</div>
    </div>
    <div class="modal-layer" id="addUserModal">
        <div class="modal-wrapper">
            <div class="modal-content">
                <p class="title">회원 추가</p>
                <div class="search-wrapper clearfix">
                    <input type="text" name="keyword" placeholder="ID를 입력해주세요">
                    <button type="button" class="button search">검색</button>
                </div>
                <div class="search-result">
					<p class="defaultMsg">아이디로 회원을 검색해주세요.</p>
					<p class="errMsg">검색 결과가 없습니다.</p>
                    <%--TODO 정확히 아이디를 입력해서 검색했을 때 추가할 유저가 보이게 됩니다--%>
                    <%--TODO 검색해서 회원이 나타나고 스케쥴 횟수에 수치를 입력했을 때만 추가버튼이 활성화되게 할게요--%>
                    <%--TODO 위에 메모 구현해주세여!!!!!!!!!!!!!!!!!!!!!!!--%>
                    <div class="user clearfix">
                    	<!-- 검색결과나오는 부분 -->
                    </div>
                </div>
            </div>
            <div class="modal-btn-area">
                <button type="button" class="modal-cancel" onclick="forceHideModal('#addUserModal')">취소</button>
                <button type="button" class="modal-confirm main" onclick="addUser();">추가</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    
    	$("button.search").on("click", function(){
    		$("div.user").empty();
    		var keyword = $("input[name='keyword']").val();
    		
    		//데이터 전송
    		$.ajax({
    			//보낼 때 옵션
    			url : "${pageContext.request.contextPath}/mypage2/searchUser",
    			type : "post",
    			data : {keyword: keyword},
    					
    			//받을 때 옵션
    			dataType : "json",
    			success : function(userVo) {
    				$("p.errMsg").hide();
    				$("p.defaultMsg").hide();
    				
					var result = '';
					result += '<img src="${pageContext.request.contextPath}/assets/image/face/Lee-Kwang-soo.jpg" alt="profile image" title="profile image">';
					result += '<p class="info">';
					result += '    <span class="name">'+userVo.name+'</span>';
					result += '    <span class="id">'+userVo.userId+'</span>';
					result += '</p>';
					result += '<div class="schedule-input-wrapper clearfix">';
					result += '    <input class="schedule-input" type="number" name="period" placeholder="1" max="60">';
					result += '    <span class="mark">개월</span>';
					result += '    <input class="schedule-input" type="number" name="regCount" placeholder="0" max="999">';
					result += '    <span class="mark">회</span>';
					result += '    <input type="hidden" name="userNo" value="'+userVo.userNo+'">';
					result += '</div>';
					
					$("div.user").prepend(result);
    				
    			},
    			error : function(XHR, status, error) {
    				$("p.defaultMsg").hide();
    				$("p.errMsg").show();
    				
    				console.error(status + " : " + error);
    			}
    		})
    		
    	});
    
    	
        function showTab(target) {
            var targetTab = target.attr("data-tab");

            //다른 버튼 on 제거
            $(".label-wrapper .label-btn").removeClass("on");
            //다른 탭 on 제거
            $(".label-tab").removeClass("on");

            //label에 on
            target.addClass("on");

            //tab에 on
            $("#userInfoModal").find("." + targetTab + "-wrapper").addClass("on");

        }

        function showUserList(target) {
            var targetType = target.prev("input[type='radio']").val();
            $("ul.user-list").addClass("off");
            $("input#searchKeyword").val("");
            $("ul.user-list li").show();
            $("ul.user-list." + targetType).removeClass("off");
        }

        function showUser(ptNo) {
        	
    		//현재 로그인한 트레이너 no 읽어오기
    		var trainerNo = ${authUser.userNo}
    		
    		//데이터 전송
    		$.ajax({
    			//보낼 때 옵션
    			url : "${pageContext.request.contextPath}/mypage2/ptInfo",
    			type : "post",
    			data : {ptNo: ptNo,
    					trainerNo: trainerNo},
    					
    			//받을 때 옵션
    			dataType : "json",
    			success : function(ptInfo) {
    				
    				$("#userName").text("\u00A0 "+ptInfo.name+" ("+ptInfo.gender+")");
    				$("p#userId").text("\u00A0 "+ptInfo.userId);
    				$("#phone").text("\u00A0 "+ptInfo.phone);
    				$("#period").text("\u00A0 "+ptInfo.startDate+" ~ "+ptInfo.endDate);
    				$("#count").text("\u00A0 "+ptInfo.scheduleCount+" / "+ptInfo.regCount);
    				$("textarea#memo").text(ptInfo.memo);
    				$("input#modifyPtNo").val(ptInfo.ptNo);
    				
    			},
    			error : function(XHR, status, error) {
    				console.error(status + " : " + error);
    			}
    		})
        	
            showModal("#userInfoModal");
        }

        function searchByKeyword(target) {
            var keyword = target.val();

            $("ul.user-list li").hide();

            $("span.name:contains('" + keyword + "')").parents("li").show();
            $("span.id:contains('" + keyword + "')").parents("li").show();
        }

        function showAddUserModal() {
    		$("div.user").empty();
        	$("p.errMsg").hide();
        	$("p.defaultMsg").show();
        	$("input[name='keyword']").val("");
        	
            showModal("#addUserModal");
        }
        
        //메모 수정하기
        function modifyMemo(memo, ptNo){
        	
        	//데이터 전송
    		$.ajax({
    			//보낼 때 옵션
    			url : "${pageContext.request.contextPath}/mypage2/modifyMemo",
    			type : "post",
    			data : {ptNo: ptNo,
    					memo: memo},
    					
    			//받을 때 옵션
    			dataType : "json",
    			success : function(result) {
					alert("메모가 저장되었습니다.");
    				
    			},
    			error : function(XHR, status, error) {
    				console.error(status + " : " + error);
    			}
    		})
        }

        function addUser() {
        	/* input, 회원 비엇을 때 버튼 막아야함 */
        	var userNo = $("input[name='userNo']").val();
        	
        	var period = $("input[name='period']").val();
        	
        	var regCount = $("input[name='regCount']").val();
        	
        	var trainerNo = ${authUser.userNo};
        	
        	if(!period || !regCount){
        		alert("입력 정보를 다시 확인해주세요.");
        		return;
        	}
        	
        	//데이터 전송
    		$.ajax({
    			//보낼 때 옵션
    			url : "${pageContext.request.contextPath}/mypage2/addPt",
    			type : "post",
    			data : {userNo: userNo,
    					period: period,
    					regCount: regCount,
    					trainerNo: trainerNo},
    					
    			//받을 때 옵션
    			dataType : "json",
    			success : function(result) {

		        	alert("PT 정보가 추가되었습니다.");

		        	forceHideModal('#addUserModal');
		        	
		        	location.reload(true);

    			},
    			error : function(XHR, status, error) {
    				alert("입력 정보를 다시 확인해주세요.");
    				
    				console.error(status + " : " + error);
    			}
    		})
        	
        }
    </script>
</body>
</html>
