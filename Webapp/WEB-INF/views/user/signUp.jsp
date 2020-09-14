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

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/image/favicon.ico"/>

    <!-- icon 사용을 위한 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

    <!-- 반드시 넣어야 하는 2가지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">

    <!-- 반드시 넣어야 하는 2가지 js -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>


    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signUp.css">
</head>
<body>

    <header id="header">
        
        <div class="wrapper clearfix">
            <h1 class="logo">
                <a href="${pageContext.request.contextPath}/main">
                    <img src="${pageContext.request.contextPath}/assets/image/logoB.jpeg" title="logo" alt="logo">
                </a>
            </h1>
        </div>

    </header>
	<div id="container">
        <div class="signUpPart">

            <p class="bold">회원가입</p>
            <p>가입하고자 하는 유형을<br>
            아래에서 선택해주세요</p>
            <form action="${pageContext.request.contextPath}/user/signUpForm" method="get">
	            <div class="buttonPart">
	                <input type="radio" id="trainee" name="userType" value="normal">
	                <label for="trainee" class="button-label lable_trainee">
	                    일반회원
	                </label>
	                <p>or</p>
	                <input type="radio" id="trainer" name="userType" value="trainer">
	                <label for="trainer" class="button-label lable_trainer">
	                    트레이너 회원
	                </label>
	            </div>
	            <button type="submit" class="button main">회원가입</button>
            </form>

        </div>
        <div class="imgPart">

        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>

<script type="text/javascript">
    
    //회원유형 체크 안된 경우
    $("button.main").on("click", function(){
        var userType = $("input[name='userType']").is(":checked");

        if(userType == false){ 
            alert("회원유형을 선택해주세요");
            return false;
        }
    });


</script>

</html>