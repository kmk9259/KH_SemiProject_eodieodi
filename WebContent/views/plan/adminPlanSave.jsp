<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, semiProject.com.kh.planAdmin.model.vo.*,
    semiProject.com.kh.member.model.vo.*"%>
    
    <%
    
    ArrayList<AdminPlan_Place> apList =(ArrayList<AdminPlan_Place>) request.getAttribute("apList");
    
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
	
	


		<style>
		
		  .user_planDetail{
            padding-top: 50px;
            padding-bottom: 40px;
        }
        .planDetail_title{
            padding-bottom: 40px;
            text-align: left;
        }
        .btn_left{
            text-align: left;
        }
        .btn_right{
            text-align: right;
        }
        .planDetail_contents{
            width: 80%;
            align-items: center;
        }
        .deleteBtn{
            text-align: center;
        }
        .listArea{
       		float-left: left;
         
        }
        .thumbnail{
        	float-left: left;
/*             display:inline-block;
 */            /* width:220px; */
            border:1px solid white;
            margin:15px;
        }
        .thumbnail:hover{
            opacity:0.7;
            cursor:pointer;
        };
			
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
		                    <h2>추천일정 상세페이지</h2>
		                    <div class="breadcrumb__option">
		                        <a href="./index.jsp"><i class="fa fa-home"></i> 홈</a>
		                        <span>추천일정 보관함</span>
		                    </div>
		                   
		                </div>
		            </div>
		        </div>
		
		    </div>
		</div>
		</section>

<section class="page-start">
    <!--메뉴바 같이 내려오는 시작점 -->

    <div class="categories-area section-padding30 user_planDetail">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="planDetail_title">
                        <a href="#"><h4>내일정 보관함</h4></a>
                        <a href="#"><h4>추천일정 보관함</h4></a>
                    </div>
                </div>
            

  			<div class="listArea">
                <div class="thumbnail" align="center">
                    <input type="checkbox" class="checkBox"><br>
                    <img src="<%=request.getContextPath()%>/resources/img/chun.png" width="350px" height="250px" onclick="goPlanSaveDetail()"> <br>
                    <p>
                        우리가족 나들이
                    </p>
                </div>
                <div class="thumbnail" align="center">
                    <input type="checkbox" class="checkBox"><br>
                    <img src="<%=request.getContextPath()%>/resources/img/chun.png" width="350px" height="250px" onclick="goPlanSaveDetail()"> <br>
                    <p>
                        토요일 데이트
                    </p>
                </div>
                <div class="thumbnail" align="center">
                    <input type="checkbox" class="checkBox"><br>
                    <img src="<%=request.getContextPath()%>/resources/img/chun.png" width="350px" height="250px" onclick="goPlanSaveDetail()"> <br>
                    
                    <p>
                        토요일 데이트
                    </p>
                </div>
            </div>
            
        
            <div class=" deleteBtn">
                <a href="#"><button type="button" class="btn btn-primary">삭제하기</button></a>
                
               <div class="col-lg-2">
                    <div class="planDetail_title">
                        <button class="btn btn-primary">뒤로</button>
                    </div>
                </div> 
            </div>
            
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