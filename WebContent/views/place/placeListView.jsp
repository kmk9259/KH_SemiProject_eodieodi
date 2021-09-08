<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.place.model.vo.*"%>
<%
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>어디어디 - 관리자페이지(일정조회)</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/myInfo.css"
	type="text/css">
<style>
.admin {
    background-color: #FFF3E7;
    height: 1000px; 
    padding: 0px 50px 50px 50px;
}
.admin-showpage{
	float: right;
    width: 1400px;
    margin-right:50px;
    height: 900px;
    padding: 10px;
    margin-top: 2.5%;
    background-color: #FFF3E7;
    border: 1px solid #D34B32;
    
}
.thumbnail{
		display:inline-block;
		width:220px;
		border:1px solid white;
		margin:10px;
	}
.thumbnail:hover{
	opacity:0.7;
	cursor:pointer;
}

</style>

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%@ include file="../common/menubar.jsp"%>

	<!-- Hero Section Begin -->
	<section class="hero set-bg" style="height: 500px"
		data-setbg="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h2>일정 관리</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<script>
            $(function(){
            var $header = $('header'); //헤더를 변수에 넣기
            var $page = $('.page-start'); //색상이 변할 부분
            var $window = $(window);
            var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기
            
            $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
                pageOffsetTop = $page.offset().top;
            });
            
            $window.on('scroll', function(){ //스크롤시
                var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
                $header.toggleClass('down', scrolled); //클래스 토글
            });
            });
        
    </script>

	<section class="page-start">
		<section class="admin">
			<!------ MENUSIDE BAR ---------->
				<div class=" menuBar">
					<div class="col-sm-2">
						<nav class="nav-sidebar">
							<ul class="nav tabs">
								<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티
										관리</a></li>
								<li class="menuB "><a href="" data-toggle="tab">공지사항 등록</a></li>
								<li class="menuB "><a href="" data-toggle="tab">공지사항 수정</a></li>
								<li class="active menuB parent"><a href="<%= contextPath %>/list.pl" >일정관리(조회)</a></li>
								<li class=" menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
								<li class=" menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
								<li class="menuB"><a href="<%=contextPath%>/ccAdd.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp">코스 삭제</a></li>
								<li class="menuB parent"><a href="<%=contextPath%>/views/admin/memberList.jsp">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
			<div class="admin-showpage nice-scroll">
			<div class="outer">
				<br>
				<h2 align="center">일정 조회</h2>
				<br>
				
				<div class=listPlace>
					<%for(Place p : list){ %>					
					<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
						<input type="hidden" value="<%=p.getPlaceNo()%>" id="placeNo">
						<div class="card">
							<img class="card-img-top" src="<%=contextPath %>/resources/place_upFiles/<%= p.getTitleImg() %>" alt="Card image" style="width: 100%">
							<div class="card-body">
								<h4 class="card-title">No.<%= p.getPlaceNo() %>  <%=p.getPlaceTitle() %></h4>
								<p class="card-text">조회수 : <%= p.getCount() %></p>
								
								
								
							</div>
						</div>							
					</div>
					<%} %>
				
					
					<br><br>
					
				</div>
				<script>
					$(function(){
						$(".card").click(function(){
							
							var parent = $(this).parent(); 
							var pNo = parent.children("#placeNo").val();
							location.href='<%=contextPath%>/detail.pl?pNo='+pNo;
						});
					});
				</script>
			</div>
			</div>
			
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>