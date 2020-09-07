<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="summary-wrapper">
    <div class="summary clearfix">
        <p class="date">2020년 8월 17일</p>
        <c:choose>
    		<c:when test="${authUser.userType eq 'trainer'}">
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
	            	<c:forEach items="${summary.scheduleList}" var="schedule">
		                <li class="schedule">
		                    <span class="name">${schedule.userName} 회원님</span>
		                    <span class="time">${schedule.startTime} - ${schedule.endTime}</span>
		                </li>
		                </c:forEach>
	
	            </ul>
	        </div>
		    </c:when>
		    
    		<c:otherwise>
    			무엇을 넣어야하나요
    		</c:otherwise>
   		</c:choose>
    </div>
</div>
<div class="menu-wrapper">
    <ul class="menu clearfix">
    	<c:choose>
    		<c:when test="${authUser.userType eq 'trainer'}">
		        <li><a href="${pageContext.request.contextPath}/mypage/schedule">스케쥴</a></li>
		        <li><a href="${pageContext.request.contextPath}/mypage/manageExercise">운동 관리</a></li>
		        <li><a href="${pageContext.request.contextPath}/mypage2/manageUser">회원 관리</a></li>
		        <li><a href="${pageContext.request.contextPath}/mypage/profile">프로필 수정</a></li>
    		</c:when>
    		<c:otherwise>
		        <li><a href="${pageContext.request.contextPath}/mypage2/exerciseRecord">운동기록</a></li>
		        <li><a href="${pageContext.request.contextPath}/mypage2/inbodyRecord">인바디내역</a></li>
		        <li><a href="${pageContext.request.contextPath}/mypage/profile">프로필 수정</a></li>
    		</c:otherwise>
   		</c:choose>
    </ul>
</div>