<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage2.css">

</head>

<body>
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<div id="container">
		<c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
		<div class="wrapper content-wrapper">
		<p>운동 내역</p>
		            
			<div id="first_select" class="box_color">
				<p>운동 날짜</p>
				<div>
					<ul>
						<c:forEach items="${exMap.exRecordDate}" var="date">
							<li onclick="showRecord(${date})">${date}</li>
						</c:forEach>
						
					</ul>
				</div>
			</div>

			<div id="second_select" class="box_color recordList">
				<p>${exMap.exRecordDate[0]}</p>
				<div>
					<c:forEach items="${exMap.exTitleList}" var="title">
						<table>
							<tr>
								<th rowspan="${title.setCount+1}">${title.exPart}</th>
								<td class="exTitle">${title.exName} (${title.setCount} set)</td>
							</tr>
							<c:forEach items="${exMap.exSetList}" var="detail">
								<c:if test="${title.exName eq detail.exName}">
									<tr>
										<td>${detail.amount} ${title.unit} ${detail.count}회</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>

					</c:forEach>
				</div>

			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<script type="text/javascript">
	
	$("")

/* 
            $.ajax({
                url: "${pageContext.request.contextPath}/mypage/addExercise",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(exVo),
                dataType: "json",
                success: function (result) {
                    if(result) {
                        $("#exerciseList").append(
                            "<div class='exercise'>" +
                            "<h4 class='title'>" + result.exName + "</h4>" +
                            "<p class='detail'>" +
                            "<span class='part'>운동부위 : " + result.exPartName + "</span>" +
                            "<span class='unit'>기록단위 : " + result.unit + "</span>" +
                            "</p>" +
                            "<button type='button' class='delete-btn' onclick='deleteExercise($(this),"+ result.exNo + ")'>" +
                            "<i class='fas fa-times'></i>" +
                            "</button>" +
                            "</div>"
                        );
                        form.find("input[name='exerciseName']").val("");
                    } else {
                        alert("Fail to add Exercise!")
                    }
                },
                error: function (XHR, status, error) {
                    console.error(status + ":" + error);
                }
            });

 */

    </script>
</body>
</html>
