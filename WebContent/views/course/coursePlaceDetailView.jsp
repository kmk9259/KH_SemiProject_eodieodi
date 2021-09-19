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
<title>어디어디 - 관리자페이지(코스일정 상세페이지)</title>
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
.tab-content{width: 1400px;}

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
							<h2>어디어디?!</h2>
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
							<li class="active menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
							<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
							<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
							
							<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

						</ul>
					</nav>
				</div>
			</div><!-- <div class=" menuBar"> -->	
			<div class="admin-showpage nice-scroll">
				<div class="section-title">
		            <h2 style="margin: 0px;">코스 일정 상세페이지</h2>
		        </div>
				<section class="most-search spad">
					<div class="container">					
						<div class="row">							
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-1" role="tabpanel" style="width: 1000px; margin-left: 100px">
									<div class="row">
										<% for(Place p: list) {%>
										<div class="col-lg-4 col-md-6" >
											<div class="listing__item">
												<input type="hidden" id="placeNo" value="<%=p.getPlaceNo() %>">
											    <div class="listing__item__pic set-bg" data-setbg="<%=contextPath %>/resources/place_upFiles/<%=p.getTitleImg()%>">
											        <img src="resources/img/listing/list_icon-1.png" alt="">
											        <div class="listing__item__pic__tag">NO. <%=p.getPlaceNo() %></div>											       
											    </div>
												<div class="listing__item__text">
												    <div class="listing__item__text__inside">
												        <h5><%=p.getPlaceTitle() %></h5>
												        <p><%=p.getDescription() %></p>
												        <div class="listing__item__text__rating">
												            <div class="listing__item__rating__star">
												                <span class="icon_star"></span>
												                <span class="icon_star"></span>
												                <span class="icon_star"></span>
												                <span class="icon_star"></span>
												                <span class="icon_star-half_alt"></span>
												            </div>
												            <h6><%=p.getPrice()%> 원</h6>
												        </div>
												        <ul>
												            <li><span class="icon_pin_alt"></span> <%=p.getAddress() %></li>
												            <li><span class="icon_phone"></span> <%=p.getPlacePhone() %></li>
												        </ul>
												    </div>
												    <div class="listing__item__text__info">
												        <div class="listing__item__text__info__left">
												            <img src="resources/img/listing/list_small_icon-1.png" alt="">
												            <span>
												            <%
												            	String categoryName="";
																if(p.getCategoryNo()==1)
																	categoryName="먹기";
																if(p.getCategoryNo()==2)
																	categoryName="마시기";
																if(p.getCategoryNo()==3)
																	categoryName="놀기";
																
															%>
															<%= categoryName %>
												            </span>
												        </div>
												        <div class="listing__item__text__info__right">Open Now</div>
												    </div>
												</div>
											</div>
										</div><!--<div class="col-lg-4 col-md-6">  -->
										<%} %>
									</div>
									<button class="nextBtn btn-ms" style="margin-right: 500px" onClick="history.go(-1)">이전으로</button>
								</div>
							</div><!--<div class="tab-content"> -->
						</div>
					   </div>          
				</section>
			</div><!--<div class="admin-showpage nice-scroll">  -->
				<script>
				$(function(){
					$(".listing__item__pic").click(function(){
						
						var parent = $(this).parent(); 
						var pNo = parent.children("#placeNo").val();
						location.href='<%=contextPath%>/detail.pl?pNo='+pNo;
					});
				});
				</script>
								
			
			
		</section><!-- admin -->
	</section><!-- page- start -->



	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>