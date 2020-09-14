<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/image/favicon.ico"/>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signUpCommon.css">
	
</head>
<body>

    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <!-- header가 필요한 페이지에서 사용 -->

    <div id="container">
       
        <div class="wrapper">
            <form action="${pageContext.request.contextPath}/user/signUp" method="post" enctype="multipart/form-data">
                <p class="title">기본정보 입력</p>
                <p>아이디</p>
                <input type="text" name="userId" placeholder="id">
                <p class="errMsg">이미 사용 중인 아이디 입니다.</p>
                <p class="emtMsg">사용 불가한 아이디 입니다.</p>
                <p class="okMsg">사용 가능한 아이디 입니다.</p>
                
                <button type="button" id="idCheck">중복 확인</button>
                <p>비밀번호</p>
                <input type="password" id="pw" name="password" placeholder="********">
                <p>비밀번호 확인</p>
                <input type="password" id="pwCheck" placeholder="********">
                <p>이름</p>
                <input type="text" name="name" placeholder="김이름">
                <p>휴대전화번호</p>
                <input type="text" name="phone" placeholder="010-0000-1111">
                <p>성별</p>
                <input type="radio" id="male" name="gender" value="male">
                <label for="male">남</label>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">여</label>
                <p>프로필 이미지</p>
                <img id="proImg" src="${pageContext.request.contextPath}/assets/image/unnamed.jpg">
                <input type="file" id="imgPreview" name="profileImage">
          		<input type="hidden" name="userType" value="${param.userType}">
                
				<c:choose>
                	<c:when test="${param.userType eq 'trainer'}">
                		<button type="submit" class="button main">다음</button>
                	</c:when>
                	<c:otherwise>
                		<button type="submit" class="button main">완료</button>
	                </c:otherwise>
				</c:choose>
				
            </form>

        </div>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <!-- footer가 필요한 페이지에서 사용 -->


</body>

<script type="text/javascript">
	//아이디 중복체크 변수 선언
	var uniqueId = false;

    $(document).ready(function (){
       $(".errMsg").hide();
       $(".okMsg").hide();
       $(".emtMsg").hide();
    })

	//프로필 미리보기
    $("input[name='profileImage']").on("change", function(){
    	var reader = new FileReader();
    	
        reader.onload = function (e) {
            document.getElementById("proImg").src = e.target.result;
        };

        reader.readAsDataURL(this.files[0]);
    });

    // 아이디 체크
    $("#idCheck").on("click", function(){
        // 데이터 받아와서 확인하기
        var newId = $("input[name='userId']").val();
		console.log("newId: "+newId);
		
		$.ajax({
			
			url : "${pageContext.request.contextPath}/user/idCheck",		
			type : "post",
			data : {newId: newId},

			dataType : "json",
			success : function(result){
				console.log(result);
				
				/*성공시 처리해야될 코드 작성*/
				if(result == false){
					//중복 아이디인 경우
			        $(".errMsg").show();
			        $(".emtMsg").hide();
			        $(".okMsg").hide();
				} else{
					if(newId == ""){
						//공란인경우
				        $(".errMsg").hide();
						$(".emtMsg").show();
				        $(".okMsg").hide();
					}else {
					//사용가능한 아이디인 경우
					$(".errMsg").hide();
					$(".emtMsg").hide();
			        $(".okMsg").show();
			        uniqueId = true;
					}
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			} 
		})

    });
    
    $("button.main").on("submit", function(){
    	console.log("아이디"+$("input[name='userId']").val());
    	
		//아이디를 입력해 주세요
		if($("input[name='userId']").val() == ""){
			alert("아이디를 입력해주세요");
			return false;
		}
		
		// 아이디 중복체크를 해주세요
		if(uniqueId == false){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
		//패스워드를 입력해 주세요
		if($("#pw").val() == ""){
			alert("패스워드를 입력해주세요");
			return false;
		}
		
		//이름을 입력해 주세요
		if($("input[name='name']").val() == ""){
			alert("이름 입력해주세요");
			return false;
		}

		//패스워드가 일치하지 않습니다
		if($("#pw").val() != $("#pwCheck").val()){
			alert("패스워드가 일치하지 않습니다");
			return false;
		}
		
	});

    
    
</script>
</html>