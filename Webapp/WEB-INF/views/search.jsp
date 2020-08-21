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

    <!-- 해당 페이지 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<div id="container">
        <div class="test-background" style="background-color: #dadde6;height: 350px;">
        </div>
        <div class="wrapper">
        
        
            <form action="" method="get"
            id="searchKeywordForm">
                <ul class="search-condition clearfix">

                    <li class="local clearfix">
                    
                    
                        <h3 class="title">지역</h3>
                        <!--지역 고르기 -->
                        <select name="province">
                        	<option value="null">전체</option>
                         <c:forEach items="${addVo}" var="addVo">
                            <option >${addVo.province}</option>
                         </c:forEach>
                        </select>
                        
                        <!--구 고르기 -->
                        <select name="city" >
                        </select>
                        
                        <!--동 고르기 -->
                        <select name="region">
                        </select>
                        
                        
                        
                    </li>
                    <li class="gender">
                        <h3 class="title">성별</h3>
                        <div class="radio-wrapper clearfix">
                            <input type="radio" id="genderMale" name="gender" value="male">
                            <label for="genderMale">남성</label>
                            <input type="radio" id="genderFemale" name="gender" value="female">
                            <label for="genderFemale">여성</label>
                        </div>
                    </li>
                    
                    
                    
                    <li class="field">
                        <h3 class="title">전문분야</h3>
                         <select name="field">
                         	<option value="null">전체</option>
	                        <c:forEach items="${fieldVo}" var="fieldVo">
	                         <option>${fieldVo.fieldName}</option>
	                        </c:forEach>
                        </select>
                    </li>
                    
                    
                    
                    <li class="keyword">
                        <h3 class="title">검색어</h3>
                        <input name="name" type="text" placeholder="검색어를 입력해주세요">
                    </li>
                    
                </ul>
                <button type="button" class="button key">검색</button>
            </form>
            
            
            
            
            <ul class="search-list clearfix">
            
            	<c:forEach items="${userVo}" var="userVo" varStatus = "status">
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Gangho-dong.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">${userVo.name}</p>
                        <p class="gym">${userVo.company}</p>
                        <p class="comment">${userVo.introduction}</p>
                        <p class="score">평점 4.7</p>
                    </div>
                </li>
                </c:forEach>
                
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Lee-Kwang-soo.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">이광수</p>
                        <p class="gym">러닝맨</p>
                        <p class="comment">정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다.
                            대통령후보자가 1인일 때에는 그 득표수가 선거권자 총수의 3분의 1 이상이 아니면 대통령으로 당선될 수 없다.</p>
                        <p class="score">평점 4.2</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/LeeHyoRi.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">이효리</p>
                        <p class="gym">제주도</p>
                        <p class="comment">모든 국민은 거주·이전의 자유를 가진다. 헌법에 의하여 체결·공포된 조약과 일반적으로 승인된 국제법규는 국내법과 같은 효력을 가진다.
                            국가는 전통문화의 계승·발전과 민족문화의 창달에 노력하여야 한다.

                        </p>
                        <p class="score">평점 4.9</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Yoo-Jae-Suk.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">유재석</p>
                        <p class="gym">무한도전</p>
                        <p class="comment">행정각부의 설치·조직과 직무범위는 법률로 정한다. 대통령은 국가의 독립·영토의 보전·국가의 계속성과 헌법을 수호할 책무를 진다. 선거와
                            국민투표의 공정한 관리 및 정당에 관한 사무를 처리하기 위하여 선거관리위원회를 둔다.</p>
                        <p class="score">평점 4.5</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Jeongjae-Lee.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">이정재</p>
                        <p class="gym">골드문</p>
                        <p class="comment">감사원은 세입·세출의 결산을 매년 검사하여 대통령과 차년도국회에 그 결과를 보고하여야 한다. 모든 국민은 사생활의 비밀과 자유를 침해받지
                            아니한다.</p>
                        <p class="score">평점 3.8</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Yang-Se-chan.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">양세찬</p>
                        <p class="gym">아 모르겠다</p>
                        <p class="comment">국가는 대외무역을 육성하며, 이를 규제·조정할 수 있다. 모든 국민은 법률이 정하는 바에 의하여 국가기관에 문서로 청원할 권리를 가진다.
                            군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다.
                        </p>
                        <p class="score">평점 4.2</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/Park-Myung- Soo.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">박명수</p>
                        <p class="gym">무한도전</p>
                        <p class="comment">대통령은 조약을 체결·비준하고, 외교사절을 신임·접수 또는 파견하며, 선전포고와 강화를 한다. 국가는 농지에 관하여 경자유전의 원칙이
                            달성될 수 있도록 노력하여야 하며, 농지의 소작제도는 금지된다.
                        </p>
                        <p class="score">평점 2.8</p>
                    </div>
                </li>
                <li class="search-result" onclick="showProfileModal($(this))">
                    <div class="image-area" style="background-image: url('${pageContext.request.contextPath}/assets/image/face/JungWooSung.jpg');">
                    </div>
                    <div class="content-area">
                        <p class="name">정우성</p>
                        <p class="gym">비트</p>
                        <p class="comment">정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다. 법관은 탄핵 또는 금고
                            이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.</p>
                        <p class="score">평점 3.5</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="modal-layer" id="profileModal">
        <div class="modal-wrapper">
            <button type="button" class="close-btn" onclick="forceHideModal('#profileModal')">X</button>
            <div class="label-wrapper clearfix">
                <button type="button" class="label-btn profile-btn on" data-tab="profile" onclick="showTab($(this))">프로필</button>
                <button type="button" class="label-btn review-btn" data-tab="review" onclick="showTab($(this))">리뷰</button>
                <button type="button" class="label-btn location-btn" data-tab="location" onclick="showTab($(this))">위치</button>
            </div>
            <div class="modal-content">
                <div class="label-tab profile-wrapper on">
                    <div class="summary-wrapper clearfix">
                        <img src="${pageContext.request.contextPath}/assets/image/face/Park-Myung- Soo.jpg" class="profile-img">
                        <div class="summary">
                            <p class="name">박명수</p>
                            <p class="belong">무한도전 피트니스짐</p>
                        </div>
                        <div class="score">
                            <p class="head">평점</p>
                            <p class="body">4.7점</p>
                        </div>
                        <div class="score">
                            <p class="head">리뷰수</p>
                            <p class="body">117개</p>
                        </div>
                    </div>
                    <div class="info-wrapper clearfix">
                        <div class="info">
                            <h3 class="title">나이</h3>
                            <p class="content">42세</p>
                        </div>
                        <div class="info">
                            <h3 class="title">성별</h3>
                            <p class="content">남성</p>
                        </div>
                        <div class="info">
                            <h3 class="title">지역</h3>
                            <p class="content">서울특별시 강남구 압구정동</p>
                        </div>
                        <div class="info">
                            <h3 class="title">트레이너 경력</h3>
                            <p class="content">12년</p>
                        </div>
                    </div>
                    <div class="info-wrapper clearfix">
                        <div class="category-info">
                            <h3 class="title">전문분야</h3>
                            <span class="category">다이어트</span>
                            <span class="category">재활</span>
                            <span class="category">프로필 촬영</span>
                        </div>
                        <div class="award-info">
                            <h3 class="title">입상경력</h3>
                            <span class="award">머슬마니아 3위</span>
                            <span class="award">전국체전 우수상</span>
                            <span class="award">체육관 개근상</span>
                            <span class="award">무사고 12년</span>
                        </div>
                    </div>
                    <div class="pay-wrapper">
                        <h3 class="title">비용</h3>
                        <p class="content">10회 이상 신청시 회당 5만원<br>20회 이상 신청시 회당 4만원<br>30회 이상 신청 시 회당 3만원</p>
                    </div>
                    <div class="comment-wrapper">
                        <h3 class="title">트레이너 메세지</h3>
                        <p class="content">정당은 그 목적·조직과 활동이 민주적이어야 하며, 국민의 정치적 의사형성에 참여하는데 필요한 조직을 가져야 한다. 법관은 탄핵 또는 금고
                            이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.</p>
                    </div>
                </div>
                <div class="label-tab review-wrapper">

                    <div class="reviewWrite">
                        <span>리뷰작성</span>
                        
                       
                        <div id="star_grade">
                            <input type="hidden"  name="reviewScore" value="0">
                            <i for="p1" class="fas fa-star" data-score="1"></i>
                            <i for="p2" class="fas fa-star" data-score="2"></i>
                            <i for="p3" class="fas fa-star" data-score="3"></i>
                            <i for="p4" class="fas fa-star" data-score="4"></i>
                            <i for="p5" class="fas fa-star" data-score="5"></i>
                        </div>
                       
                        <textarea class="content" name='content' placeholder="사용하시면서 달라진 만족도에 대한 후기를 남겨주세요(최소 10자 이상)"></textarea>

                        <div>
                            <input  type="file" id="file"  name="file_name" class="image_inputType_file" >
                           
                        </div>
                        
                        <button class="button revW" type="submit">작성</button>

                    </div>


                    <ul class="review-list">
                        <li class="review-line">


                            <div class="user-profile ff">

                                <img class="user-profile-img" src='${pageContext.request.contextPath}/assets/image/unnamed.jpg'>

                                <div class="user-profile-info">
                                    <div class="user-profile-name">김**</div>
                                    <div class="user-profile-date">운동기간- n개월</div>
                                    <div class="user-profile-date">2020-08-11</div>
                                </div>
                                <div class="user-profile-star fd">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>

                            </div>

                            <div class="box">
                                <div class="content">여긴 리뷰내용 쓰는 곳입니다.
                                    리뷰내용은 쏼라쏼라쏼라입니다.<br>
                                    가나다라마바사아자차카타파하아야어여오요우유 으이~
                                </div>
                            </div>

                            <img class="review-imgSize" onclick="showModal('#testModal')"
                                 src='${pageContext.request.contextPath}/assets/image/unnamed.jpg'>
                            <img class="review-imgSize" onclick="showModal('#testModal')"
                                 src='${pageContext.request.contextPath}/assets/image/main-test-02.jpg'>
                            <img class="review-imgSize" onclick="showModal('#testModal')"
                                 src='${pageContext.request.contextPath}/assets/image/review-test2.jpg'>
                            <div class="clearfix review-btn-area">
                                <button type="button" class="button">삭제</button>
                                <button type="button" class="button">수정</button>
                            </div>
                        </li>
                        <li class="review-line">

                            <div class="user-profile ff">

                                <img class="user-profile-img" src='${pageContext.request.contextPath}/assets/image/review-test2.jpg'>

                                <div class="user-profile-info">
                                    <div class="user-profile-name">이**</div>
                                    <div class="user-profile-date">운동기간- n개월</div>
                                    <div class="user-profile-date">2020-08-11</div>
                                </div>
                                <div class="user-profile-star fd" >
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                            </div>

                            <div class="box">
                                <div class="content">여긴 리뷰내용 쓰는 곳입니다.
                                    리뷰내용은 쏼라쏼라쏼라입니다.<br>
                                    이 트레이너분 맨날 하나만 더라면서 열 번 더시킵니다.<br>
                                    완전 사기꾼이예요.
                                </div>
                            </div>
                            <div class="clearfix review-btn-area">
                                <button type="button" class="button">삭제</button>
                                <button type="button" class="button">수정</button>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="label-tab location-wrapper">위치</div>
            </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
    
    
    <script type="text/javascript">    
    
    //검색하기
  
    
    
    //구 불러오기
    $("select[name='province']").on("change",function(){
    	console.log("지역선택");
    	$("select[name='city']").empty();
    	$("select[name='region']").empty();
    	
    	var province = $(this).val();
    	
    	$.ajax({
			url : "${pageContext.request.contextPath }/search/getCity",
			type : "post",
			data : {province: province},

			dataType : "json",
			success : function(cityList) {
				console.log(cityList);
				/*성공시 처리해야될 코드 작성*/
				var cityStr ='<option value="null">전체</option>';
				for (var i in cityList ) {
					cityStr +='<option>'+cityList[i].city+'</option>';
					
				}
				$("select[name='city']").append(cityStr);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
    });
    
  	//동면리 불러오기
    $("select[name='city']").on("change",function(){
    	console.log("도시선택");
    	$("select[name='region']").empty();
    	
    	var city = $(this).val();
    	
    	$.ajax({
			url : "${pageContext.request.contextPath }/search/getRegion",
			type : "post",
			data : {city: city},

			dataType : "json",
			success : function(regionList) {
				/*성공시 처리해야될 코드 작성*/
				var regionStr ='<option value="null">전체</option>';
				for (var i in regionList ) {
					console.log(regionList[i].region);
					regionStr +='<option>'+regionList[i].region+'</option>';
					
				}
				$("select[name='region']").append(regionStr);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
    });
    
    
    
    
    function showProfileModal(obj) {
            //다른 버튼 on 제거
            $("#profileModal .label-wrapper .label-btn").removeClass("on");
            $("#profileModal .label-wrapper .profile-btn").addClass("on");
            //다른 탭 on 제거
            $("#profileModal .label-tab").removeClass("on");
            $("#profileModal .profile-wrapper").addClass("on");
            showModal("#profileModal");
        }

        function showTab(target) {
            var targetTab = target.attr("data-tab");

            //다른 버튼 on 제거
            $(".label-wrapper .label-btn").removeClass("on");
            //다른 탭 on 제거
            $(".label-tab").removeClass("on");

            //label에 on
            target.addClass("on");

            //tab에 on
            $("#profileModal").find("." + targetTab + "-wrapper").addClass("on");

        }

        $('#star_grade i').click(function(){
            $(this).parent().children("i").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("i").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var score = $(this).attr("data-score");
            $("input[name='reviewScore']").val(score);

        });
       
        //버튼 눌렀을 때 리뷰 추가
        $(".button.revW").on("click", function(){
            console.log("클릭")
        
            var name ='김**';
            var date = '운동기간-n개월';
            var date2 = '2020-08-17';
            var star = $("input[name='reviewScore']").val();
            var content = $("[name = 'content']").val();
            var img = $("#file").val();
            
            
            $(".review-list").prepend(
                "<li class='review-line'>"+
                " <div class='user-profile ff'>"+
                "   <img class='user-profile-img' src='${pageContext.request.contextPath}/assets/image/review-test2.jpg' );>"+
                "   <div class='user-profile-info'>"+
                "     <div class='user-profile-name'>"+name+"</div>"+
                "     <div class='user-profile-date'>"+date+"</div>"+
                "     <div class='user-profile-date'>"+date2+"</div>"+
                "   </div>"+
                        "<div class='user-profile-star fd'>"+
                        "</div>"+
                 "</div>"+
                " <div class='box'>"+
                "   <div class='content'>"+content+"</div>"+
                  "</div>"+
                  '<img class="review-imgSize" src="");>'+
                " <div class='clearfix review-btn-area'>"+
                "   <button type='button' class='button'>삭제</button>"+
                "   <button type='button' class='button'>수정</button>"+
                " </div>"+
                "</li>"
            ); 
            for(var i = 0; i<star; i++){
                $(".review-list li:first-child .user-profile-star").append(
                    '<i class="fas fa-star"></i>'  
                );
            }
            for(var i = 0; i<5-star; i++){
                $(".review-list li:first-child .user-profile-star").append(
                    '<i class="far fa-star"></i>'  
                );
            }
            var star = $("input[name='reviewScore']").val("");
            var content = $("[name = 'content']").val("");
            $('#star_grade i').removeClass("on"); 
       
        });
    </script>
</body>
</html>