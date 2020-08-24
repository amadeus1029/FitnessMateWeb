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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/recordForm.css">
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
        <div class="wrapper">
            <p>운동 기록 | August 13, 2020</p>
            <form action="" method="">

                <div id="first_select" class="box_color">
                    <p>운동 부위</p>
                    <ul>
                        <c:forEach items="${partList}" var="part">
                            <li onclick="showEx(${part.exPartNo})">${part.exPartName}</li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="fir-arrow"><i class="fas fa-arrow-circle-right"></i></div>

                <div id="second_select" class="box_color">
                    <p>운동 이름</p>
                    <ul>

                    </ul>
                </div>

                <div class="sec-arrow"><i class="fas fa-arrow-circle-right"></i></div>

                <div class="third_record">

                </div>
                <button type="button" class="button sub btn_save">저장</button>

            </form>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <script type="text/javascript">
        //두번째 리스트 보여주기
        $("#first_select ol li").on("click", function(){
            //리스트 리셋
            $("#second_select ol").html('');

            // 데이터 받아와서 리스트 만들어야함
            var secondList = '';
            secondList += '<li>플랭크</li>';
            secondList += '<li>버피</li>';
            secondList += '<li>스내치</li>';
            secondList += '<li>스윙</li>';
            secondList += '<li>쓰러스터</li>';

            $("#second_select ul").html(secondList);

        });

        //운동 기록 창 보여주기
        $("#second_select ul").on("click", "li", function(){
            //운동명 가져오기
            //식별번호/ajax 사용해서 name값 가져오는 걸로 수정 해야함
            var exerciseName = $(this).text();;

            var recordBox = '';
            recordBox += '<div class="box_color each">';
            recordBox += '    <div class="float_wrap">';
            recordBox += '        <p>'+exerciseName+'</p>';
            recordBox += '        <p class="btn_toggle"><i class="fas fa-caret-up"></i></p>';
            recordBox += '        <i class="far fa-minus-square setDelete"></i>';
            recordBox += '    </div>';
            recordBox += '    <div class="setPart">';
            recordBox += '        <div>';
            recordBox += '            <input type="text" name="weight" placeholder="무게">';
            recordBox += '            <input type="text" name="count" placeholder="횟수">';
            recordBox += '            <i class="far fa-plus-square"></i>';
            recordBox += '        </div>';
            recordBox += '    </div>';
            recordBox += '</div>';

            $(".third_record").append(recordBox);

        });
        //-버튼 눌렀을 때 운동 기록창 삭제
        $(".third_record").on("click", "i.setDelete", function(){
            $(this).closest("div.each").remove();
        });

        //+버튼 눌렀을 때 세트 추가
        $(".third_record").on("click", "i.fa-plus-square", function(){

            var addSet = '';
            addSet += '<div>';
            addSet += '    <input type="text" name="weight" placeholder="무게">';
            addSet += '    <input type="text" name="count" placeholder="횟수">';
            addSet += '    <i class="far fa-minus-square delSet"></i>';
            addSet += '</div>';

            $(this).closest(".setPart").append(addSet);

        });

        //-버튼 눌렀을 때 세트 삭제
        $(".third_record").on("click", "i.delSet", function(){
            $(this).closest("div").remove();
        });

        //입력창 접기
        $(".third_record").on("click", "i.fa-caret-up", function(){
            $(this).parents(".each").children(".setPart").slideUp();
            $(this).removeClass("fa-caret-up");
            $(this).addClass("fa-caret-down");
        });

        //입력창 열기
        $(".third_record").on("click", "i.fa-caret-down", function(){
            $(this).parents(".each").children(".setPart").slideDown();
            $(this).removeClass("fa-caret-down");
            $(this).addClass("fa-caret-up");
        });


    </script>
</body>
</html>

