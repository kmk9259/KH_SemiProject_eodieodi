<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy, semiProject.com.kh.place.model.vo.Place,
    semiProject.com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");  
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Directing | Template</title>

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
			overflow-y: auto;
			-webkit-box-shadow: 0px 5px 14px rgba(0, 0, 0, 0.1);
			box-shadow: 0px 5px 14px rgba(0, 0, 0, 0.1);
			z-index: 99;
			padding-top: 140px;
		}

		.ov-hid {
			overflow: hidden;
			padding-left: 480px;
		}
        .header__logo_myplan{
            padding-top: 25px;
            padding-top: 10px;
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
            border:1px solid black;
            margin-bottom: 20px;
            
        }
        .searchArea{
            margin-top:50px;
        }
        
        .listArea>tbody>tr:hover{
            background:darkgrey;
            cursor:pointer
        }
        
    </style>
</head>
<body class="ov-hid">
   <!-- Header Section Begin -->
    <header class="header header--normal">
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
                                        <li><a href="#" onclick="goPlan();">마음대로일정</a></li>
                                        <li><a href="<%=contextPath %>/views/plan/adminRecommend.jsp">추천일정</a></li>
                                        <li><a href="<%=contextPath %>/views/plan/planSave.jsp">일정보관함</a></li>
                                    </ul>
                                </li>
                                <li><a href="<%=contextPath %>/views/board/faq.jsp">FAQ</a></li>
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

    <!-- Filter Begin -->
    <div class="filter nice-scroll">
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
                <textarea class="planInput" name="planMemo" id="" cols="20" rows="8"></textarea>
            </div>

            <div class="filter__title">
                <h5>위치 선택</h5>
            </div>
            <div>
                <!--select 로 값 받기-->
                <select name="planArea" class="planInput" id="region" onchange="clickRegion(this)"> <!--  onchange="choicePlace(this)" -->
                    <option value="1">홍대</option>
                    <option value="2">강남</option>
                    <option value="3">종로</option>
                </select>
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
        
        <script>
        	//조건 체크 후 submit되게 함
        	function checkTable(){
        		console.log("length : "+$("#tablePlaceNo").length)
        		if($("#tablePlaceNo").length==0){  			//일정이 0개인 경우
        			alert("일정을 1개 이상 추가해주세요")
            		return false   
        		}	
        		if($('input[name="placeNo"]').length>10){	//일정이 10개를 초과하는 경우
        			alert("일정은 10개 이하로 추가해주세요")
            		return false   
        		}
        	}
        	  
        </script>
    </div>
    <!-- Filter End -->

    <!-- Listing Section Begin --> <!--ov.hid-->
    <section class="listing nice-scroll">
        <div class="listing__text__top">
            <div class="listing__text__top__left">
                <a href="#"><h5>음식</h5></a>
                <a href="#"><h5>활동</h5></a>
            </div>
        </div>
        <div id="placeList">
	        <%System.out.println("list_planMy.jsp : " +list); %>
	        <% if(list.size() == 0) {%>
        	<h4>해당 지역에 등록된 장소가 없습니다.</h4>

	        <!-- 모든 place들 조회해와서 화면에 띄워주기 -->
	        <%}else{ %>
		        <%for(Place p : list) {%>
		        	<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
						<input type="hidden" value="<%=p.getPlaceNo()%>" id="placeNo" >
						<input type="hidden" value="<%=p.getAreaNo()%>" id="areaNo" name="areaNo">
						<div class="card">
							<img class="card-img-top" src="<%=contextPath%>/resources/place_upFiles/<%= p.getTitleImg() %>" alt="Card image" style="width: 100%">
							<div class="card-body">
								<h4 class="card-title" id="placeTitle"><%=p.getPlaceTitle()%></h4>
								<p class="card-text" id="placeAddress"><%=p.getAddress()%></p>
								<p class="card-text"><%=p.getDescription() %></p>
								
								<button class="btn btn-primary addPlace">추가</button>
								<button class="btn btn-primary placeDetail">더보기</button>
							</div>
						</div>							
					</div>
				<%} %>  
	        <%} %>
        </div> 	
    	
    	<script>
	        function clickRegion(c){
	        	console.log(c.value);
	        	var areaNo = c.value;
				$.ajax({
					
					//url : 데이터를 전송할 url(필수)
					url : "plist.do",
					
					//data : 요청시 전달할 파라미터 설정
					data : {
						areaNo : areaNo
					},
					//type : 전송방식(get / post)
					
					type : "get",
					
					success: function(pList){  //success : ajax 통신 성공시 처리할 함수를 지정하는 속성
						console.log("ajax 통신성공");
						console.log(pList);
						
	             		var result = "";
	             		var contextPath = "<%=contextPath%>"
	             		
	              		$.each(pList, function(i){
	              			 result +='<div class="card-group card-deck" style="width: 300px display: inline-block" >'
	                             	+'<input type="hidden" value="'+pList[i].placeNo+'" id="placeNo">'
	                             	+'<input type="hidden" value="'+pList[i].areaNo+'" id="areaNo">'
	                            	+'<div class="card">'
	                             	+'<img class="card-img-top" src="'+contextPath+'/resources/place_upFiles/'+pList[i].titleImg+'" alt="Card image" style="width: 300px">'
	                             	+'<div class="card-body">'
	                             	+'<h4 class="card-title" id="placeTitle">'+pList[i].placeTitle+'</h4>'
	                             	+'<p class="card-text" id="placeAddress"><b>'+pList[i].address+'</b></p><br>'
	                             	+'<p class="card-text">'+pList[i].description+'</p><br>'
	                             	
	                             	+'<button class="btn btn-primary addPlace">추가</button>'
	                             	+'<button class="btn btn-primary placeDetail">더보기</button>'
	                             	+'</div></div></div>'; 
	              		})
	              		
	              		$("#placeList").html(result);
	              		
	              		//'더보기'클릭시 placeDetail창으로 새롭게 열린다.
					    $(function(){
							$(".placeDetail").click(function(){
								var parent = $(this).parent().parent().parent();  //클릭한 버튼의 최상위 부모
								console.log("parent : " + parent);
								var pNo = parent.children("#placeNo").val();	//클릭한 버튼의 최상위 부모의 id가 placeNo value값
								console.log("pNo : " + pNo);
								window.open("./detail.pl?pNo="+pNo);  //장소상세페이지 새창으로 열기
							});
						});
	             		
	             		//'추가'버튼 클릭시 -> 왼쪽화면에 표 추가되도록 하기
	        		    $(function() {
	        		        $(".addPlace").click(function() {
	        		            var parent = $(this).parent();
	        		            var title = parent.children("#placeTitle").text();  		//장소명 추출
	        		            var address = parent.children("#placeAddress").text();		//장소주소 추출
	        		            var placeNo = $(this).parent().parent().parent().children("#placeNo").val(); //장소 번호 추출
	        		            console.log("placeNo : " + placeNo);
	        		
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
	        		        })
	        		    })

					},
					error : function(){		//error : 통신 실패시 처리할 함수를 지정하는 속성
						console.log("ajax 통신 실패")
					}
				})
	        }
	        //=================================================================================ajax리스트 배치 미완성ㅠㅠㅠ
	        
	        //placeNo 담는 배열 -> 중복체크위해서 전역변수로 만들어서 씀
	        placeArr = new Array();
	        
    		//'더보기'클릭시 placeDetail창으로 새롭게 열린다.
		    $(function(){
				$(".placeDetail").click(function(){
					var parent = $(this).parent().parent().parent();  //클릭한 버튼의 최상위 부모
					var pNo = parent.children("#placeNo").val();	//클릭한 버튼의 최상위 부모의 id가 placeNo value값
					window.open("./detail.pl?pNo="+pNo);  //장소상세페이지 새창으로 열기
				});
			});

        	//일정 테이블에서 삭제하기
            function rowDelete(obj){
                $(obj).parent().parent().remove();                             //행 통째로 삭제
                var placeNo = $(obj).parent().siblings("#tablePlaceNo").val(); //장소번호 추출
	            placeArr.splice($.inArray(placeNo, placeArr),1);               //placeArr배열에서 장소번호 삭제
            } 
		    
		  	//'추가'버튼 클릭시 -> 왼쪽화면에 표 추가되도록 하기
		    $(function() {
		        $(".addPlace").click(function() {
		            var parent = $(this).parent();
		            var title = parent.children("#placeTitle").text();  		//장소명 추출
		            var address = parent.children("#placeAddress").text();		//장소주소 추출
		            var placeNo = $(this).parent().parent().parent().children("#placeNo").val(); //장소번호 추출
		            
		            placeArr.push(placeNo);                                     //placeArr배열에 장소번호 추가
		            
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
		        })

		    })
		    
		    //테이블에 추가된 일정 중복여부 체크
		    function noDuplicate(placeNo){

				for(var i=0; i<placeArr.length-1; i++){
					if(placeArr[i] == placeNo){
						placeArr.pop();		//placeArr에서 값 삭제
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
    	<div id="map" style="width:647px;height:793px;"></div>
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=879134364fa796c4ccf9a5a523dc7377"></script>
	    <script>
	        var container = document.getElementById('map');
	        var options = {
	            center: new kakao.maps.LatLng(33.450701, 126.570667),
	            level: 3
	        };
	
	        var map = new kakao.maps.Map(container, options);
	    </script>
        <!-- <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d423283.43556031643!2d-118.69192431097179!3d34.020730495817475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1586670019340!5m2!1sen!2sbd" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe> -->
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