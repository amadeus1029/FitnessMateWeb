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

    <!-- calendar css/js -->
    <link href='${pageContext.request.contextPath}/assets/js/calendar/main.css' rel='stylesheet'>
    <script src='${pageContext.request.contextPath}/assets/js/calendar/main.js'></script>
    <script src='${pageContext.request.contextPath}/assets/js/calendar/theme-chooser.js'></script>

    <style>

        #top {
            display: none;
        }

        #top .selector {
            display: inline-block;
            margin-right: 10px;
        }

        #top select {
            font: inherit; /* mock what Boostrap does, don't compete  */
        }

        .left {
            float: left
        }

        .right {
            float: right
        }

        .clear {
            clear: both
        }

        #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
            overflow: visible;
        }

        button.btn-primary {
            margin: 0;
            min-width: 0;
            width: 80px;
        }

        button.fc-prev-button, button.fc-next-button {
            min-width: 0;
            width: 50px;
        }

        button.fc-today-button {
            min-width: 0;
            display: inline-block;
        }

        td.fc-daygrid-day {
            position: relative;
        }

        td.fc-daygrid-day:after {
            content: '+';
            position: absolute;
            right: 5px;
            top: 5px;
            width: 24px;
            height: 24px;
            line-height: 20px;
            text-align: center;
            font-size: 24px;
            color: gray;
            opacity: 0;
            cursor: pointer;
            border: 1px solid gray;
        }

        td.fc-daygrid-day:hover:after {
            transition: all ease 0.7s 0s;
            opacity: 1;
        }

        .fc a.fc-daygrid-day-number {
            position: absolute;
            top: 0;
            left: 0;
        }

        .modal-wrapper {
            width: 400px;
            text-align: left;
        }

        select {
            width: 80px;
            height: 35px;
            display: inline-block !important;
        }

        select[name="user_name"] {
            width: 200px;
            margin-left: 30px;
        }

        .text {
            font-size: 20px;
            margin: 0 0 10px;
            font-weight: 700;
        }

        ol {
            margin: 0px 30px 0px 30px;
            float: left;
        }

        select[name="hour"], select[name="minute"] {
            margin-top: 10px;
        }

        p.text {
            margin-left: 30px;
        }

        .modal-wrapper .modal-btn-area button {
            margin-top: 30px;
        }

        .modal-wrapper .modal-content {
            padding-bottom: 0px;
        }

        .fc-daygrid-day-events {
            padding-top: 30px;
        }

        table tbody td.fc-day {
            height: 180px;
        }

        .btn_pop {
            position: absolute;
            z-index: 999;
            top: -60px;
            right: -80px;
            background-color: #fff;
            border: 1px solid #292c33;
            -webkit-transform: translate3d(0, 0, 0);
            -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .btn_pop button.button {
            border-radius: 0;
            margin: 0;
            width: 120px;
            border: 0;
        }
        .btn_pop button.button:hover {
            background-color: #dadde6;
        }

        .fc .fc-scroller-harness {
            overflow: visible;
        }
    </style>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar;

            initThemeChooser({

                init: function (themeSystem) {
                    calendar = new FullCalendar.Calendar(calendarEl, {
                        themeSystem: themeSystem,
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                        },
                        initialDate: '2020-08-12',
                        weekNumbers: false,
                        navLinks: true, // can click day/week names to navigate views
                        editable: false,
                        selectable: true,
                        nowIndicator: true,
                        dayMaxEvents: false, // allow "more" link when too many events
                        // showNonCurrentDates: false,
                        dateClick: function (info) {
                            //TODO - 날짜 클릭시 발생 이벤트
                            showModal("#addModal");

                        },
                        eventClick: function (info) {
                            //TODO - 일정 클릭시 발생 이벤트
                            event.stopPropagation();
                            $(".btn_pop").remove();
                            $(info.el).append(
                                "<div class='btn_pop'>" +
                                "<button type='button' class='button btn_modify' onclick='btnModify();'>스케쥴변경</button>" +
                                "<button type='button' class='button' onclick='startExercise();'>운동시작</button>" +
                                "<div>"
                            );
                        },
                        height: 'auto',
                        overflow: 'visible',
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
                },
                change: function (themeSystem) {
                    calendar.setOption('themeSystem', themeSystem);
                }
            });
        });
    </script>
</head>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
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
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    <script type="text/javascript">

        $(document).ready(function () {

            //화면 아무곳이나 클릭시 스케쥴 팝업 제거
            $(window).on("click",function () {
                $(".btn_pop").remove();

            });
        });//레디함수종료

        function btnModify() {
            $("select[name='hour']").find("option[value='9']").prop("selected", true);
            showModal("#addModal");
        }

        function startExercise() {
            location.href="recordForm.html";
        }
    </script>
</body>
</html>
