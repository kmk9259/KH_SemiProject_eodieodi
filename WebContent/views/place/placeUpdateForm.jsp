<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,semiProject.com.kh.board.model.vo.*,semiProject.com.kh.place.model.vo.*"%>
<%@ page import="semiProject.com.kh.area.model.vo.*,semiProject.com.kh.category.model.vo.*"%>
<%
	Place p = (Place)request.getAttribute("p");
	PlaceAttachment pa = (PlaceAttachment)request.getAttribute("pa");
	
	ArrayList<Area> alist = (ArrayList<Area>)request.getAttribute("alist");
	ArrayList<Category> clist = (ArrayList<Category>)request.getAttribute("clist");

	String[] selected = new String[alist.size()];	//size가 2면 0,1 index
	String[] selected2 = new String[clist.size()];
	for(int i=0; i<alist.size(); i++)	//0, 1
	{
		if(p.getAreaNo()==(i+1))	//ano ==1 i==0+1 ano==2 == i1+1
			selected[i]="selected";
	}
	for(int i=0; i<clist.size(); i++)	//0, 1,2
	{
		if(p.getCategoryNo()==(i+1))	//cno ==1 i==0+1 ano==2 == i1+1
			selected2[i]="selected";
	}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>어디어디 - 관리자페이지(일정 수정)</title>
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
							<h2>일정 수정</h2>
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
							<li class="menuB parent"><a href="" data-toggle="tab">커뮤니티	관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.no">공지사항 조회</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
								<li class="active menuB "><a href="<%= contextPath %>/list.pl">일정 조회</a></li>
								<li class="menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
								<li class="menuB "> <a href="<%=contextPath%>/deleteP.pl">일정 삭제</a></li>
								
								<li class="menuB parent"><a href="" data-toggle="tab">코스 관리</a></li>
								<li class="menuB "><a href="<%= contextPath %>/list.co">코스 조회</a></li>								
								<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>

						</ul>
					</nav>
				</div>
			</div>
			<!--menu bar  -->
			<div class="admin-showpage nice-scroll">
					<div class="tab-content">
						<!-- 일정 수정 -->
						<div class="tab-pane active text-style placeAddForm">
							
							<form id="insertForm" action="<%=contextPath%>/update.pl" method="post"	enctype="multipart/form-data">
								<input type="hidden" name="pNo" value="<%= p.getPlaceNo() %>">
								<div class="form-group">
									<label class="control-label" style="margin-top: 30px;">지역</label><br>									
									<select name="areaNo" class="planInput" >
										<option value="0">지역을 선택해주세요</option>
					                    <%for(int i=0; i<alist.size(); i++) {%>
											<option value="<%=alist.get(i).getAreaNo()%>" <%=selected[i] %>><%=alist.get(i).getAreaName() %></option>
										<%} %>				                    
					                </select><br><br>
									<label class="control-label">카테고리</label><br>
									<select name="categoryNo" class="planInput" >
										<option value="0">카테고리를 선택해주세요</option>
					                    <%for(int i=0; i<clist.size(); i++) {%>
											<option value="<%=clist.get(i).getCategoryNo()%>" <%= selected2[i] %>><%=clist.get(i).getCategoryName() %></option>
										<%} %>				          
					                </select> <br><br>
									<label class="control-label">상호명</label> 
									<input value="<%= p.getPlaceTitle() %>" maxlength="20" type="text" name="placeTitle" required="required" class="form-control" placeholder="상호명을 입력해주세요" /> 
									<label class="control-label">전화번호</label>
									<input value="<%= p.getPlacePhone() %>" maxlength="15" type="tel" name="placePhone" required="required" class="form-control" placeholder="전화번호를 입력해주세요" /> 
									
									<label class="control-label">설명</label> 
									<c:set var="description" value="<%= p.getDescription() %>"/>
									<input value="${fn:escapeXml(description)}" maxlength="1000" type="text" name="description" required="required" class="form-control" placeholder="주요 메뉴를 입력해주세요" /> 
									
									<label class="control-label">영업 시간</label> 
									<input value="<%= p.getBsHour() %>" maxlength="50" type="text" name="bsHour" required="required" class="form-control" placeholder="영업 시간을 입력해주세요" /> 
									<label class="control-label">대표 금액</label> 
									<input value="<%= p.getPrice() %>" maxlength="10" type="text" name="price" required="required" class="form-control" placeholder="대표 금액을 입력해주세요(숫자만)" /> 
									<label class="control-label">상세주소</label>
									<input value="<%= p.getAddress() %>" maxlength="50" type="text" name="address" required="required" class="form-control" placeholder="상세주소를 입력해주세요" /> <br>
									<img name="titleImg" width="150" height="120" id=titleImg src="<%=contextPath%>/resources/place_upFiles/<%=p.getTitleImg()%>"> <br> 
									<label> 대표 이미지</label>
									
									<div id="fileArea">
										<% if (pa != null) {%>
										<input type='hidden' name='originFile' value='<%=pa.getChangeName()%>'>
										<input type='hidden' name='originFileNo' value='<%=pa.getFileNo()%>'>
						
										<%} %>
										<input type="file" name="upFile" id="file1" onchange="loadImg(this, 1);">
									</div>
								</div>

								<button id="btn" class="nextBtn btn-ms pull-right" type="submit">수정하기</button>
							</form>
						</div>
						<script>
						$('#insertForm').on("keydown", "input[type='text']", function() {
							var text = $("#insertForm input[type='text']").val();
							console.log("text"+text);
							if($(this).val().length > $(this).attr('maxlength'))
							{
								alert("최대 글자수는 "+$(this).attr('maxlength')+"입니다!");
								$(this).val($(this).val().substr(0, $(this).attr('maxlength'))); 
							}
							
							
						});
							$(function() {
								$("#fileArea").hide();
								
								$("#titleImg").click(function() {
									 $("#file1").click(); 
								});
								$("#btn").click(function() {
									var result = confirm("일정을 수정하시겠습니까?")
									if (result) {
										alert("일정이 수정되었습니다.")
									} else {
										location.reload();
									}

								});
							});
							
							function fieldCheck(){
								var text = $("#insertForm input[type='text']");	
								var selected = $("#insertForm select");
								
								for(var i=0; i<selected.length; i++){
									if(0==$(selected[i]).val() && $(selected[i]).attr("name")=="areaNo"){
										alert("지역을 선택해주세요");
										return false;									
									}else if(0==$(selected[i]).val() && $(selected[i]).attr("name")=="categoryNo"){
										alert("카테고리를 선택해주세요");
										return false;
									}							
								} 	
								for(var i=0; i<text.length; i++){
									if(""==$(text[i]).val() || null == $(text[i]).val()){
										var elename = $(text[i]).attr("name");
										$("."+elename).focus();
										alert("빈 칸을 다 입력해주세요");
										return false;
									}									
								} 
								
								if($('#file1').val() == "") {
									alert("대표사진을 등록해주세요");
								    $("#file1").focus();
								    return false;
								}
							}
							function loadImg(inputFile, num) {// 이미지 미리보기 
								//inputFile : 현재 변화가 생긴 input type = "file"
								//num : 조건문을 활용 하기 위해 전달받은 매개변수

								console.dir(inputFile);

								if (inputFile.files.length == 1) {//file이 존재 할경우 
									var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 

									reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )

									reader.onload = function(e) {//파일 읽기가 다완료 되면 실행할 메소드 
										console.log(e);
										switch (num) {
										case 1 : $("#titleImg").attr("src", e.target.result); break;// result :  읽어들이 파일 내용 data:URL 형식 
										}
									};

								}
							}
						</script>
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