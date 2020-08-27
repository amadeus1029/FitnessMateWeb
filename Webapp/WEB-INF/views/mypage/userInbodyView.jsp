<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/fontawesome/all.css">

    <!-- 반드시 넣어야 하는 2가지 css -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/common.css">

    <!-- 반드시 넣어야 하는 2가지 js -->
    <script
            src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/modal.js"></script>

    <!-- slide -->
    <link
            href="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/css/swiper.min.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/assets/js/swiper-4.2.6/dist/js/swiper.min.js"></script>

    <!-- 해당 페이지 css -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/mypage.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/mypage2.css">

</head>

<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
    <div id="container">
        <c:import url="/WEB-INF/views/mypage/includes/menu.jsp"></c:import>
       
        <div class="wrapper content-wrapper">
            <p>인바디내역</p>
                
            <div class="box_color">
                <p>측정 날짜</p>
                <div>
                    <ol class="dateList">
                        <c:forEach items="${inbodyInfo.inbodyList}" var="inbody">
	                        <li data-inbodyno="${inbody.inbodyNo}">${inbody.measureDate}</li>
                        </c:forEach>
                    </ol>
                </div>
            </div>

            <div class="tableBox">
                <p>${inbodyInfo.recentInbody.measureDate}</p>
                <table>
                    <tr>
                        <th>체중 (kg)</th>
                        <td id="weight">${inbodyInfo.recentInbody.weight} kg</td>
                    <tr>
                        <th>체지방률 (%)</th>
                        <td id="percentFat">${inbodyInfo.recentInbody.percentFat} %</td>
                    </tr>
                    <tr>
                        <th>골격근량 (kg)</th>
                        <td id="muscleMass">${inbodyInfo.recentInbody.muscleMass} kg</td>
                    </tr>
                    <tr>
                        <th>BMI (kg/m²)</th>
                        <td id="bmi">${inbodyInfo.recentInbody.bmi} kg/m²</td>
                    </tr>
                </table>
            </div>        


            <div class="graphBox">

            </div>

        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
</body>

<script type="text/javascript">
	
	$("ol.dateList li").on("click", function(){
		var inbodyNo = $(this).data("inbodyno");
		console.log("inbodyNo : "+inbodyNo);
	});
	
	
    //주소 3차 분류 가져오기 함수
    function getRegion(thisCity) {

        $.ajax({

            url: "${pageContext.request.contextPath}/api/getRegion",
            type: "post",
            data: {
                thisCity: thisCity
            },

            dataType: "json",
            success: function (regionList) {

                /*성공시 처리해야될 코드 작성*/
                var regionStr = '<option>전체</option>';

                for (var i in regionList) {
                    regionStr += '<option>' + regionList[i] + '</option>';
                }

                $("select[name='region']").append(regionStr);

            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        })

    };
</script>

</html>
