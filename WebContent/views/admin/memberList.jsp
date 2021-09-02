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
<title>어디어디 - 관리자페이지(회원관리)</title>
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
.placeAddForm{
width:800px;
height: 500px;
}
.memberList > thead{
text-align: center;
font-size: large;


}

</style>
</head>

<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%@ include file="../common/menubar.jsp"%>
	
	<section class="hero set-bg"
		data-setbg="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h2>회원 관리</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<script>
		$(function() {
			var $header = $('header'); //헤더를 변수에 넣기
			var $page = $('.page-start'); //색상이 변할 부분
			var $window = $(window);
			var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

			$window.resize(function() { //반응형을 대비하여 리사이즈시 top값을 다시 계산
				pageOffsetTop = $page.offset().top;
			});

			$window.on('scroll', function() { //스크롤시
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
							<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
							<li class="menuB "><a
								href="<%=contextPath%>/views/admin/placeAdd.jsp">일정 등록</a></li>
							<li class=" menuB "><a
								href="<%=contextPath%>/views/admin/placeDelete.jsp">일정 삭제</a></li>
							<li class="menuB"><a
								href="<%=contextPath%>/views/admin/courseAdd.jsp">코스 등록</a></li>
							<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp" >코스 삭제</a></li>
							<li class="active menuB parent"><a href="<%=contextPath%>/views/admin/memberList.jsp">회원 관리</a></li>

						</ul>
					</nav>
				</div>
			</div>
			<!--menu bar  -->
			<div class="admin-showpage nice-scroll">
					<div class="tab-content">
					<table class="table table-hover">
					    <thead>
					      <tr>
					        <th width="50">NO.</th>
							<th width="150">회원 아이디</th>
							<th width="150">회원 이름</th>
							<th width="300">회원 이메일</th>
							<th width="200">회원 전화번호</th>
							<th width="150">회원 성별</th>
							<th width="150">회원 삭제</th>
					      </tr>
					    </thead>
					    <tbody>
							<%-- <%if(list.isEmpty()){ %> --%>
							<tr>
								<td colspan="7">조회된 리스트가 없습니다.</td>
							</tr>
							
							 <%-- <%}else{ %>
								<% for(Board b : list){ %> 
								<tr>
									<td><%= b.getBoardNo() %> </td>
									<td><%= b.getCategory() %></td>
									<td><%= b.getBoardTitle() %></td>
									<td><%= b.getBoardWriter() %></td>
									<td><%= b.getCount() %> </td>
									<td><%= b.getCreateDate() %></td>
									<td><%= b.getCreateDate() %> </td>
								</tr>
								 <%} %>
							<%} %>  --%>
							<tr>
						        <td>1</td>
								<td>kmk9259</td>
								<td>김민경</td>
								<td>kmk9259@naver.com</td>
								<td>010-1111-1111</td>
								<td>여</td>
								<td><button>회원 삭제</button></td>
					     	 </tr>
						</tbody>
					      
					  </table>
						
						
					</div>
				</div> <!-- admin-showpage -->
			
		</section>
		<!-- admin -->
	</section>
	<!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>