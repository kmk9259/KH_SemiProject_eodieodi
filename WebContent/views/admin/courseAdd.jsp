<%@page import="semiProject.com.kh.theme.model.vo.Theme"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.place.model.vo.*,semiProject.com.kh.theme.model.vo.*,semiProject.com.kh.category.model.vo.*"%>
<%
	ArrayList<Place> plist = (ArrayList<Place>)request.getAttribute("plist");
	ArrayList<Theme> tlist = (ArrayList<Theme>)request.getAttribute("tlist");
	
	ArrayList<Category> clist = (ArrayList<Category>)request.getAttribute("clist");

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
								<li class="menuB parent"><a href="<%= contextPath %>/list.pl" >일정관리(조회)</a></li>
								<li class="menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
								<li class="menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
								<li class="active menuB"><a href="<%=contextPath%>/ccAdd.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp" >코스 삭제</a></li>
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
				<div class="admin-showpage ">
				<div class="courseList nice-scroll" style="height: 1000px; width: 1500px;">
					<div>
							<select id="placeChoice" onchange="choicePlace(this)">
								<option value="none">지역을 선택하세요</option>
								<option value="h">홍대</option>
								<option value="g">강남</option>
							</select><br><br>
					</div>
						
					<script>
					function choicePlace(c){
					    
					    if(c.value == "h")
					    {
					    	$('#hongdae').show();
					    	$('#gangnam').hide();
					    	$('#none').hide();
					    	
					    }	
					    else if(c.value == "g")
				    	{
					    	$('#hongdae').hide();
					    	$('#gangnam').show();
					    	$('#none').hide();
				    	}
					    else{
					    	$('#hongdae').hide();
					    	$('#gangnam').hide();
					    	$('#none').show();
					    	
					    }
					}
					
					</script>
				
				<div class="courseName">
					<br>
					<div id="none" style="display: none">지역을 선택해주세요</div>
					
					<div id="hongdae" style="display: none">
					<%for(Place p : plist){ %>						
						<%if(p.getAreaNo()==1 ){ %>					
							<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
								<input type="hidden" value="<%=p.getPlaceNo()%>" id="placeNo">
								<div class="card">
									<img class="card-img-top" src="<%=contextPath %>/resources/place_upFiles/<%= p.getTitleImg() %>" alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">No.<%= p.getPlaceNo() %>  <%=p.getPlaceTitle() %></h4>
										<%for (int i=0; i<clist.size(); i++){ %>
											<% if(p.getCategoryNo()== clist.get(i).getCategoryNo()) {%>
												<p class="card-text"><b>카테고리 : <%= clist.get(i).getCategoryName() %></p><br>
												<input type="hidden" value="<%= clist.get(i).getCategoryName() %>" id="categoryName">
											<%} %>
										<%} %>
										<form><!-- 체크밗 -->
											<input type="checkbox" onchange="checkBox(this)" name="check1" id="check1" value="<%=p.getPlaceTitle() %>">
											<label for="check">선택</label>
										</form>
										
										
									</div>
								</div>							
							</div>
						<%} %>
					<%} %><br><br>
					</div><br><br>
					<div id="gangnam" style="display: none">
					<%for(Place p : plist){ %>
						<%if(p.getAreaNo()==2 ){ %>					
							<div class="card-group card-deck" style="width: 300px; display: inline-block;" >
								<input type="hidden" value="<%=p.getPlaceNo()%>" id="placeNo">
								<div class="card">
									<img class="card-img-top" src="<%=contextPath %>/resources/place_upFiles/<%= p.getTitleImg() %>" alt="Card image" style="width: 100%">
									<div class="card-body">
										<h4 class="card-title">No.<%= p.getPlaceNo() %>  <%=p.getPlaceTitle() %></h4>
										<%for (int i=0; i<clist.size(); i++){ %>
											<% if(p.getCategoryNo()== clist.get(i).getCategoryNo()) {%>
												<p class="card-text"><b>카테고리 : <%= clist.get(i).getCategoryName() %></p><br>
											<%} %>
										<%} %>
										<form><!-- 체크밗 -->
											<input type="checkbox" onchange="checkBox(this)" name="check1" id="check1" value="<%=p.getPlaceTitle() %>">
											<label for="check">선택</label>
										</form>
										
										
									</div>
								</div>							
							</div>
						<%} %>
					<%} %><br><br>
					</div><br><br>
					
					<form action="경로넣기" method="post">
						코스 이름 : <input maxlength="100"	type="text" required="required" id="courseName" placeholder="코스의 이름을 입력해주세요" /><br>
						
						테마 종류 : <label><input type="radio" name="theme" value="<%=tlist.get(0).getThemeNo() %>"> 연인과 함께</label>
								<label><input type="radio" name="theme" value="<%=tlist.get(1).getThemeNo() %>"> 가족과 함께</label>
								<label><input type="radio" name="theme" value="<%=tlist.get(2).getThemeNo() %>"> 친구와 함께</label><br><br>
					    <textarea id="opinion" cols="80" rows="6" style="width: 300px;"></textarea><br><br>
					    <input type="submit" value="코스 등록" id="courseAdd">
					</form>
				</div>
				<script>
					
					function checkBox(checked){
					    var result = document.getElementById("opinion");
					    var categoryName = "카테고리 :"+document.getElementById("categoryName").value;
					    var content = "일정명 : "
					    if( checked.checked==true ){
					        console.log(result.value);
					        if(result.value == "" ){
					            result.value = checked.getAttribute("value")+categoryName;
					        }else{
					            result.value += "\n"+ checked.getAttribute("value")+categoryName;
					        }
					    }else {

					        var resultArr = result.value.split("\n");
					        for(var i=0; i<resultArr.length; i++){
					            if(resultArr[i] == checked.getAttribute("value")+categoryName){
					                resultArr.splice(i,1);
					                break;
					            }
					        }
					        result.value  = resultArr.join("\n");

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
				</div>
			</div><!-- admin-showpage -->
				
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>