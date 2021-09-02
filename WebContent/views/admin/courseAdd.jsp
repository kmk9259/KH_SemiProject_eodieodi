<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! int i=0; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>어디어디 - 관리자페이지(코스등록)</title>
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
								<li class=" menuB "><a
									href="<%=contextPath%>/views/admin/placeAdd.jsp">일정 등록</a></li>
								<li class="menuB ">
								<a href="<%=contextPath%>/views/admin/placeDelete.jsp">일정 삭제</a></li>
								<li class="active menuB"><a href="<%=contextPath%>/views/admin/courseAdd.jsp">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp" >코스 삭제</a></li>
								<li class="menuB parent"><a href="<%=contextPath%>/views/admin/memberList.jsp">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
				<div class="admin-showpage ">
				<div class="courseList nice-scroll" style="height: 600px; width: 1500px;">
					<div class="form-group col-sm-5">
							<select id="placeChoice" onchange="choicePlace(this)">
								<option>지역을 선택하세요</option>
								<option value="h">홍대</option>
								<option value="g">강남</option>
							</select>
					</div>
						<div class="form-group col-sm-4">
							<select id="category" onchange="category(this)">
								<option value="eating">먹기</option>
								<option value="drinking">마시기</option>
								<option value="playing">놀기</option>
							</select>
						</div><br><br><br><br>
					<script>
					function choicePlace(c){
					    var hong = document.getElementById("hongdae");
					    var gang = document.getElementById("gangnam");
					    
					    if(c.value == "h")
					    {
					    	$('#hongdae').show();
					    	$('#gangnam').hide();
					    }	
					    else if(c.value == "g")
				    	{
					    	$('#hongdae').hide();
					    	$('#gangnam').show();
				    	}					    
					}
					
					</script>
					
					<div id="hongdae">
						<% for(i=0; i<10; i++) {%>
						
						<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
							<div class="card">
								<img class="card-img-top" src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg" alt="Card image" style="width: 100%">
								<div class="card-body">
									<h4 class="card-title" id="htitle">홍대 놀거리</h4>
									<p class="card-text">방탈출</p>
								</div>
								<input type="checkbox" id="hCheck" value="<%  %>" onclick="check(this)">선택
							</div>														
						</div>
						
						<%} %>
					</div><!--홍대  -->
					<div id="gangnam">
						<% for(int i=0; i<10; i++) {%>
						<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
							<div class="card">
								<img class="card-img-top" src="<%= contextPath %>/resources/img/gyeongbokgung-palace.jpg" alt="Card image" style="width: 100%">
								<div class="card-body">
									<h4 class="card-title" id="gtitle">강남 놀거리</h4>
									<p class="card-text">강남 </p>
								</div>
								<input type="checkbox" id="gCheck" value="<% %>" onclick="check(this)">선택
							</div>							
						</div>
						<%} %>
						
					</div><!--강남  -->
					
				</div><!-- courseList nice-scroll -->
				
				<div class="courseName">
					<br>
					
					<form action="경로넣기" method="get">
						코스 이름 : <input maxlength="100"	type="text" required="required" id="courseName" placeholder="코스의 이름을 입력해주세요" /><br><br>
					    <textarea name="opinion" cols="80" rows="6" style="width: 300px;"></textarea><br>
					    <input type="submit" value="코스 등록" id="courseAdd">
					</form>
				</div>
				<script>
					function check(){
						if($('input:checkbox[id="hCheck"]').is(":checked") == true)
						{
							var htitle = $("#htitle" ).text();
							document.querySelector("textarea").innerHTML+=htitle+"\n";							
						}
						else if($('input:checkbox[id="gCheck"]').is(":checked") == true)
						{
							var gtitle = $("#gtitle" ).text();
							document.querySelector("textarea").innerHTML+=gtitle+"\n";							
						}
					}
					$(function() {

						$("#courseAdd").click(function() {
							var courseName = document.getElementsByName('courseName').value; 
							if(courseName!= null)
							{
								var result = confirm("선택한 일정대로 코스를 등록하겠습니까?")
								if (result) {
									alert("추천 코스가 등록되었습니다.")
								} else {
									location.reload();
								}
							}
							else
							{
								alert("추천 코스의 이름을 적어주세요.")
							}
						

						});

					});
					</script>
				</div><!-- admin-showpage -->
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>