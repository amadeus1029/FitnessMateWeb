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

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/image/favicon.ico"/>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- header -->
	
	<div id="container">
        <section id="mainBanner">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/assets/image/main-test-01.jpg')">
                </div>
                <div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/assets/image/main-test-02.jpg')">
                </div>
                <div class="swiper-slide" style="background-image: url('${pageContext.request.contextPath}/assets/image/main-test-03.jpg')">
                </div>
            </div>
        </section>
        <div class="wrapper">
            <!-- 공간확보용 테스트 텍스트, 완성 후 삭제 -->
            <p style="padding:50px 0; font-size: 20px;line-height: 1.4">
                Where does it come from?
                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
            </p>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<script type="text/javascript">
        var swiper = new Swiper('#mainBanner', {
            loop: true,
            navigation: false,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false
            }
        });


    </script>
</body>
</html>