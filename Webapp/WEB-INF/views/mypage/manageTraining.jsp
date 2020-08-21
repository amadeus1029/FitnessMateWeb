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
        <div class="wrapper clearfix">
            <form id="addExercise" class="clearfix">
                <h2>운동 추가하기</h2>
                <div class="input-box">
                    <h3 class="title">부위</h3>
                    <select name="part">
                        <option selected>전신</option>
                        <option>상체</option>
                        <option>승모</option>
                        <option>어깨</option>
                        <option>가슴</option>
                        <option>삼두</option>
                        <option>이두</option>
                        <option>전완</option>
                        <option>등</option>
                        <option>복부</option>
                        <option>코어</option>
                        <option>엉덩이</option>
                        <option>하체</option>
                    </select>
                </div>
                <div class="input-box">
                    <h3 class="title">운동명</h3>
                    <input type="text" name="name" placeholder="운동명을 입력해주세요">
                </div>
                <div class="input-box">
                    <h3 class="title">단위</h3>
                    <div class="radio-wrapper">
                        <input type="radio" id="amountKG" name="amount" value="kg" checked>
                        <label for="amountKG">킬로그렘</label>
                        <input type="radio" id="amountPound" name="amount" value="pound">
                        <label for="amountPound">파운드</label>
                        <input type="radio" id="amountTime" name="amount" value="time">
                        <label for="amountTime">시간(초)</label>
                    </div>
                </div>
                <button type="button" class="button main add-exercise" onclick="addExercise();">추가</button>
            </form>
            <div id="exerciseList">
                <h2>운동 목록</h2>
                <div class="exercise">
                    <h4 class="title">데드리프트</h4>
                    <p class="detail">
                        <span class="part">운동부위 : 코어</span>
                        <span class="amount">기록단위 : 킬로그램</span>
                    </p>
                    <button type="button" class="delete-btn" onclick="deleteExercise($(this));"><i
                            class="fas fa-times"></i></button>
                </div>
                <div class="exercise">
                    <h4 class="title">벤치프레스</h4>
                    <p class="detail">
                        <span class="part">운동부위 : 가슴</span>
                        <span class="amount">기록단위 : 파운드</span>
                    </p>
                    <button type="button" class="delete-btn"
                            onclick="deleteExercise($(this));"><i class="fas fa-times"></i></button>
                </div>
                <div class="exercise">
                    <h4 class="title">스쿼트</h4>
                    <p class="detail">
                        <span class="part">운동부위 : 하체</span>
                        <span class="amount">기록단위 : 킬로그램</span>
                    </p>
                    <button type="button" class="delete-btn" onclick="deleteExercise($(this));"><i class="fas fa-times"
                    ></i></button>
                </div>
                <div class="exercise">
                    <h4 class="title">매달리기</h4>
                    <p class="detail">
                        <span class="part">운동부위 : 등</span>
                        <span class="amount">기록단위 : 시간(초)</span>
                    </p>
                    <button type="button" class="delete-btn" onclick="deleteExercise($(this));"><i class="fas fa-times"
                    ></i></button>
                </div>
            </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <script type="text/javascript">
        function addExercise() {
            var result = true;
            var form = $("form#addExercise");
            var part = form.find("select[name='part']").find("option:selected").text();
            var name = form.find("input[name='name']").val();
            var amount = form.find("input[name='amount']:checked").next("label").text();

            if (name === "" || name == null) {
                result = false;
                alert("이름을 입력해주세요");
            }
            if (!result) {
                return result;
            }

            $("#exerciseList").append(
                "<div class='exercise'>" +
                "<h4 class='title'>" + name + "</h4>" +
                "<p class='detail'>" +
                "<span class='part'>운동부위 : " + part + "</span>" +
                "<span class='amount'>기록단위 : " + amount + "</span>" +
                "</p>" +
                "<button type='button' class='delete-btn' onclick='deleteExercise($(this))'>" +
                "<i class='fas fa-times'></i>" +
                "</button>" +
                "</div>"
            );
        }

        function deleteExercise(target) {
            target.parent("div.exercise").remove();
        }
    </script>
</body>
</html>
