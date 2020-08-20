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
            <form id="userSearchForm" class="clearfix">
                <h3 class="title">회원 검색</h3>
                <div class="radio-wrapper clearfix">
                    <input type="radio" id="nowMember" name="member" value="now" checked>
                    <label for="nowMember" onclick="showUserList($(this));">현재회원</label>
                    <input type="radio" id="formerMember" name="member" value="former">
                    <label for="formerMember" onclick="showUserList($(this));">이전회원</label>
                </div>
                <input type="text" id="searchKeyword" name="searchKeyword" placeholder="이름 혹은 아이디를 입력해주세요"
                       onkeyup="searchByKeyword($(this));">
                <button type="button" id="addUserBtn" class="button main" onclick="showAddUserModal();">회원 추가</button>
            </form>
            <ul class="user-list now clearfix">
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
                    <img src="${pageContext.request.contextPath}/assets/image/face/Jeongjae-Lee.jpg" alt="profile image" title="profile image">
                    <p class="info">
                        <span class="name">이정재</span>
                        <span class="id">imking2302</span>
                    </p>
                </li>
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
                    프로필 내역이 들어옵니다
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
    <div class="modal-layer" id="addUserModal">
        <div class="modal-wrapper">
            <div class="modal-content">
                <p class="title">회원 추가</p>
                <div class="search-wrapper clearfix">
                    <input type="text" name="keyword" placeholder="ID를 입력해주세요">
                    <button type="button" class="button search">검색</button>
                </div>
                <div class="search-result">
                    <%--TODO 정확히 아이디를 입력해서 검색했을 때 추가할 유저가 보이게 됩니다--%>
                    <%--TODO 검색해서 회원이 나타나고 스케쥴 횟수에 수치를 입력했을 때만 추가버튼이 활성화되게 할게요--%>
                    <div class="user clearfix">
                        <img src="${pageContext.request.contextPath}/assets/image/face/Lee-Kwang-soo.jpg" alt="profile image" title="profile image">
                        <p class="info">
                            <span class="name">이광수</span>
                            <span class="id">kslee0421</span>
                        </p>
                        <div class="schedule-input-wrapper clearfix">
                            <input class="schedule-input" type="number" name="schedule" placeholder="0" max="999">
                            <span class="mark">회</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-btn-area">
                <button type="button" class="modal-cancel" onclick="forceHideModal('#addUserModal')">취소</button>
                <button type="button" class="modal-confirm off main" onclick="addUser();">추가</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">

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

        function showUser() {
            showModal("#userInfoModal");
        }

        function searchByKeyword(target) {
            var keyword = target.val();

            $("ul.user-list li").hide();

            $("span.name:contains('" + keyword + "')").parents("li").show();
            $("span.id:contains('" + keyword + "')").parents("li").show();
        }

        function showAddUserModal() {
            showModal("#addUserModal");
        }

        function addUser() {
            <%--TODO 유저 추가는 이곳에서 ajax로 작동되게 하면 좋을거 같습니다--%>
            forceHideModal('#addUserModal');
        }
    </script>
</body>
</html>
