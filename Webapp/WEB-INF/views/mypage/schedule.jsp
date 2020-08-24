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

    <!-- calendar css/js -->
    <link href='${pageContext.request.contextPath}/assets/js/calendar/main.css' rel='stylesheet'>
    <script src='${pageContext.request.contextPath}/assets/js/calendar/main.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/calendar/theme-chooser.js'></script>
    
    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage.css">

    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar;

            initThemeChooser({

                init: function (themeSystem) {
                    calendar = new FullCalendar.Calendar(calendarEl, {
                        themeSystem: themeSystem,
                        locales: 'ko',
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                        },
                        weekNumbers: false,
                        navLinks: true, // can click day/week names to navigate views
                        editable: false,
                        selectable: true,
                        nowIndicator: true,
                        dayMaxEvents: false, // allow "more" link when too many events
                        // showNonCurrentDates: false,
                        dateClick: function (info) {
                            //TODO - 날짜 클릭시 발생 이벤트
                            showModal("#addScheduleModal");

                        },
                        eventClick: function (info) {
                            //TODO - 일정 클릭시 발생 이벤트
                            event.stopPropagation();
                            $(".btn_pop").remove();

                            var target = $(info.el);
                            var left = target.offset().left + 100;
                            var top = target.offset().top - 60;
                            $("#calendar").append(
                                "<div class='btn_pop'>" +
                                "<button type='button' class='button btn_modify' onclick='btnModify();'>스케쥴변경</button>" +
                                "<a href='${pageContext.request.contextPath}/mypage/recordEx' class='button'>운동시작</a>" +
                                "<div>"
                            );
                            $(".btn_pop").css({
                                left: left,
                                top: top
                            })
                        },
                        height: 'auto',
                        events: [
                            {
                                title: '김영희 님',
                                start: '2020-08-01T09:00'
                            },
                            {
                                title: '김철수 님',
                                start: '2020-08-01T11:00'
                            },
                            {
                                title: '이영희 님',
                                start: '2020-08-01T14:00'
                            },
                            {
                                title: '박철민 님',
                                start: '2020-08-01T16:00'
                            },
                            {
                                title: '황정민 님',
                                start: '2020-08-01T191:00'
                            },
                            {
                                title: '김영희 님',
                                start: '2020-08-02T09:00'
                            },
                            {
                                title: '김철수 님',
                                start: '2020-08-02T11:00'
                            },
                            {
                                title: '이영희 님',
                                start: '2020-08-02T14:00'
                            },
                            {
                                title: '김영희 님',
                                start: '2020-08-05T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김길동 님',
                                start: '2020-08-06T09:00'
                            },
                            {
                                title: '김영희 님',
                                start: '2020-08-11T09:00'
                            },
                            {
                                title: '김영희 님',
                                start: '2020-08-17T09:00'
                            },
                            {
                                title: '김철수 님',
                                start: '2020-08-17T11:00'
                            },
                            {
                                title: '이영희 님',
                                start: '2020-08-17T14:00'
                            },
                            {
                                title: '박철민 님',
                                start: '2020-08-17T16:00'
                            },
                        ]
                    });
                    calendar.render();
                }
            });
        });
    </script>
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container" class="calendar-wrapper">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
        <div class="wrapper">
            <div id='top'>

                <div class='left'>

                    <div id='theme-system-selector' class='selector'>
                        Theme System:

                        <select>
                            <option value='bootstrap' selected>Bootstrap 4</option>
                            <option value='standard'>unthemed</option>
                        </select>
                    </div>

                    <div data-theme-system="bootstrap" class='selector' style='display:none'>
                        Theme Name:

                        <select>
                            <option value='' selected>Default</option>
                            <option value='cerulean'>Cerulean</option>
                            <option value='cosmo'>Cosmo</option>
                            <option value='cyborg'>Cyborg</option>
                            <option value='darkly'>Darkly</option>
                            <option value='flatly'>Flatly</option>
                            <option value='journal'>Journal</option>
                            <option value='litera'>Litera</option>
                            <option value='lumen'>Lumen</option>
                            <option value='lux'>Lux</option>
                            <option value='materia'>Materia</option>
                            <option value='minty'>Minty</option>
                            <option value='pulse'>Pulse</option>
                            <option value='sandstone'>Sandstone</option>
                            <option value='simplex'>Simplex</option>
                            <option value='sketchy'>Sketchy</option>
                            <option value='slate'>Slate</option>
                            <option value='solar'>Solar</option>
                            <option value='spacelab'>Spacelab</option>
                            <option value='superhero'>Superhero</option>
                            <option value='united'>United</option>
                            <option value='yeti'>Yeti</option>
                        </select>
                    </div>

                    <span id='loading' style='display:none'>loading theme...</span>

                </div>

                <div class='right'>
      <span class='credits' data-credit-id='bootstrap-standard' style='display:none'>
        <a href='https://getbootstrap.com/docs/3.3/' target='_blank'>Theme by Bootstrap</a>
      </span>
                    <span class='credits' data-credit-id='bootstrap-custom' style='display:none'>
        <a href='https://bootswatch.com/' target='_blank'>Theme by Bootswatch</a>
      </span>
                </div>

                <div class='clear'></div>
            </div>
            <div id='calendar'></div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <div class="modal-layer" id="addScheduleModal">
        <div class="modal-wrapper">
            <form action="" method="">
                <div class="modal-content">
                    <div class="select01">
                        <p class="text">시작시간</p>
                        <ol>
                            <li>
                                <input type="radio" id="startAm" name="startTime" value="am">
                                <label for="startAm">AM</label>
                            </li>
                            <li>
                                <input type="radio" id="startPm" name="startTime" value="pm">
                                <label for="startPm">PM</label>
                            </li>
                        </ol>
                        <select name="hour">
                            <option value="">시간</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select name="minute">
                            <option value="">분</option>
                            <option value="00">00</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                        </select>
                    </div>
                    <div>
                        <p class="text">종료시간</p>
                        <ol>
                            <li>
                                <input type="radio" id="endAm" name="endTime" value="am">
                                <label for="endAm">AM</label>
                            </li>
                            <li>
                                <input type="radio" id="endPm" name="endTime" value="pm">
                                <label for="endPm">PM</label>
                            </li>
                        </ol>
                        <select name="hour">
                            <option value="">시간</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select name="minute">
                            <option value="">분</option>
                            <option value="00">00</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                        </select>
                    </div>
                    <div>
                        <p class="text">회원이름</p>
                        <select name="user_name">
                            <option value="">회원이름</option>
                            <option value="">김영희(rladudgml)</option>
                            <option value="">김철수(rlacjftn)</option>
                            <option value="">이영희(dldudgml)</option>
                            <option value="">황정민(ghkdwjdals)</option>
                        </select>
                    </div>
                </div>
            </form>
            <div class="modal-btn-area">
                <button type="button" class="modal-cancel" onclick="forceHideModal('#addScheduleModal')">취소</button>
                <button type="button" class="modal-confirm" onclick="forceHideModal('#addScheduleModal')">확인</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {

            //화면 아무곳이나 클릭시 스케쥴 팝업 제거
            $(window).on("click",function () {
                $(".btn_pop").remove();

            });
        });//레디함수종료

        function btnModify() {
            $("select[name='hour']").find("option[value='9']").prop("selected", true);
            showModal("#addScheduleModal");
        }
    </script>
</body>
</html>
