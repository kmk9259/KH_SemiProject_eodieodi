<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy, semiProject.com.kh.place.model.vo.Place"%>
<!DOCTYPE html>
<%
	ArrayList<Place> list = (ArrayList<Place>)request.getParameter("list",list);  
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css">

    <!-- 제이쿼리 피커데이트 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

    <style>
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
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

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
                
                
                                <li><a href="./selectPlan.html">일정플래너</a>
                
                                    <ul class="dropdown">
                                        <li><a href="./listing.html">마음대로일정</a></li>
                                        <li><a href="./listing-details.html">추천일정</a></li>
                                        <li><a href="./planSave.html">일정보관함</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="./blog.html">커뮤니티</a></li>
                
                                <li><a href="#">로그인</a></li>
                                <li><a href="#">회원가입</a></li>
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
        <form action="create.pl" method="POST">
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
                <!-- <input type="text" class="planInput" id="start"> -->
                <input type="text" class="planInput" name="planDate" id="startDate" required>
                <!-- <button type="submit" class="btn btn-primary">확인</button> -->
                <button id="dateBtn">확인</button>
            </div>

            <script> 
                //날짜 확인 버튼 -> h5태그 값 변경
                $('#dateBtn').click(function(){
                    var value = $("#startDate").val();
                    console.log(value);
                    $("#planDate").text('선택하신 날짜 : ' + value);
                });
            </script>

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
                <select name="area" class="planInput" id="region" onchange="choicePlace(this)">
                    <option value="1" selected>홍대</option>
                    <option value="2">강남</option>
                </select>
            </div>

            <div class="filter__title">
                <h5 id="planDate" class="planInput">선택하신 날짜 : </h5>
            </div>
            <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="50">장소명</th>
                        <th width="200">주소</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <!-- <tr>
					<td>뚱이네 고기</td>
					<td>서울시 홍대 어딘가 11-1번지</td>
					<td><button onClick="rowDelete(this)">빼기</button></td>
				</tr>
                <tr>
					<td>뚱이네 고기</td>
					<td>서울시 홍대 어딘가 11-1번지</td>
					<td><button onClick="rowDelete(this)">빼기</button></td>
				</tr>
                <tr>
					<td>뚱이네 고기</td>
					<td>서울시 홍대 어딘가 11-1번지</td>
					<td><button onClick="rowDelete(this)">빼기</button></td>
				</tr> -->
            </table>
            
            <div class="filter__btns">
                <button type="submit">일정 저장하기</button>
            </div>

            <script>
                function rowDelete(obj){
                    $(obj).parent().parent().remove();
                }
                
                
                function choicePlace(c){
        		    var hong = document.getElementById("hongdae");
        		    var gang = document.getElementById("gangnam");
        		    
        		    if(c.value == "1")
        		    {
        		    	$('#hongdae').show();
        		    	$('#gangnam').hide();
        		    }	
        		    else if(c.value == "2")
        	    	{
        		    	$('#hongdae').hide();
        		    	$('#gangnam').show();
        	    	}					    
        		}
            </script>
            
        </form>
        
        
    </div>
    <!-- Filter End -->

    <!-- Listing Section Begin --> <!--ov.hid-->
    <section class="listing nice-scroll">
        <div class="listing__text__top">
            <div class="listing__text__top__left">
                <a href="#"><h5>음식</h5></a>
                <a href="#"><h5>활동</h5></a>
            </div>
            <!-- <div class="listing__text__top__right">Nearby <i class="fa fa-sort-amount-asc"></i></div> -->
        </div>
        
        모든 place들 조회해와서 화면에 띄워주기
        <%for(Place p : list) {%>
        	<form action="insert.pm">  <!-- 넘기기 -->
        		<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
				<input type="hidden" name="pno" value="<%=p.getPlaceNo()%>">
					<div class="card">
					<img class="card-img-top" src="<%= request.getContextPath() %>/resources/place_upfiles/<%= p.getPlaceImg() %>>" alt="Card image" style="width: 100%">
						<div class="card-body">
							<h4 class="card-title"><%=p.getPlaceTitle() %></h4>
							<p class="card-text"><%=p.getPlaceAddress() %></p>
	
							<button type="submit" class="btn btn-primary">추가</button>
							<button class="btn btn-primary">더보기</button>
						</div>
					</div>							
				</div>
        	</form>
		<%} %> 
        	
        
        <div id="hongdae">
			<% for(int i=0; i<10; i++) {%>
				<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
					<div class="card">
						<img class="card-img-top" src="<%= request.getContextPath() %>/resources/img/gyeongbokgung-palace.jpg" alt="Card image" style="width: 100%">
						<div class="card-body">
							<h4 class="card-title">홍대 놀거리</h4>
							<p class="card-text">방탈출</p>
	
							<button class="btn btn-primary">추가</button>
							<button class="btn btn-primary">더보기</button>
						</div>
					</div>							
				</div>
			<%} %>
		</div><!--홍대  -->
		<div id="gangnam">
			<% for(int i=0; i<10; i++) {%>
				<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
					<div class="card">
						<img class="card-img-top" src="<%= request.getContextPath() %>/resources/img/gyeongbokgung-palace.jpg" alt="Card image" style="width: 100%">
						<div class="card-body">
							<h4 class="card-title">강남 놀거리</h4>
							<p class="card-text">강남 </p>
	
							<button class="btn btn-primary">추가</button>
							<button class="btn btn-primary">더보기</button>
						</div>
					</div>							
				</div>
			<%} %>
		</div><!--강남  -->
            <!-- 
            <table class="listArea">
            <form>
                <tr>
                    <td rowspan="3">
                        <div id="titleImgArea" align="center">
                            장소 사진
                        </div>
                    </td>
                    <td>장소 명</td>
                    <td><button onclick="newPage()">돋</button></td>
                    <td><button>+</button></td>
                </tr>
                <tr>
                    <td colspan="3">주소</td>
                </tr>
                <tr>
                    <td colspan="3">상세 설명</td>
                </tr>
            </form>
            <form>
                <tr>
                    <td rowspan="3">
                        <div id="titleImgArea" align="center">
                            장소 사진
                        </div>
                    </td>
                    <td>장소 명</td>
                    <td><button onclick="newPage()">돋</button></td>
                    <td><button>+</button></td>
                </tr>
                <tr>
                    <td colspan="3">주소</td>
                </tr>
                <tr>
                    <td colspan="3">상세 설명</td>
                </tr>
            </form>
        </table> -->
    </section>
    <!-- Listing Section End -->

    <!-- Map Begin -->
    <div class="listing__map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d423283.43556031643!2d-118.69192431097179!3d34.020730495817475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1586670019340!5m2!1sen!2sbd" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
    <!-- Map End -->

    
    <script> 
        // 달력 날짜 선택 
        $(function () {
            $('#startDate').datepicker({
             })
        })

        function newPage()  {
            window.open('./placeDetail.html');
        }

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