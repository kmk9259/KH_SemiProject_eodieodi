<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.place.model.vo.*,semiProject.com.kh.theme.model.vo.*,semiProject.com.kh.area.model.vo.*"%>
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
								<li class="active menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
								<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
			<div class="admin-showpage nice-scroll">
		
					<div class="section-title">
								<h2 style="margin: 0px;">코스 조회</h2>
							</div>
					<div>
						<select id="placeChoice" name="placeChoice" onchange="changeArea(this)">
							<option value="0" selected>지역을 선택하세요</option>
							<%for(Area a : alist) {%>
							
							<option value="<%=a.getAreaNo()%>"><%=a.getAreaName() %></option>
							
							<%} %>

						</select><br><br>

					</div>
					<br><br>
			<section class="news-post spad">
				<div class="container">
					<div class="row" id="courseList">
		                
		            </div>
		        </div>
			</section>
					
					
			</div><!-- admin-showpage nice-scroll -->
			<script>
			function changeArea(obj)
			{
				var placeChoice = document.getElementById('placeChoice');
				var aNo = placeChoice.options[placeChoice.selectedIndex].value;
				$("#courseList").empty();
				$.ajax({
					url : "cList.co",
					type : "post",
					data:{aNo : aNo},
					success:function(map){
						var tmp="";
						$.each(map["cArr"], function(index, value) {
							var TitleImg =  getTitleImg(value.courseNo, value.areaNo)
							var src = "<%= contextPath%>/resources/place_upFiles/"+TitleImg;
							
							switch(value.areaNo){
							case 1 :
								var areaName="홍대";								
								break;
							case 2 :
								var areaName="강남";
								break;							
							}
							switch(value.themeNo){
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
							tmp +='<div class="col-lg-4 col-md-6">'
	                    		+'<div class="blog__item">'
	                    			+'<input type="hidden" id="courseNo" class="courseNo" name="courseNo" value="'+value.courseNo+'">'
                        			+'<div class="blog__item__pic set-bg" style="height:300px; background-image: url(' + src + '); "></div>'
                        			+'<div class="listing__item__pic__tag">NO. '+value.courseNo+'</div>'
                        			+'<div class="blog__item__text">'
			                            +'<ul class="blog__item__tags">'
			                                +'<li><i class="fa fa-tags"></i>'+areaName+'</li>'
			                                +'<li>'+themeName+'</li>'
			                            +'</ul>'
			                            +'<h5><a href="#">'+value.courseTitle+'</a></h5>'
		                            	+'<button class="btn ">수정하기</button>'
				                    +'</div>'
				                    +'</div>'
                    			+'</div>'
           					+'</div>';
							
						})
						
						 $("#courseList").html(tmp).trigger("create");
						 $(function(){
								$(".blog__item__pic").click(function(){
									var parent = $(this).parents();  
									var cNo = parent.children("#courseNo").val();
									
									location.href="<%=contextPath%>/cplaceDetail.co?cNo="+cNo;
								});
							});
						 $(function(){
								$(".btn").click(function(){
									var parent = $(this).parent().parent();  
									var cNo = parent.children("#courseNo").val(); 
									location.href="<%=contextPath%>/updateForm.co?cNo="+cNo;
										
									
									
									
								});
							});
						 
					}//success					
				})				
			}
			function getTitleImg(cNo, aNo)
			{
				var src ="";
				console.log(cNo, aNo);
				$.ajax({
					url : "cList.co",
					type : "post",
					data:{cNo : cNo, aNo: aNo},
					async:false,
					success:function(map){
						var tmp="";
						$.each(map["tArr"], function(index, value) {
							console.log(value);
							console.log(value.areaNo);
							src = value.titleImg;
						})
					}//success	
				})
				return src;
			}
			
			
			
			</script>
			
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>