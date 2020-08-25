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
                	
             <!-- 검색-->
            <!--  <form action="${pageContext.request.contextPath}/search/results" method="get"
            id="searchKeywordForm">-->
            <div id="searchKeywordForm">
                <ul class="search-condition clearfix">
                    <li class="local clearfix">
                        <h3 class="title">지역</h3>
                       <!--지역 고르기 -->
                        <select name="province">
                        	<option value="">전체</option>
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
                         	<option value="">전체</option>
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
                <button type="submit" class="button key">검색</button>
            <!-- </form> -->
           </div>
             <!-- 검색-->
            
            
            <!-- 트레이너목록-->
            <ul class="search-list clearfix">
            	<c:forEach items="${userVo}" var="userVo" varStatus = "status">
                <li class="search-result" onclick="showProfileModal($(this), ${userVo.userNo})">
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
            </ul>
            <!-- 트레이너목록-->
            
        </div> <!-- wrapper-->
        
    </div> <!--container-->
    
    
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
                        <input type="hidden" name="no" value="" id="delNo">
                            <p class="name info"></p>
                            <p class="belong"></p>
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
                            <p class="content age"></p>
                        </div>
                        <div class="info">
                            <h3 class="title">성별</h3>
                            <p class="content gender"></p>
                        </div>
                        <div class="info">
                            <h3 class="title">지역</h3>
                            <p class="content location"></p>
                        </div>
                        <div class="info">
                            <h3 class="title">트레이너 경력</h3>
                            <p class="content career"></p>
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
                        <p class="content price"></p>
                    </div>
                    <div class="comment-wrapper">
                        <h3 class="title">트레이너 메세지</h3>
                        <p class="content introduction"></p>
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

   
    //검색
    $(".button.key").on("click",function(){
	   console.log("검색버튼");
	   //값 추출
	   var user ={province:$("[name='province']").val(),
			      city:$("[name='city']").val(),
			      region:$("[name='region']").val(),
			      gender:$("[name='gender']:checked").val(),
			      field:$("[name='field']").val(),
			      name:$("[name='name']").val()}
		
	   console.log(user);
	   	   
	   $.ajax({
			url : "${pageContext.request.contextPath }/search/results",
			type : "post",
			data : user,

			dataType : "",
			success : function(userVo) {
				/*성공시 처리해야될 코드 작성*/
				$("ul.search-list").empty();
				console.log(userVo);
				var userStr = "";
				
				for (var i in userVo ) {
					userStr += "<li class='search-result' onclick='showProfileModal($(this),"+userVo[i].userNo+")'>";
					userStr += '<div class="image-area" style="background-image:url("${pageContext.request.contextPath}\\assets\\image\\face\\Gangho-dong.jpg");">;'
					userStr += "</div>";
					userStr += "<div class='content-area'>";
					userStr += "<p class='name'>"+userVo[i].name+"</p>";
					userStr += "<p class='gym'>"+userVo[i].company+"</p>";
					userStr += "<p class='comment'>"+userVo[i].introduction+"</p>";
					userStr += "<p class='score'>평점 4.7</p>";
					userStr += "</div>";
					userStr += "</li>";
				}
			
				$("ul.search-list").append(userStr);
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
    });
    
    
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
				/*성공시 처리해야될 코드 작성*/
				var cityStr ='<option value="" >전체</option>';
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
				var regionStr ='<option value="">전체</option>';
				for (var i in regionList ) {
					regionStr +='<option>'+regionList[i].region+'</option>';
					
				}
				$("select[name='region']").append(regionStr);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
    });
    
    
    
    //트레이너 상세정보,별점 반영하기
    function showProfileModal(obj, userNo) {
    	
    	//트레이너 넘버 추출
    	var no = userNo;
    	console.log("no "+no);
    	$("#delNo").val(no);
    	

    	 //다른 버튼 on 제거
    	 $("#profileModal .label-wrapper .label-btn").removeClass("on");
    	 $("#profileModal .label-wrapper .profile-btn").addClass("on");
    	 //다른 탭 on 제거
    	 $("#profileModal .label-tab").removeClass("on");
    	 $("#profileModal .profile-wrapper").addClass("on");

            
          //데이터전송
        	$.ajax({
        			url : "${pageContext.request.contextPath }/search/trainerInfo",
        			type : "post",
        			//contentType : "application/json",
        			data : {no: no},

        			dataType : "json",
        			success : function(vo) {
        				var loca = vo.location.replace( /[|]/gi, ' ');//지역 사이의 | 지우기
        				
        				//만나이 계산
        				var birthday = new Date(vo.birthDate);
        				console.log(birthday);
        				var today = new Date();
        				var years = today.getFullYear() - birthday.getFullYear();
        				console.log(years);
        				// Reset birthday to the current year.
        				birthday.setFullYear(today.getFullYear());
        				 
        				// If the user's birthday has not occurred yet this year, subtract 1.
        				if (today < birthday)
        				{
        				    years--;
        				}
        				//만나이 계산
        				
        				
        				//정보넣기
        				$(".name.info").html(vo.name); //이름
        				$(".belong").html(vo.company); //회사
        				
        				//성별 
        				if(vo.gender =='female')
        				{$(".content.gender").html("여자"); 
        				} else{$(".content.gender").html("남자");}
        				$(".content.location").html(loca); //지역
        				$(".content.career").html(vo.career+"년"); //경력
        				$(".content.price").html(vo.price); //가격
        				$(".content.introduction").html(vo.introduction); //자기소개
        				$(".content.age").html("만"+years+"세");
        				
        			},
        			error : function(XHR, status, error) {
        				console.error(status + " : " + error);
        			}
        		});
            
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
		
        //별점 선택
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
                "   <img class='user-profile-img' src=('${pageContext.request.contextPath}/assets/image/review-test2.jpg' );>"+
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