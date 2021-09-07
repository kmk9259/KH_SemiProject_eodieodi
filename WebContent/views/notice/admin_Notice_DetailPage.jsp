<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="semiProject.com.kh.notice.model.vo.Notice"%>
    
  <%
	Notice n = (Notice)request.getAttribute("notice");
%>
	
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디</title>
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
	height: 700px;
	padding: 10px;
	margin-top: 2.5%;
	background-color: #FFF3E7;
	border: 1px solid #D34B32;
}

 #dt,#wr{
	
	float: right;

}

.btns{

	margin-top:10px;
}

 

</style>

</head>

<body>
    <!-- Page Preloder -->
	<!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

     <%@ include file="../common/menubar.jsp"%>
		<!-- 페이지 상단부  -->
		<!-- Listing Section Begin  -->
	<section class="listing-hero set-bg" data-setbg="<%= contextPath %>/resources/img/breadcrumb/breadcrumb-blog2.gif">
		<div class="container">
		    <div class="row">
		        <div class="col-lg-8">
		            <div class="listing__hero__option">
		
		                <div class="listing__hero__text">
		                    <h2>공지사항 </h2>
		                    <div class="breadcrumb__option">
		                        <a href="./index.jsp"><i class="fa fa-home"></i> 홈</a>
		                        <span>공지사항 </span>
		                    </div>
		                    <p>공지사항 조회페이지 </p>
		                </div>
		            </div>
		        </div>
		
		    </div>
		</div>
		</section>

<section class="page-start">
    <!--메뉴바 같이 내려오는 시작점 -->

		<section class="admin">
			<!------ MENUSIDE BAR ---------->
				<div class=" menuBar">
					<div class="col-sm-2">
						<nav class="nav-sidebar">
							<ul class="nav tabs">
								<li class="menuB parent"><a href="<%=contextPath %>/views/notice/admin_NoticeList.jsp">커뮤니티
										관리</a></li>
								<li class="menuB "><a href="<%=contextPath %>/views/notice/newNotice.jsp">공지사항 등록</a></li>
								<li class="menuB "><a href="<%=contextPath %>/views/notice/admin_Notice_Update.jsp">공지사항 수정</a></li>
								<li class="menuB parent"><a href="" data-toggle="tab">일정관리</a></li>
								<li class=" menuB "><a
									href="<%=contextPath%>/views/admin/placeAdd.jsp">일정 등록</a></li>
								<li class="active menuB ">
								<a href="<%=contextPath%>/views/admin/placeDelete.jsp">일정 삭제</a></li>
								<li class="menuB"><a href="<%=contextPath%>/views/admin/courseAdd.jsp">코스 등록</a></li>
								<li class="menuB"><a href="#" data-toggle="tab">코스 삭제</a></li>
								<li class="menuB parent"><a href="#">회원 관리</a></li>

							</ul>
						</nav>
					</div>
				</div>	
				<div class="admin-showpage">
				
					 <br>
						<h2 align="center">공지사항 상세보기 </h2>
						<br>
						<form>
					   <input type="hidden" name ="nno" value="<%=n.getNoticeNo()%>">
						<div>게시글 No. <%=n.getNoticeNo() %></div>
						<hr/>
						<div >게시글 제목 : <h3><%= n.getNoticeTitle() %></h3> </div>
						<hr/>
						<div id="wr">작성자 : <%=n.getNoticeWriter() %></div><br>
						<div id="dt">작성날짜 : <%=n.getCreateDate()%></div>
					
						<div id="content"><%= n.getNoticeContent() %></div>
					
					
					 		<div class="btns" align="center">
							    
							        <a href="list.no">목록으로</a> &nbsp;&nbsp;
							        	<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
							       	<a href="updateForm.no?nno=<%=n.getNoticeNo()%>">수정하기</a> &nbsp;&nbsp;
							        <a href="delete.no?nno=<%=n.getNoticeNo()%>">삭제하기</a>  
							        <!-- 수정하기 및 삭제하기 버튼은 관리자만 뜨기  -->
							        <!-- 삭제하기 이후 목록으로 돌아가기 걸어주기  -->
					    
								<% } %>
								
					    	 </div>
						</form>
					 </section>

   
     </section>
                        
      


    <%@ include file="../common/footer.jsp"%>

    
    <script src="<%= contextPath %>/resources/js/main.js"></script>
</body>




<!-- 자바스크립트 함수부분  -->
		
		
<script>
    $(function () {
        var $header = $('header'); //헤더를 변수에 넣기
        var $page = $('.page-start'); //색상이 변할 부분
        var $window = $(window);
        var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

        $window.resize(function () { //반응형을 대비하여 리사이즈시 top값을 다시 계산
            pageOffsetTop = $page.offset().top;
        });

        $window.on('scroll', function () { //스크롤시
            var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
            $header.toggleClass('down', scrolled); //클래스 토글
        });
    });

</script>

</html>