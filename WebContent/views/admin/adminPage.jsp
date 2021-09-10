<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>어디어디 - 관리자페이지</title>
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
.choiceCourse{
margin-left: 150px;
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
							<h2>관리자 페이지</h2>
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
								<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티	관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.no">공지사항 조회</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.pl">일정 조회</a></li>
								<li class="menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
								<li class="menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">코스 관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
								<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>


							</ul>
						</nav>
					</div>
				</div>	
				
		<div class="admin-showpage nice-scroll">
		<h2>관리자 페이지입니당.</h2>
		</div>
		</section><!-- admin -->
	</section><!-- page- start -->
	




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>