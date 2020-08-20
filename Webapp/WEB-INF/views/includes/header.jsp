<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<header id="header">
    <div class="wrapper clearfix">
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/main">
                <img src="${pageContext.request.contextPath}/assets/image/logoB.jpeg" title="logo" alt="logo">
            </a>
        </h1>
        <a href="${pageContext.request.contextPath}/search" class="search-link"><i class="fas fa-search"></i></a>
        <nav id="nav">
        </nav>
        <div class="btn-area clearfix">
        	<c:choose>
        		<c:when test="${empty authUser}">
		            <a href="${pageContext.request.contextPath}/user/signUp" class="button sub">회원가입</a>
		            <a href="#none" class="button main" id="btn_login">로그인</a>
	            </c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/mypage/schedule" class="button sub">마이페이지</a>
		            <a href="#none" class="button main" id="btn_login">로그아웃</a>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<!-- 모달임미다 -->
    <div class="modal-layer" id="loginModal">
        <div class="modal-wrapper">
            <div class="modal-content">
                <p>로그인</p>
            </div>
            <div class="modal-btn-area">
                <table>
                    <colgroup>
                      <col style="width: 100px;">
                      <col style="">
                  	</colgroup>
                    <tr>
                        <th><label for="userId">아이디</label></th>
                        <td><input id="userId" type="text" name="id"></td>
                    </tr>
                    <tr>
                        <th><label for="userPw">패스워드</label></th>
                        <td><input id="userPw" type="password" name="password"></td>   
                                       
                    </tr> 
                    <tr>
                        <c:if test="${param.result eq 'fail'}">
                            <td colspan="2" colspan="2">
                                <span class="errMsg">아이디 또는 비번을 확인해 주세요.</span>
                            </td>
                        </c:if>
                    </tr> 
                </table>
                <button type="button" class="modal-cancel" onclick="forceHideModal('#testModal')">취소</button>
                <button type="button" class="modal-confirm">로그인</button>
            </div>
        </div>
    </div>

    
    
<script type="text/javascript">

	$("#btn_login").on("click", function(){
	    // 이벤트 초기화
	    event.preventDefault();
	
	    // input 초기화
	    $("#userId").val("");
	    $("#userPw").val("");
	
	    showModal("#loginModal");
	});
	
	$(".modal-cancel").on("click", function(){
	    forceHideModal('#loginModal')
	});
	
	$(".modal-confirm").on("click", function(){
	
	    // 데이터 보내서 세션에 저장해야함
	
	    forceHideModal('#loginModal')
	});

</script>