<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.category.model.vo.*,semiProject.com.kh.place.model.vo.*,semiProject.com.kh.theme.model.vo.*,semiProject.com.kh.area.model.vo.*"%>
<%
	ArrayList<Theme> tlist = (ArrayList<Theme>)request.getAttribute("tlist");	
	ArrayList<Area> alist = (ArrayList<Area>)request.getAttribute("alist");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>어디어디 - 관리자페이지(코스 조회)</title>
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
#courseList{
border:1px solid white;
text-align:center;
}
#courseList>tbody>tr:hover{
		background:darkgrey;
		cursor:pointer
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
							<h2>코스 조회</h2>
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
								<li class="active menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
								<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseDelete.jsp" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
			<div class="admin-showpage nice-scroll">
			<div class="courseList nice-scroll" style="height: 1000px; width: 1500px;">
					<div >
							<select id="placeChoice" name="placeChoice" onchange="changeArea(this)">
								<option value="0" selected>지역을 선택하세요</option>
								<%for(Area a : alist) {%>
								<option value="<%=a.getAreaNo()%>"><%=a.getAreaName() %></option>
								<%} %>
								
							</select><br><br>
							
					</div>
					<br><br>
					<table id="courseList" class="courseList" >
					</table>
					
					
					
			</div>
			</div><!-- admin-showpage nice-scroll -->
			<script>
			function changeArea(obj)
			{
				var placeChoice = document.getElementById('placeChoice');
				var areaNo = placeChoice.options[placeChoice.selectedIndex].value;
				console.log(areaNo+"   areaNo")
				$("#courseList").empty();
				$.ajax({
					url : "cList.co",
					type : "post",
					data:{areaNo : areaNo},
					success:function(list){
						console.log(list);
						var value="";
						var contextPath = "<%=contextPath%>";
						
						for(var i in list)
						{
							switch(list[i].areaNo){
							case 1 :
								var areaName="홍대";								
								break;
							case 2 :
								var areaName="강남";
								break;							
							}
							switch(list[i].themeNo){
							case 1 :
								var themeName="연인과함께";								
								break;
							case 2 :
								var themeName="가족과함께";								
								break;
							case 3 :
								var themeName="친구와함께";								
								break;
							}
							value += '<thead><tr><th width="100">코스 NO.</th><th width="100">지역</th><th width="100">테마</th><th width="300">코스 제목</th>'
									
									+'</tr></thead>'
									+'<tbody>'
									+'<tr>'
										+'<td >'+list[i].courseNo+'</td>'
										+'<td>'+areaName+'</td>'
										+'<td >'+themeName+'</td>'
										+'<td >'+list[i].courseTitle+'</td>'
										
									+'</tr>'
									+'</tbody>';
									 
							
						} //for
						 $("#courseList").html(value);
						
					}//success					
				})
				
			}
			
			
			
			</script>
			
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>