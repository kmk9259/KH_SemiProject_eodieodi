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
<title>어디어디 - 관리자페이지(일정 등록)</title>
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
textarea:focus, input:focus, input[type]:focus, .uneditable-input:focus {
    border-color: rgba(105, 61, 209, 1);
    box-shadow: 0 1px 1px rgba(105, 61, 209, 0.075) inset, 0 0 8px rgba(105, 61, 209, 0.6);
    outline: 0 none;
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
							<h2>어디어디?!</h2>
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
								<li class="menuB "><a href="<%= contextPath %>/list.pl">일정 조회</a></li>
								<li class="active menuB "><a href="<%=contextPath%>/insertForm.pl">일정 등록</a></li>
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
				<div class="section-title">
		            <h2 style="margin: 0px;">일정 등록</h2>
		        </div>	
					<div class="">
						<!-- 일정 등록 -->
						<div class="tab-pane active text-style placeAddForm">
							
							<form id="insertForm" action="<%=contextPath%>/insert.pl" method="post" onsubmit="return fieldCheck()" enctype="multipart/form-data">
								<div class="form-group">
									<label class="control-label" style="margin-top: 30px;">지역</label><br>									
									<select name="areaNo" class="planInput" required>
										<option value="0" selected >지역을 선택해주세요</option>
					                    <option value="1">가로수길</option>
					                    <option value="2">강남</option>		
					                    <option value="3">건대</option>
					                    <option value="4">상수</option>
					                    <option value="5">신촌</option>
					                    <option value="6">여의도</option>
					                    <option value="7">이태원</option>
					                    <option value="8">종로</option>
					                    <option value="9">홍대</option>		                    
					                </select><br><br>
									<label class="control-label">카테고리</label><br>
									<select name="categoryNo" class="planInput" required>
										<option value="0" selected>카테고리를 선택해주세요</option>
					                    <option value="1" >먹기</option>
					                    <option value="2">마시기</option>	
					                    <option value="3">놀기</option>					                    
					                </select> <br><br>
					             
									<label class="control-label">상호명</label> 
									<input maxlength="20" type="text" id="placeTitle" name="placeTitle"  class="form-control" placeholder="상호명을 입력해주세요"/>									
									
									<label class="control-label">전화번호</label>
									<input maxlength="15" type="text" name="placePhone"  class="form-control" placeholder="전화번호를 입력해주세요" />
									
									<label class="control-label">설명</label> 
									<input maxlength="1000" type="text" name="description"  class="form-control" placeholder="주요 메뉴를 입력해주세요" /> 
									
									<label class="control-label">영업 시간</label> 
									<input maxlength="50" type="text" name="bsHour"  class="form-control" placeholder="영업 시간을 입력해주세요" /> 
									
									<label class="control-label">대표 금액(가격만)</label> 
									<input maxlength="6" type="text" name="price" class="form-control" pattern="[0-9]+" placeholder="대표 금액을 입력해주세요(숫자만)" /> 
									
									<label class="control-label">상세주소</label>
									<input maxlength="50" type="text" name="address"  class="form-control" placeholder="상세주소를 입력해주세요" /> <br>
									
									<img name="titleImg" width="150" height="120" id=titleImg> <br> 
									<label> 대표 이미지</label>
									
									<div id="fileArea">
										<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
									</div>
								</div>

								<button id="btn"  class="nextBtn btn-ms pull-right" type="submit">등록</button><br><br>
							</form><br><br>
						</div>
						<script>
						
						$('#insertForm').on("keydown", "input[type='text']", function() {
							var text = $("#insertForm input[type='text']");		
							if($(this).val().length > $(this).attr('maxlength'))
							{
								alert("최대 글자수는 "+$(this).attr('maxlength')+"입니다!");
								$(this).val($(this).val().substr(0, $(this).attr('maxlength'))); 
							}
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
						$(function(){
							$("#fileArea").hide();
							
							$("#titleImg").click(function() {
								 $("#file1").click(); 
							});
							
						});
						
						
						
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