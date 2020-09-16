<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
<fmt:formatDate value="${now}" pattern="MM" var="month" />
<fmt:formatDate value="${now}" pattern="dd" var="day" />

<div class="summary-wrapper">
    <div class="summary clearfix">
        <p class="date">${year}년 ${month}월 ${day}일</p>
         
        <c:choose>
    		<c:when test="${authUser.userType eq 'trainer'}">
	        <div class="statistics">
	            <dl class="review">
	                <dt>평점</dt>
	                <dd>${summary.summaryVo.avgScore}점 / ${summary.summaryVo.reviewCount}개</dd>
	            </dl>
	            <dl>
	                <dt>현재 회원 수</dt>
	                <dd>${summary.summaryVo.countCurrent}명</dd>
	            </dl>
	            <dl>
	                <dt>누적 회원 수</dt>
	                <dd>${summary.summaryVo.countAll}명</dd>
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
	    		<div class="statistics">
		            <dl class="review">
		            	<dt>다음 PT</dt>
		                <dd>${summaryNormal.nextPt.startTime} - ${summaryNormal.nextPt.endTime}</dd>
		            
		                <dt>등록기간</dt>
		                <dd>${summaryNormal.ptVo.startDate} ~ ${summaryNormal.ptVo.endDate}</dd>
		            </dl>
		            <dl>
		                <dt>잔여횟수</dt>
		                <dd>${summaryNormal.ptVo.regCount-summaryNormal.ptVo.scheduleCount} / ${summaryNormal.ptVo.regCount}</dd>
		            </dl>
		        </div>
		        
		        <div class="schedule-wrapper">
					<h3 class="title">예약 현황</h3>
					<div class="reserved-wrapper">
			            <ul class="schedule-list">
			            	<!-- 반복 -->
			                <li class="schedule">
			                    <span class="time"><i class="fas fa-check"></i>2020-09-17 PM 10:00 (확정)</span>
			                </li>
			                <li class="schedule">
			                    <span class="time"><i class="fas fa-times"></i>2020-09-24 PM 10:00 (반려)</span>
			                </li>
			                <li class="schedule">
			                    <span class="time">2020-10-01 PM 10:00 (요청)</span>
			                </li>
			                <!-- 반복끝 -->
						</ul>
	        		</div>
					<button id="btn-reserved" class="button sub">PT 예약하기</button>
				</div>		        
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