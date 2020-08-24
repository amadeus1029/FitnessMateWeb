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
		<div class="wrapper">
			<form id="editProfileForm"
				action="${pageContext.request.contextPath}/mypage/modifyProfile"
				method="post">
				<div class="main-info clearfix">
					<div class="main-info-wrapper clearfix">
						<img src="../assets/image/face/Park-Myung- Soo.jpg"
							class="profile-img">
						<button type="button" class="button change-btn">이미지 변경</button>
					</div>
					<div class="main-info-wrapper">
						<div class="info">
							<div class="main-info-wrapper">
								<h3 class="title">이름</h3>
								<input type="text" name="name" value="${profile.userVo.name}">
							</div>

							<h3 class="title" style="margin-top: 20px; margin-right: 200px;">성별</h3>
							<div class="radio-wrapper clearfix">
								<input type="radio" id="genderMale" name="gender" value="male"
									checked> <label for="genderMale">남성</label> <input
									type="radio" id="genderFemale" name="gender" value="female">
								<label for="genderFemale">여성</label>
							</div>
						</div>
					</div>


					<div class="main-info-wrapper">
						<h3 class="title">휴대전화번호</h3>
						<input type="text" name="name" value="${profile.userVo.phone}">

						<h3 class="title">생년월일</h3>
						<select name="birth">
							<option>년도</option>
							<c:forEach var="year" begin="1960" end="2020" step="1">
								<option value="${year}">${year}년</option>
							</c:forEach>
						</select> <select name="birth">
							<option>월</option>
							<c:forEach var="month" begin="1" end="12" step="1">
								<option value="${month}">${month}월</option>
							</c:forEach>
						</select> <select name="birth">
							<option>일</option>
							<c:forEach var="date" begin="1" end="31" step="1">
								<option value="${date}">${date}일</option>
							</c:forEach>
						</select>
					</div>

				</div>
				<div class="info-wrapper clearfix">

					<div class="category-info">
						<h3 class="title">관심분야</h3>
						<div class="checkboxPart">
							<input type="checkbox" id="interest-1" value="1" name="fieldNo">
							<label for="interest-1" class="button-label">기초체력향상</label> <input
								type="checkbox" id="interest-2" value="2" name="fieldNo">
							<label for="interest-2" class="button-label">근력향상</label> <input
								type="checkbox" id="interest-3" value="3" name="fieldNo">
							<label for="interest-3" class="button-label">체중감량</label> <input
								type="checkbox" id="interest-4" value="4" name="fieldNo">
							<label for="interest-4" class="button-label">대회준비</label> <input
								type="checkbox" id="interest-5" value="5" name="fieldNo">
							<label for="interest-5" class="button-label">프로필촬영</label> <input
								type="checkbox" id="interest-6" value="6" name="fieldNo">
							<label for="interest-6" class="button-label">체형교정</label> <input
								type="checkbox" id="interest-7" value="7" name="fieldNo">
							<label for="interest-7" class="button-label">재활</label>
						</div>
					</div>

					<div class="">
						<h3 class="title">운동 경력</h3>
						<input type="number" name="career"
							value="${profile.userVo.career}">
					</div>

				</div>

				<div class="comment-wrapper">
					<h3 class="title">프로필 메세지</h3>
					<textarea class="content" name="introduction">${profile.userVo.introduction}</textarea>
				</div>

				<input type="hidden" name="userNo" value="${authUser.userNo}">
				<button type="submit" class="button main">저장하기</button>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>


</html>
