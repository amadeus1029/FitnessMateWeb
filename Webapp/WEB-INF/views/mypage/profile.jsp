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
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
        <div class="wrapper">
            <form id="editProfileForm">
                <div class="main-info clearfix">
                    <div class="main-info-wrapper clearfix">
                        <img src="../assets/image/face/Park-Myung- Soo.jpg" class="profile-img">
                        <button type="button" class="button change-btn">이미지 변경</button>
                    </div>
                    <div class="main-info-wrapper">
                        <h3 class="title">이름</h3>
                        <input type="text" name="name" value="박명수">
                    </div>
                    <div class="main-info-wrapper">
                        <h3 class="title">소속</h3>
                        <input type="text" name="belong" value="무한도전 피트니스짐">
                    </div>
                </div>
                <div class="info-wrapper clearfix">
                    <div class="info">
                        <h3 class="title">나이</h3>
                        <input type="number" name="age" value="42">
                        <h3 class="title" style="margin-top: 20px;">성별</h3>
                        <div class="radio-wrapper clearfix">
                            <input type="radio" id="genderMale" name="gender" value="male" checked>
                            <label for="genderMale">남성</label>
                            <input type="radio" id="genderFemale" name="gender" value="female">
                            <label for="genderFemale">여성</label>
                        </div>
                    </div>
                    <div class="info">
                        <h3 class="title" style="width:240px;">지역</h3>
                        <select>
                            <option>전체</option>
                            <option selected>서울특별시</option>
                            <option>부산광역시</option>
                            <option>광주강역시</option>
                            <option>경기도</option>
                        </select>
                        <select>
                            <option>전체</option>
                            <option>송파구</option>
                            <option>구로구</option>
                            <option selected>서초구</option>
                            <option>영구</option>
                        </select>
                        <select>
                            <option>전체</option>
                            <option>송내동</option>
                            <option>가리봉동</option>
                            <option selected>홍길동</option>
                        </select>
                    </div>
                    <div class="info">
                        <h3 class="title">트레이너 경력</h3>
                        <input type="number" name="career" value="12">
                    </div>
                </div>
                <div class="info-wrapper clearfix">
                    <div class="category-info">
                        <h3 class="title">전문분야</h3>
                        <span class="category">다이어트</span>
                        <span class="category">재활</span>
                        <span class="category">프로필 촬영</span>
                        <select>
                            <option selected disabled>전문분야 추가하기</option>
                            <option>재활</option>
                            <option>기초체력 향상</option>
                            <option>근력 향상</option>
                            <option>프로필 촬영</option>
                            <option>대회 준비</option>
                            <option>체형 교정</option>
                        </select>
                    </div>
                    <div class="award-info">
                        <h3 class="title">입상경력</h3>
                        <span class="award">머슬마니아 3위</span>
                        <span class="award">전국체전 우수상</span>
                        <span class="award">체육관 개근상</span>
                        <span class="award">무사고 12년</span>
                    </div>
                </div>
                <div class="pay-wrapper">
                    <h3 class="title">비용</h3>
                    <textarea class="content"
                              name="pay">10회 이상 신청시 회당 5만원&#10;20회 이상 신청시 회당 4만원&#10;30회 이상 신청 시 회당 3만원</textarea>
                </div>
                <div class="comment-wrapper">
                    <h3 class="title">트레이너 메세지</h3>
                    <textarea class="content" name="comment">정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.</textarea>
                </div>
                <button type="submit" class="button main">저장하기</button>
            </form>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>
</html>
