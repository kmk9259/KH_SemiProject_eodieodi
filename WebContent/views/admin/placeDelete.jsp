<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.area.model.vo.*,semiProject.com.kh.place.model.vo.*"%>
<%
	
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
<title>어디어디 - 관리자페이지(일정삭제)</title>
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
.my-scroll {
	height: 100%;
	overflow-y: auto;
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
			<div class=" menuBar">
				<div class="col-sm-2">
					<nav class="nav-sidebar">
						<ul class="nav tabs">
							<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티	관리</a></li>
							<li class="menuB "><a href="<%= contextPath %>/list.no">공지사항 조회</a></li>
							
							<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
							<li class="menuB "><a href="<%= contextPath %>/list.pl">일정 조회</a></li>
							<li class="menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
							<li class="active menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
							
							<li class="menuB parent"><a href="" data-toggle="tab">코스 관리</a></li>
							<li class="menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
							<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
							<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
							
							<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

						</ul>
					</nav>
				</div>
			</div>					
			<div class="admin-showpage my-scroll">
				<div class="col-lg-12">
			        <div class="section-title">
			            <h2 style="margin: 0px;">일정 삭제</h2>
			        </div>	    
				</div><!-- class="col-lg-12" -->
				<select id="placeChoice" name="placeChoice" onchange="changeArea(this)">
						<option value="0" selected>지역을 선택하세요</option>
						<%for(Area a : alist) {%>							
						<option value="<%=a.getAreaNo()%>"><%=a.getAreaName() %></option>
						<%} %>

				</select><br><br>
				<section class="most-search spad ">
					<div class="container">
						<div class="row " >
							<div class=" ">
								<div class="tab-pane active" id="tabs-1" role="tabpanel">
									<div class="row" id="placeList">
									
									</div>
								</div>
			                </div>
			            </div>
			        </div>
				</section>		
				
				
			</div><!-- admin-showpage -->
			<script>
			
			function changeArea(obj)
			{
				var placeChoice = document.getElementById('placeChoice');
				var aNo = placeChoice.options[placeChoice.selectedIndex].value;
				$("#placeList").empty();
				$.ajax({
					url : "Pdelete.pl",
					type : "post",
					data:{aNo : aNo},
					async:false,
					success:function(list){
						var value="";
						for(var i in list)
						{
							var titleImg = list[i].titleImg;
							var src = "<%= contextPath%>/resources/place_upFiles/"+titleImg;
							switch(list[i].categoryNo){
							case 1 :
								var categortName="먹기";
								break;
							case 2 :
								var categortName="마시기" 
								break;
							case 3 :
								var categortName="놀기"
								break;							
							}
							
							value +=
								'<div class="col-lg-4 col-md-4">'+
								'<div class="listing__item">'+
									'<input type="hidden" name="pNo" id="placeNo" value="'+list[i].placeNo+'">'+
								    '<div class="listing__item__pic set-bg" style="height:300px; background-image: url(' + src + '); ">'+
								        '<img src="resources/img/listing/list_icon-1.png" alt="">'+
								        '<div class="listing__item__pic__tag">NO. '+list[i].placeNo+'</div>'+								        
								    '</div>'+
									'<div class="listing__item__text">'+
									    '<div class="listing__item__text__inside">'+
									        '<h5>'+list[i].placeTitle+'</h5>'+
									        '<p>'+list[i].description+'</p>'+
									        '<div class="listing__item__text__rating">'+
									            '<div class="listing__item__rating__star">'+
									                '<span class="icon_star"></span>'+
									                '<span class="icon_star"></span>'+
									                '<span class="icon_star"></span>'+
									                '<span class="icon_star"></span>'+
									                '<span class="icon_star-half_alt"></span>'+
									            '</div>'+
									            '<h6>'+list[i].price+' 원</h6>'+
									            '</div>'+
									        '<ul>'+
									            '<li><span class="icon_pin_alt"></span> '+list[i].address+'</li>'+
									            '<li><span class="icon_phone"></span> '+list[i].placePhone+'</li>'+
									        '</ul></div>'+
									    '<div class="listing__item__text__info">'+
									        '<div class="listing__item__text__info__left">'+
									            '<img src="resources/img/listing/list_small_icon-1.png" alt="">'+
									            '<span>'+categortName+'</span></div>'+
									        '<div class="listing__item__text__info__right">Open Now</div>'+
									    '</div>'+
									    '<button class="btn ">삭제하기</button>'+
									'</div></div></div>'
						}
						
						 $("#placeList").html(value).trigger("create");
						 $(function(){
								$(".btn").click(function(){
									var parent = $(this).parent().parent();  
									var pNo = parent.children("#placeNo").val();
									location.href="<%=contextPath%>/deleteP.pl?pNo="+pNo;
										
									
									
									
								});
							});
						 
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