<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "semiProject.com.kh.member.model.vo.Member"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>일정 플래너</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        .categories-area .single-cat {
            border: 1px solid #e1ebf7;
            border-radius: 6px;
            padding: 61px 22px;
            -webkit-transition: all .4s ease-out 0s;
            -moz-transition: all .4s ease-out 0s;
            -ms-transition: all .4s ease-out 0s;
            -o-transition: all .4s ease-out 0s;
            transition: all .4s ease-out 0s;
            position: relative;
            z-index: 1
        }
        
        .categories-area .single-cat::before {
            position: absolute;
            content: "";
            width: 100%;
            height: 0;
            background: #D958A0;
            transition: .6s;
            bottom: 0;
            left: 0;
            z-index: -1;
            border-radius: 6px
        }
        
        .categories-area .single-cat .cat-icon span {
            color: #eb566c;
            font-size: 50px;
            margin-bottom: 30px;
            display: block
        }
        
        .categories-area .single-cat .cat-cap h5>a {
            font-size: 25px;
            font-weight: 700;
            margin-bottom: 21px;
            display: block;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        @media only screen and (min-width: 576px) and (max-width: 767px) {
            .categories-area .single-cat .cat-cap h5>a {
                font-size: 29px
            }
        }
        
        .categories-area .single-cat .cat-cap p {
            margin-bottom: 36px;
            color: #57667e;
            font-size: 16px;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        @media only screen and (min-width: 576px) and (max-width: 767px) {
            .categories-area .single-cat .cat-cap p {
                font-size: 15px
            }
        }
        
        .categories-area .single-cat .cat-cap a {
            color: #1c165c;
            font-size: 16px;
            font-weight: 600;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        .categories-area .single-cat:hover {
            border: 1px solid transparent
        }
        
        .categories-area .single-cat:hover::before {
            height: 100%
        }
        
        .categories-area .single-cat:hover .cat-icon span {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap h5 {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap p {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap a {
            color: #fff
        }
        .height280{
        	height:280px;
        }
    </style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="../common/menubar.jsp"%>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="<%=contextPath %>/resources/img/breadcrumb/breadcrumb-blog2.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="breadcrumb__text">
                        <h2>일정 플래너</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> 홈</a>
                            <span>일정플래너</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Work Section Begin -->
    <section class="page-start">

    </section>
    <!-- Work Section End -->

    <!-- Categories Area Start -->
    <div class="categories-area section-padding30" style="margin-bottom: 200px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>어디어디와 함께하는 일정 계획하기</h2>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-cat text-center mb-50 height280">
                        <div class="cat-icon">
                            <span class="flaticon-bed"></span>
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#" class="movePage">내 맘대로 일정 계획</a></h5>
                            <p>사용자가 원하는 대로 일정을 계획할 수 있습니다</p>
                            <!-- <a href="#">View Details</a> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-cat text-center mb-50 height280">
                        <div class="cat-icon">
                            <span class="flaticon-drink"></span>
                        </div>
                        <div class="cat-cap">
                            <h5><a href="listing-details.html">추천 일정</a></h5>
                            <p>어디어디에서 추천해주는 일정으로 떠나보세요</p>
                            <!-- <a href="#">View Details</a> -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="single-cat text-center mb-50 height280">
                        <div class="cat-icon">
                            <span class="flaticon-home"></span>
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#" class="movePage">일정 보관함</a></h5>
                            <p>내가 저장한 모든 일정을 확인할 수 있습니다.</p>
                            <!-- <a href="#">View Details</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp"%>

    <!-- Js Plugins -->
    <script src="<%=contextPath%>/resources/js/main.js"></script>
</body>

<script>
	//로그인 상태에 따라 plan페이지 이동
	$(function(){
		   $('.movePage').click(function(){
	        var text = $(this).text();
	        <%if(loginUser == null) {%>  //로그인 X -> 로그인페이지로 이동
	             alert("로그인 후 이용해주세요");
	             location.href="<%=contextPath%>/views/member/login.jsp";
	        <%}else{ %>
	             if(text == "내 맘대로 일정 계획"){
	               	 location.href="<%=contextPath%>/list.pm";	
	             }else if(text == "일정 보관함"){
	                 location.href="<%=contextPath%>/list.ps";
	             }
	        <%}%>
	    })
	})
    $(function() {
        var $header = $('header'); //헤더를 변수에 넣기
        var $page = $('.page-start'); //색상이 변할 부분
        var $window = $(window);
        var pageOffsetTop = $page.offset().top; //색상 변할 부분의 top값 구하기

        $window.resize(function() { //반응형을 대비하여 리사이즈시 top값을 다시 계산
            pageOffsetTop = $page.offset().top;
        });

        $window.on('scroll', function() { //스크롤시
            var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
            $header.toggleClass('down', scrolled); //클래스 토글
        });
    });
</script>

</html>