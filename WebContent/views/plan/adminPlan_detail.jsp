<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, semiProject.com.kh.planAdmin.model.vo.*,
    semiProject.com.kh.member.model.vo.*" %>
 
    <%

    //AdminPlan apList = (AdminPlan) request.getAttribute("apList");	
   
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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<!-- 제이쿼리 피커데이트 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	
	<!--드롭다운-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

	<!-- 추천일정 상세페이지 css  -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminPlan.css" type="text/css">



		<style>
		
		.btn_section {
			text-align: center;
			margin-top: 10%;
		}
		
		.main_box {
			float: none;
			margin-top: 10%;
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
		                    <h2>추천 일정</h2>
		                    <div class="breadcrumb__option">
		                        <a href="./index.jsp"><i class="fa fa-home"></i> 홈</a>
		                        <span>추천일정</span>
		                    </div>
		                    <p> 테마와 위치 날짜를 선택하시면 일정을 추천해 드립니다!</p>
		                </div>
		            </div>
		        </div>
		
		    </div>
		</div>
		</section>

<section class="page-start">
   
    <div class="main_box">
    
     <div class="container">
        <div class="main-timeline">
                                <!-- start experience section-->
                                
                         <form method ="post" action="<%= request.getContextPath() %>/adminCreate.pl">

                      <div>장소: <%=  %></div>
                      <div>날짜: <%= %></div>       
                      <div> 추천 코스:<%= apList %></div> 
                         </form> 
    
        </div>

    <div class="btn_section">
        <p>맘에 드신다면 아래 등록하기 버튼을 눌러 계속 진행해주세요 </p>
        <button class="btn btn-dark"><a href="<%= contextPath %>/index.jsp"">메인으로</a></button>
        <button class="btn btn-dark"><a href="<%= contextPath %>/views/plan/adminPlanSave.jsp"">등록하러가기</a></button>  
        </div>

    </div>
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