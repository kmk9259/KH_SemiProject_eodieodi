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
<title>어디어디 - 관리자페이지(새 공지사항 등록하기 )</title>
	<link rel="stylesheet"
	href="<%= request.getContextPath() %>/./resources/css/myInfo.css"
	type="text/css">

<style>
.admin {
	background-color: #FFF3E7;
	height: 1000px;
	padding: 0px 50px 50px 50px;
}

.admin-showpage {
	float: right;
	width: 1200px;
	margin-right: 50px;
	height: 400px;
	padding: 10px;
	margin-top: 2.5%;
	background-color: #FFF3E7;
	border: 1px solid #D34B32;
}

.content {
	height: 500px;
	width: 700px;
}

.title {
	width: 700px;
}

.btn_set{

	text-align: center;
	margin: 12px;

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
								<li class="menuB"><a href="<%=contextPath%>/cInsert.co">코스 등록</a></li>
								<li class="menuB"><a href="<%=contextPath%>/delete.co" >코스 삭제</a></li>
								
								<li class="menuB parent"><a href="<%=contextPath%>/allmemberList.me">회원 관리</a></li>


							</ul>
						</nav>
					</div>
				</div>	
				
				<div class="admin-showpage nice-scroll">
				
				
				 <div class="container">
                            <div class="row">
                                <div class="col-md-8 mt-5">
                                    <form method="post"  action=" <%= contextPath %>/insert.no">
                                    
                                     	   <h2 style="text-align: center">공지사항 등록</h2>
                                     	   <br>
                                        <div class="form-group">
                                            <label for="title">제목</label>
                                            <input  onKeyUp="javascript:fnChkByte(this,'30')"; type="text" id="title" name="title" placeholder="제목을 입력하세요" autocomplete="off" class="title"
                                                   />
                                        </div>
                        
                                        
                                            <label for="content">내용 </label>
                                            <textarea onKeyUp="javascript:titlefnChkByte(this,'2000')"type="text" id="content" name="content" placeholder="내용을 입력하세요 " class="content"
                                                    ></textarea> 
                                      
                                       <br>
                                       
                                      	 <div class="btn_set">
                                        <button class="site-btn" type="submit" >등록</button> 
                                        <button class="site-btn"type="reset">취소</button>
                					    </div>
                                      
                                       
                                    </form>
                                </div>
                            </div>
                        
                        </div>
        
				
				</div>
		</section><!-- admin -->
	</section><!-- page- end -->


				<script type="text/javascript">
				
				/* 
				
				 oninput="numberMaxLength(this);" maxlength='20'
				
				function numberMaxLength(e){
				    if(e.value.length > e.maxLength){
				        e.value = e.value.slice(0, e.maxLength);
				    }
				} */
				
				// 제목 글자수 제한 
				function fnChkByte(obj, maxByte)
				{
				    var str = obj.value;
				    var str_len = str.length;


				    var rbyte = 0;
				    var rlen = 0;
				    var one_char = "";
				    var str2 = "";


				    for(var i=0; i<str_len; i++)
				    {
				        one_char = str.charAt(i);
				        if(escape(one_char).length > 4) {
				            rbyte += 2;                                         //한글2Byte
				        }else{
				            rbyte++;                                            //영문 등 나머지 1Byte
				        }
				        if(rbyte <= maxByte){
				            rlen = i+1;                                          //return할 문자열 갯수
				        }
				     }
				     if(rbyte > maxByte)
				     {
				        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				        alert("제목은 최대 " + maxByte + "byte를 초과할 수 없습니다.")
				        str2 = str.substr(0,rlen);                                  //문자열 자르기
				        obj.value = str2;
				        fnChkByte(obj, maxByte);
				     }
				     else
				     {
				        document.getElementById('byteInfo').innerText = rbyte;
				     }
				}
				
				</script>
				
				<script type="text/javascript">
				
				
				function titlefnChkByte(obj, maxByte)
				{
				    var str = obj.value;
				    var str_len = str.length;


				    var rbyte = 0;
				    var rlen = 0;
				    var one_char = "";
				    var str2 = "";


				    for(var i=0; i<str_len; i++)
				    {
				        one_char = str.charAt(i);
				        if(escape(one_char).length > 4) {
				            rbyte += 2;                                         //한글2Byte
				        }else{
				            rbyte++;                                            //영문 등 나머지 1Byte
				        }
				        if(rbyte <= maxByte){
				            rlen = i+1;                                          //return할 문자열 갯수
				        }
				     }
				     if(rbyte > maxByte)
				     {
				        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				        alert("내용은 최대 " + maxByte + "byte를 초과할 수 없습니다. 2000 이하로 작성해주세요  ")
				        str2 = str.substr(0,rlen);                                  //문자열 자르기
				        obj.value = str2;
				        fnChkByte(obj, maxByte);
				     }
				     else
				     {
				        document.getElementById('byteInfo').innerText = rbyte;
				     }
				}
				
				
				</script>

	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>