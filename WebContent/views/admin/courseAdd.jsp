<%@page import="semiProject.com.kh.theme.model.vo.Theme"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.category.model.vo.*,semiProject.com.kh.place.model.vo.*,semiProject.com.kh.theme.model.vo.*,semiProject.com.kh.area.model.vo.*"%>
<%
	ArrayList<Place> plist = (ArrayList<Place>)request.getAttribute("plist");
	ArrayList<Theme> tlist = (ArrayList<Theme>)request.getAttribute("tlist");	
	ArrayList<Area> alist = (ArrayList<Area>)request.getAttribute("alist");
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
.card-body{
	background-color: #FFF3E7;
    border: 1px solid #D34B32;
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
								<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티	관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.no">공지사항 조회</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.pl">일정 조회</a></li>
								<li class="menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
								<li class="menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">코스 관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
								<li class="active  menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
				<div class="admin-showpage ">
				<div class="courseList nice-scroll" style="height: 1000px; width: 1500px;">
					<div>
							<select id="placeChoice" name="placeChoice" onchange="changeArea(this)">
								<option value="0" selected>지역을 선택하세요</option>
								<%for(Area a : alist) {%>
								<option value="<%=a.getAreaNo()%>"><%=a.getAreaName() %></option>
								<%} %>
								
							</select><br><br>
					</div>
					
					<div id="placeList" style="display: inline-flex;" >
					
					</div>
					
						
					<br><br><br>
					<form action="cInsert.co" method="post">
						
						코스이름: <input maxlength="100"type="text" required="required" name="courseTitle" placeholder="코스의이름을입력해주세요" /><br>
						지역종류: 	<% for(Area a : alist) {%>
									<label><input type="radio" name="area" value="<%=a.getAreaNo() %>" ><%=a.getAreaName() %></label>
								<%} %><br>
								
						테마종류: 	<% for(Theme t : tlist) {%>
									<label><input type="radio" name="themeNo" value="<%=t.getThemeNo() %>"> <%=t.getThemeName() %></label>
								<%} %><br><br>
						<textarea id="textarea" name="pNo" rows="5" cols="300" style="resize: none;"></textarea><br>
						<input type="submit" value="코스등록" id="courseAdd">
					</form>
					
				</div>
				<script>
				function changeArea(obj)
				{
					var placeChoice = document.getElementById('placeChoice');
					var areaNo = placeChoice.options[placeChoice.selectedIndex].value;
					$("#placeList").empty();
					$.ajax({
						url : "pList.co",
						type : "post",
						data:{areaNo : areaNo},
						success:function(list){
							console.log(list);
							var value="";
							var contextPath = "<%=contextPath%>";
							for(var i in list)
							{
								switch(list[i].categoryNo){
								case 1 :
									var categortName="먹기";
									console.log(categortName);
									break;
								case 2 :
									var categortName="마시기" 
									console.log(categortName);
									break;
								case 3 :
									var categortName="놀기"
										console.log(categortName);
									break;
								
								}
								value +=
									'<div class="card-group >'
									+'<div class="card col" style="float:left">'
									+'<div class="embed-responsive embed-responsive-4by3">'
									+'<img  class="card-img-top embed-responsive-item" src="'+contextPath+'/resources/place_upFiles/'+list[i].titleImg+'" alt="Card image" >'
									+'</div>'
									+'<div class="card-body" >'
									+'<h5 class="card-title" style="text-align : center">No.'+list[i].placeNo+"\t"+list[i].placeTitle+'</h5>'
									+'<p class="card-text"><b>카테고리: '+categortName+'</b></p><br>'
									+'<input type="checkbox" id="check" class="check" name="check" onclick="checkbox(this)" value="'+list[i].placeNo+'">선택'
									+'</div></div></div>'; 
						}
						 $("#placeList").html(value).trigger("create"); 
						},
						error:function(){
							console.log("ajax 통신 실패 - 지역선택 넘겨주기");
						}
					})
					
				}
				
				function checkbox(check)
				{				
					var placeNo = check.value;
					
					var result = document.getElementById("textarea");
					if( check.checked==true )
					{
						console.log("체크박스 체크했을 때"+placeNo);
						if (result.value == "") 
						{
							result.value = placeNo;
						} 
						else 
						{
							result.value += "," + placeNo;
						}
					} 
					else 
					{
						var resultArr = result.value.split(",");
						for (var i = 0; i < resultArr.length; i++) 
						{
							if (resultArr[i] == placeNo) 
							{
								resultArr.splice(i, 1);
								break;
							}
						}
						result.value = resultArr.join(",");

					}
				}
				
					$(function() {

						/* $("#courseAdd").click(function() {
							var result = confirm("추천 코스를 등록하시겠습니까?")
							if (result) {
								alert("추천 코스가 등록되었습니다.")
							} else {
								location.reload();
							}

						}); */

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