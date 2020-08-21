<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="summary-wrapper">
    <div class="summary clearfix">
        <p class="date">2020년 8월 17일</p>
        <div class="statistics">
            <dl class="review">
                <dt>평점</dt>
                <dd>4.7점 / 38개</dd>
            </dl>
            <dl>
                <dt>현재 회원 수</dt>
                <dd>23명</dd>
            </dl>
            <dl>
                <dt>누적 회원 수</dt>
                <dd>120명</dd>
            </dl>
        </div>
        <div class="schedule-wrapper">
            <h3 class="title">오늘의 일정</h3>
            <ul class="schedule-list">
                <li class="schedule">
                    <span class="name">김상철 회원님</span>
                    <span class="time">AM 08:00 - 10:00</span>
                </li>
                <li class="schedule">
                    <span class="name">정희봉 회원님</span>
                    <span class="time">AM 10:00 - 11:00</span>
                </li>
                <li class="schedule">
                    <span class="name">홍길동 회원님</span>
                    <span class="time">AM 11:00 - 12:00</span>
                </li>
                <li class="schedule">
                    <span class="name">고구마 회원님</span>
                    <span class="time">PM 2:00 - 3:00</span>
                </li>
                <li class="schedule">
                    <span class="name">김구리 회원님</span>
                    <span class="time">PM 3:00 - 4:00</span>
                </li>
                <li class="schedule">
                    <span class="name">가나다 회원님</span>
                    <span class="time">PM 5:00 - 6:00</span>
                </li>
            </ul>
        </div>

    </div>
</div>
<div class="menu-wrapper">
    <ul class="menu clearfix">
        <li><a href="${pageContext.request.contextPath}/mypage/schedule">스케쥴</a></li>
        <li><a href="${pageContext.request.contextPath}/mypage/manageTraining">운동 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/mypage/manageUser">회원 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/mypage/profile">프로필 수정</a></li>
    </ul>
</div>