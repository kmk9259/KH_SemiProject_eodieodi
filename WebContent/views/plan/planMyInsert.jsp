<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy, semiProject.com.kh.place.model.vo.Place,
    semiProject.com.kh.member.model.vo.Member, semiProject.com.kh.area.model.vo.Area"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");  
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Area> aList = (ArrayList<Area>)request.getAttribute("aList");
%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>내 맘대로 일정 계획</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css" type="text/css">

    <!-- 제이쿼리 피커데이트 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

    <style>
    	.filter {
			position: fixed;
			left: 0;
			top: 0;
			width: 480px;
			height: 100%;
			background: #ffffff;
			padding: 30px 34px 30px 30px;
			overflow-y: scroll;
			-webkit-box-shadow: 0px 5px 14px rgba(0, 0, 0, 0.1);
			box-shadow: 0px 5px 14px rgba(0, 0, 0, 0.1);
			z-index: 99;
			padding-top: 140px;
		}.my-scroll {
			height: 100%;
			overflow-y: auto;
		}
		
		.listing {
			overflow-y: auto;
		}

		.ov-hid {
			overflow: hidden;
			padding-left: 480px;
		}
        .header__logo_myplan{
            padding: 15px 0px;
        }
        .planInput{
            margin-bottom: 20px;
            width: 100%;
            resize: none;
        }

        .date_2{
            margin-right: 10px;
            margin-bottom: 20px;
        }
        #dateBtn{
            width: 100%;
            margin-bottom: 20px;
        }
        .listArea{
            width: 100%;
            border:1px solid lightgray;
            margin-bottom: 20px;
            
        }
        .searchArea{
            margin-top:50px;
        }
        
        .listArea>tbody>tr:hover{
            background:darkgrey;
            cursor:pointer
        }
        
        /*카드 형식 안쓸때*/
        .thumbnail{  
            display:inline-block;  /*가로너비에 맞게 나란히 일정한 간격으로 보이게*/
            float:left;
            /* width:33%; */
            border:1px solid white;
            margin-bottom: 20px;
        }
        .planBox{
        	/* width: 350px; */
        	/* width: 100%; */
		    border: solid 1px #dfdfdf;
		    /* height: 100px; */
		    padding: 15px;
        }
        .planTitle{
        	line-height: 30px;
		    font-size: 21px;
		    color: black;
        }
        .header{
        	background-color:#FAE6B9;
        }
        .filter__title{
        	margin-bottom:10px;
        }
        
        <!--카카오지도-->
        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:92%;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;height:550px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}       
		
		table{
        	border-collapse:collapse;
        }
        th,td{
        	border-bottom: 1px solid lightgrey;
        	padding:3px;
        }
        th{
        	background-color:#FDF5E6;
        }
    </style>
</head>
<body class="ov-hid">
   <!-- Header Section Begin -->
    <header class="header header--normal" style="background-color: #FAE6B9;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo_myplan">
                        <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/resources/img/Logo_D_1.png" alt="야호"></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="<%=contextPath %>/views/plan/planSelect.jsp">일정플래너</a>
                
                                    <ul class="dropdown">
                                        <li><a href="#" class="movePage">마음대로일정</a></li>
                                        <li><a href="<%=contextPath %>/views/plan/adminRecommend.jsp">추천일정</a></li>
                                        <li><a href="#" class="movePage">일정보관함</a></li>
                                    </ul>
                                </li>
                                <li><a href="<%=contextPath %>/views/board/blogListView.jsp">커뮤니티</a></li>
                                
                                <%if(loginUser == null){%>  
                                <li><a href="<%=contextPath %>/views/member/login.jsp" onclick="goLogin();">로그인</a></li>
                                <li><a href="<%=contextPath %>/views/member/signUp.jsp" onclick="enrollPage();">회원가입</a></li>
                                 <%}else if(loginUser.getUserId().equals("admin")) { %>
                                <li><a href="<%=contextPath %>/adminPage.ad">관리자페이지</a></li>
                               	<li><a href="<%=contextPath %>/logout.me">로그아웃</a></li>                                
                                 <%}
                                else { %>
	                                <li><a href = "<%=contextPath%>/mypage.me">마이페이지</a></li>
	                                <li><a href = "<%=contextPath%>/logout.me">로그아웃</a></li>
							      <%}%>
                            </ul>
                        </nav>
                       	<div class="header__menu__right">
                
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->
    
    <!-- 로그인 2가지 경우에 따른 화면전환 -->
                <script>
                    $('.movePage').click(function(){
                        var text = $(this).text();
                        console.log(text);
                        <%if(loginUser == null) {%>
	                         alert("로그인 후 이용해주세요");
	                         location.href="<%=contextPath%>/views/member/login.jsp";
	                    <%}else{ %>
		                     if(text == "마음대로일정"){
	                           	 location.href="<%=contextPath%>/list.pm";	
	                         }else if(text == "일정보관함"){
	                             location.href="<%=contextPath%>/list.ps";
	                         }
		                <%}%>
                    });
                </script>

    <!-- Filter Begin -->
    <div class="filter my-scroll">
        <form action="create.pl" method="POST"  onsubmit="return checkTable();">
            <div class="filter__title">
                <h5>일정 제목</h5>
            </div>
            <div>
                <input type="text" class="planInput" name="planTitle" required>
            </div>
            <div class="filter__title">
                <h5>일정 날짜</h5>
            </div>
            <div>
                <input type="text" class="planInput" name="planDate" id="startDate" required>
            </div>
            <div class="filter__title">
                <h5>메모</h5>
            </div>
            <div>
                <textarea class="planInput" name="planMemo" id="" cols="30" rows="6"></textarea>
            </div>

            <div class="filter__title">
                <h5>위치 선택</h5>
            </div>
            <div>
                <!--select 로 값 받기-->
                <select name="planArea" class="planInput" id="region"  onchange="clickRegion(this)" > 
                    <%for(Area a : aList) {%>
						<option value="<%=a.getAreaNo()%>"><%=a.getAreaName() %></option>
					<%} %>
                </select>
            </div>
            <div class="filter__title">
                <h5>추가한 장소</h5>
            </div>
            <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="50">장소명</th>
                        <th width="200">주소</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <tbody id="my_tbody"></tbody>
            </table>
            
            <div class="filter__btns">
                <button type="submit">일정 저장하기</button>
            </div>            
        </form>

    </div>
    <!-- Filter End -->

    <!-- Listing Section Begin --> <!--ov.hid-->
    <section class="listing my-scroll">
        <div class="listing__text__top">
            <div class="listing__text__top__left">
            	<img src="<%=request.getContextPath()%>/resources/img/listing/restaurant.png" width="30px"> 
            	<h5 class="chooseCategory"><a style="cursor:pointer">식당</a></h5>
            	<img src="<%=request.getContextPath()%>/resources/img/listing/coffee-pot.png" width="30px"> 
                <h5 class="chooseCategory"><a style="cursor:pointer">카페주점</a></h5>
                <img src="<%=request.getContextPath()%>/resources/img/listing/shoes.png" width="30px"> 
                <h5 class="chooseCategory"><a style="cursor:pointer">액티비티</a></h5>
            </div>
        </div>
        <div>
	        <%System.out.println("list_planMy.jsp : " +list); %>
	        <% if(list.size() == 0) {%>
        	<h4>해당 지역에 등록된 장소가 없습니다.</h4>

	        <!-- 모든 place들 조회해와서 화면에 띄워주기 -->
	        <%}else{ %>
	        	<div class="row"  id="placeList">
			        <%for(Place p : list) {%>
			        	<div class="col-lg-6 col-md-6">  <!-- 가로 한 줄에 장소 2개 나오게끔 설정 -->
							<div class="thumbnail" align="center">
								<input type="hidden" value="<%=p.getPlaceNo()%>" id="placeNo">
								<input type="hidden" value="<%=p.getAreaNo()%>" id="areaNo" name="areaNo">
								<input type="hidden" value="<%=p.getCategoryNo()%>" id="categoryNo" name="categoryNo">
								
		                    	<img class="placeImg" src="<%=request.getContextPath()%>/resources/place_upFiles/<%= p.getTitleImg() %>" width="100%" height="250px"> <br>
		                    	<div class="planBox">
		                    		<p class="placeTitle" id="placeTitle"><%=p.getPlaceTitle()%></p>
		                    		<p id="placeAddress"><%=p.getAddress()%></p>
									<p><%=p.getDescription() %></p>
		                    		<button class="btn btn-primary addPlace">추가</button>
									<button class="btn btn-primary placeDetail">더보기</button>
		                    	</div>
		                    </div>
	                	</div>
					<%} %>  
				</div>
	        <%} %>
        </div> 	
    	
    	<script>
	    	//table에 추가된 장소의 조건 체크 후 submit되게 함
	    	function checkTable(){
	    		console.log("length : "+$("#tablePlaceNo").length)
	    		if($("#tablePlaceNo").length==0){  			//일정이 0개인 경우
	    			alert("일정을 1개 이상 추가해주세요")
	        		return false   
	    		}	
	    		if($('input[name="placeNo"]').length>20){	//일정이 20개를 초과하는 경우
	    			alert("일정은 10개 이하로 추가해주세요")
	        		return false   
	    		}
	    	}
	    	
	    	//선택한 지역, 카테고리에 따라 리스트 불러오기
	    	$(".chooseCategory").click(function(){
	        	var placeChoice = document.getElementById('region');
	        	var areaNo = placeChoice.options[placeChoice.selectedIndex].value;  //선택한 select의 index 알아내기, for문 돌 필요없음
	        	var category = $(this).text();
	        	
	        	console.log("areaNo : " + areaNo);
	        	console.log("category : " + category);
	        	
				$.ajax({

					url : "pclist.do",
					data : {
						areaNo : areaNo,
						category : category
					},
					type : "get",
					success: function(pcList){  //success : ajax 통신 성공시 처리할 함수를 지정하는 속성
					
						console.log("ajax 통신성공");
						console.log(pcList);
						
						ajaxPlaceList(pcList);
						
					},
					error : function(){	
						console.log("ajax 통신 실패")
					}
				})
	        })
	    	
	    	//선택한 지역에 따라 리스트불러오기
	        function clickRegion(c){
	        	var placeChoice = document.getElementById('region');
	        	var areaNo = placeChoice.options[placeChoice.selectedIndex].value;  //선택한 select의 index 알아내기, for문 돌 필요없음
	        	console.log("areaNo : " + areaNo);
	        	
				$.ajax({

					url : "plist.do",
					data : {
						areaNo : areaNo
					},
					type : "get",
					success: function(pList){  //success : ajax 통신 성공시 처리할 함수를 지정하는 속성
					
						console.log("ajax 통신성공");
						console.log(pList);
						
						ajaxPlaceList(pList);
						
					},
					error : function(){	
						console.log("ajax 통신 실패")
					}
				})
	        }
	        
	        //지역에 따른 리스트 ajax로 받은 후 -> 동적 태그 생성
	    	function ajaxPlaceList(pList){
         		var result = '';
         		var contextPath = "<%=contextPath%>"
          		$.each(pList, function(i){                         	
                	result += '<div class="col-lg-6 col-md-6">'  <!-- 가로 한 줄에 장소 2개 나오게끔 설정 -->
							+ '<div class="thumbnail" align="center">'
							+ '<input type="hidden" value="'+ pList[i].placeNo +'" id="placeNo">'
							+ '<input type="hidden" value="'+pList[i].areaNo+'" id="areaNo" name="areaNo">'
							+ '<img class="placeImg" src="'+contextPath+'/resources/place_upFiles/'+pList[i].titleImg +'" width="100%" height="250px"><br>'
	                    	+ '<div class="planBox">'
	                    	+ '<p class="placeTitle" id="placeTitle">'+pList[i].placeTitle+'</p>'
	                    	+ '<p id="placeAddress">'+pList[i].address+'</p>'
							+ '<p>'+pList[i].description+'</p>'
	                    	+ '<button class="btn btn-primary addPlace" style="margin-right: 3px;">추가</button>'
							+ '<button class="btn btn-primary placeDetail" style="margin-left: 3px;">더보기</button>'
							+'</div></div></div>';
							
          		})
          		$("#placeList").html(result);
	    	}
	        //=================================================================================ajax리스트 배치 완성 / 함수적용 완성(0912)
	        
	        //placeNo 담는 배열 -> 중복체크위해서 전역변수로 만들어서 씀
	        placeArr = new Array();
	        
        	//일정 테이블에서 삭제하기
            function rowDelete(obj){
                $(obj).parent().parent().remove();                             //행 통째로 삭제
                var placeNo = $(obj).parent().siblings("#tablePlaceNo").val(); //장소번호 추출
	            placeArr.splice($.inArray(placeNo, placeArr),1);               //placeArr배열에서 장소번호 삭제
	            
	            console.log("삭제 후 placeArr: " + placeArr);
            } 
	        
	        //[동적함수] ajax로 추가된 태그들에 함수가 적용되게 하기 위해서 모든 함수를 동적으로 바꾼다...
		    //[동적함수] '더보기'클릭시 placeDetail창으로 새롭게 열린다.
		    $(document).on('click','.placeDetail',function(){
		    	console.log("동적 함수 작동되는건가?");
		    	
				var parent = $(this).parent();  //클릭한 버튼의 최상위 부모
				var pNo = parent.siblings("#placeNo").val();	//클릭한 버튼의 최상위 부모의 id가 placeNo value값
				window.open("./detail.pl?pNo="+pNo);  //장소상세페이지 새창으로 열기
			});
		    
		  	//[동적함수] '추가'버튼 클릭시 -> 왼쪽화면에 표 추가되도록 하기
		    $(document).on('click','.addPlace',function() {
		        var parent = $(this).parent();
		        var title = parent.children("#placeTitle").text();  		//장소명 추출
		        var address = parent.children("#placeAddress").text();		//장소주소 추출
		        var placeNo = $(this).parent().siblings("#placeNo").val(); //장소번호 추출
		            
		        placeArr.push(placeNo);                                     //placeArr배열에 장소번호 추가
		            
		        console.log("추가 후 placeArr: " + placeArr);
		            
		        if(noDuplicate(placeNo)){
		            var $tr = $("<tr>"); //테이블 행 생성
			        var hidden = '<input type="hidden" name="placeNo" id="tablePlaceNo" value="'+placeNo+'">'; //hidden으로 placeNo넘기기
			        var $title = $("<td>").text(title); 
			        var $address = $("<td>").text(address); 
			        var btn = '<td><button onClick="rowDelete(this)">빼기</button></td>';
			
			        $tr.append(hidden);   //placeNo
			        $tr.append($title);   //title
			        $tr.append($address); //address
			        $tr.append(btn);      //빼기 버튼
			
			        $("#my_tbody:last").append($tr);
		        }else{
		            alert("장소는 하나씩만 추가해주세요:)");
		        }
		    });

		    //테이블에 추가된 일정 중복여부 체크
		    function noDuplicate(placeNo){
				for(var i=0; i<placeArr.length-1; i++){
					if(placeArr[i] == placeNo){
						placeArr.pop();		//placeArr에서 값 삭제
						console.log("중복값 체크후 placeArr : " + placeArr)
						return false;		//
					}
				}
				return true;
		    }
    	</script>
    </section>
    <!-- Listing Section End -->

    <!-- Map Begin -->
    <div class="listing__map">
    	<!-- <div id="map" style="width:647px;height:793px;"></div> -->
	    
	    
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="강남역 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=879134364fa796c4ccf9a5a523dc7377&libraries=services"></script>

	<script>
		//사진 클릭시 placeTitle반환 & 지도에서 serch해주는 함수 호출
		$(document).on('click','.placeImg',function(){
			var pTitle = $(this).siblings().children("#placeTitle").text();
				
			$("#keyword").val(pTitle); //검색창 띄우기
			searchPlaces();      //지도에서 serch해주는 함수
		}); 
		
		
		// 마커를 담을 배열입니다
		var markers = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		
		    var keyword = document.getElementById('keyword').value;
		
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		
		    }
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
		
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
		
		        fragment.appendChild(itemEl);
		    }
		
		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
		
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
		
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
		
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		
		    el.innerHTML = itemStr;
		    el.className = 'item';
		
		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
		
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
		
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
		
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
		
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
	</script>
	    
	    
    </div>
    <!-- Map End -->

    <script> 
        // 달력 날짜 선택 
        $(function () {
            $('#startDate').datepicker({
             })
        })

        function goPlan(){
            <%if(loginUser == null) {%>
               alert("로그인 후 이용해주세요");
               location.href="<%=request.getContextPath()%>";
            <%}else{ %>
               location.href="<%=request.getContextPath()%>/list.pm";
            <%} %>
         } 
        
      	//날짜 확인 버튼 -> h5태그 값 변경
        $('#dateBtn').click(function(){
            var value = $("#startDate").val();
            console.log(value);
            $("#planDate").text('선택하신 날짜 : ' + value);
        });
    </script>
    
    <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>