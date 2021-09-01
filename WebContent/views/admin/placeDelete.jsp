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
<title>어디어디 - 관리자페이지(일정삭제)</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"> -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/bootstrap.min333.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/barfiller.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/myInfo.css"
	type="text/css">

<!-- login Section -->
<!-- 첫 번째 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--CSS-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<!--JS-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%@ include file="../common/menubar.jsp"%>



	<!-- Hero Section Begin -->
	<section class="hero set-bg"
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
		<section class="login">
			<div class="container">
				<div class="sidenav">
					<div class="login-main-text">
						<h2>
							Eodi Eodi<br> Admin Page
						</h2>
						<p>Welcome To Admin Page</p>
					</div>
				</div>
				<!------ MENUSIDE BAR ---------->
				<div class="container menuBar">
					<div class="col-sm-2">
						<nav class="nav-sidebar">
							<ul class="nav tabs">
								<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티
										관리</a></li>
								<li class="menuB "><a href="" data-toggle="tab">공지사항 등록</a></li>
								<li class="menuB "><a href="" data-toggle="tab">공지사항 수정</a></li>
								<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
								<li class=" menuB "><a
									href="<%=contextPath%>/views/admin/placeAdd.jsp"
									data-toggle="tab">일정 등록</a></li>
								<li class="active menuB "><a
									href="<%=contextPath%>/views/admin/placeDelete.jsp">일정
										삭제</a></li>
								<li class="menuB"><a href="#" data-toggle="tab">코스 등록</a></li>
								<li class="menuB"><a href="#" data-toggle="tab">코스 삭제</a></li>
								<li class="menuB parent"><a href="#">회원 관리</a></li>

							</ul>
						</nav>
					</div>

				</div>


				<div class="container-showpage" style="height: 900px">
					<!-- tab content -->
					<div class="tab-content">
						<!-- 일정 등록 -->
						<div class="tab-pane active text-style" id="Info">
							<h2>일정 등록</h2>
							<br> <br>
							<div class="form-group">
								<select>
									<option value="">지역선택</option>
									<option value="">홍대</option>
									<option value="">강남</option>
								</select>
							</div>
							<br>
							<br>
							<div class="card-group card-columns" style="width: 750px">
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>

							</div>
							<div class="card-group card-columns" style="width: 750px">
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>
								<div class="card" style="width: 500px">
									<img class="card-img-top"
										src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg"
										alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">John Doe</h4>
										<p class="card-text">Some example text.</p>

										<button class="btn btn-primary">삭제</button>
									</div>
								</div>

							</div>
							<script>
							$(function() {
								
								$(".btn").click(function() {
									var result = confirm("일정을 삭제하시겠습니까?")
									if (result) {
										alert("일정이 삭제되었습니다.")
									} else {
										location.reload();
									}

								});

							});
							</script>


						</div>
		</section>

	</section>

	<%@ include file="../common/footer.jsp"%>

	<!-- Js Plugins -->
	<script src="<%=contextPath%>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%= contextPath %>/resources/js/bootstrap.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery-ui.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery.nicescroll.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery.barfiller.js"></script>
	<script
		src="<%= contextPath %>/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="<%= contextPath %>/resources/js/jquery.slicknav.js"></script>
	<script src="<%= contextPath %>/resources/js/owl.carousel.min.js"></script>
	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>