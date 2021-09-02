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
<title>어디어디 - 관리자페이지(공지삭제및수정가능)</title>
<style>

  ul{
        list-style: none;
    }

    .new_noti_update{
       text-align: center;
    }

.admin {
    background-color: #FFF3E7;
    height: 1000px; 
    padding: 0px 50px 50px 50px;
}
.admin-showpage{
	float: right;
    width: 1250px;
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
				
    <div class="container">
                  <div class="row">
                      <div class="col-md-8 mt-5">
                          <form method="post" th:object="${post}">
                              <form>
                                  <div class="content">
                          
                                      <div class="container">
                          
                                          <div class="table-responsive">
                          
                                              <table class="table custom-table">
                                                  <thead>
                                                      <tr>
                                                          <th scope="col">
                                                              <label class="control control--checkbox">
                                                                  <!-- <input type="checkbox" class="js-check-all" /> -->
                                                                  <div class="control__indicator"></div>
                                                              </label>
                                                          </th>
                                                          <th scope="col">No.</th>
                                                          <th scope="col">제목</th>
                                                          <th scope="col">내용</th>
                                                          <th scope="col">조회수</th>
                                                          <th scope="col">수정</th>
                                                          <th scope="col">삭제</th>
                          
                                                      </tr>
                                                  </thead>
                                                  <tbody>
                                                      <tr>
                                                          <th scope="row">
                                                              <label class="control control--checkbox">
                                                                  <!-- <input type="checkbox" /> -->
                                                                  <div class="control__indicator"></div>
                                                              </label>
                                                          </th>
                                                          <td>
                                                              1
                                                          </td>
                                                          <td>[공지] 안녕하세요 여러분 </td>
                                                          <td>
                                                              여기에 뭘 적으면 내용이 들어옵니다
                                                              <!-- <small class="d-block">ar farF away, behind the word mountains</small> -->
                                                          </td>
                                                          <td>100</td>
                          
                                                          <td>
                          
                                                              <ul class="">
                                                                  <li>
                                                                      <a href="#">
                                                                          <a href=""><button type="button" class="btn btn-dark">수정</button></a>
                                                                      </a>
                                                                  </li>
                                                              </ul>
                                                          </td>
                                                          <td>
                                                              <a href="#">
                                                                  <a href=""><button type="button" class="btn btn-dark">삭제</button></a>
                                                              </a>
                                                          </td>
                          
                                                      </tr>
                          
                                                      <tr>
                                                          <th scope="row">
                                                              <label class="control control--checkbox">
                                                                  <!-- <input type="checkbox" /> -->
                                                                  <div class="control__indicator"></div>
                                                              </label>
                                                          </th>
                                                          <td>2</td>
                                                          <td>[공지]새로운 공지사항 </td>
                                                          <td>
                                                              넘 여려운 공지사항이넵...
                                                          </td>
                                                          <td>10</td>
                          
                                                          <td>
                                                              <ul class="">
                                                                  <li>
                                                                      <a href="#">
                                                                          <a href=""><button type="button" class="btn btn-dark">수정</button></a>
                                                                      </a>
                                                                  </li>
                                                              </ul>
                                                          </td>
                          
                                                          <td>
                                                              <a href="#">
                                                                  <a href=""><button type="button" class="btn btn-dark">삭제</button></a>
                                                              </a>
                                                          </td>
                          
                                                      </tr>
                          
                                                      <tr>
                                                          <th scope="row">
                                                              <label class="control control--checkbox">
                                                                  <!-- <input type="checkbox" /> -->
                                                                  <div class="control__indicator"></div>
                                                              </label>
                                                          </th>
                                                          <td>3</td>
                                                          <td>[공지]개인정보 이용약관..</td>
                                                          <td>
                                                              넘나 어려운것..
                                                          </td>
                                                          <td>0</td>
                                                          <td>
                                                              <ul class="">
                                                                  <li>
                                                                      <a href="#">
                                                                          <a href=""><button type="button" class="btn btn-dark">수정</button></a>
                                                                      </a>
                                                                  </li>
                                                              </ul>
                                                          </td>
                          
                                                          <td>
                                                              <a href="#">
                                                                  <a href=""><button type="button" class="btn btn-dark">삭제</button></a>
                                                              </a>
                                                          </td>
                          
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </div>
                          
                          
                                      </div>
                          
                                  </div>
                              </form> <!-- 폼 -->
                              
                              
                       <!-- 새공지사항 등록 버튼  -->       
				<div class="new_noti_update"> 
				    <a href="<%=contextPath%>/views/notice/newNotice.jsp"><button type="button" class="btn btn-dark">새 공지 등록하기 </button></a>
				
				</div>
				                              
                  
                      </div>
                  </div>
              
              </div>
				
				</div>
		</section><!-- admin -->
	</section><!-- page- start -->




	<%@ include file="../common/footer.jsp"%>

	<script src="<%= contextPath %>/resources/js/main.js"></script>

</body>
</html>