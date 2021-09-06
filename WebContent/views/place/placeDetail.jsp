<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "semiProject.com.kh.place.model.vo.Place, 
    semiProject.com.kh.board.model.vo.PlaceAttachment"%>
<!DOCTYPE html>
<%
	Place p = (Place)request.getAttribute("p");
	PlaceAttachment pAt= (PlaceAttachment)request.getAttribute("at");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Directing | Template</title>

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
    </style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="../common/menubar.jsp"%>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="<%=contextPath%>/resources/img/breadcrumb/breadcrumb-blog2.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="breadcrumb__text">
                        <h2>장소 상세페이지</h2>
                        <div class="breadcrumb__option">
                            <!-- <a href="#"><i class="fa fa-home"></i> 홈</a> -->
                            <span>원하는 장소의 상세 설명을 확인해보세요</span>
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

    <!-- About Section Begin -->
    <section class="about spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-4">
                    <!-- <div class="about__title">
                        <h2>Welcome to<br /> Directing Listing</h2>
                        <a href="#" class="primary-btn">Contact Us</a>
                    </div> -->
                    <div class="listing__item">
                        <div class="listing__item__pic set-bg" data-setbg="<%=contextPath%>/resources/place_upFiles/<%= p.getTitleImg() %>">
                        <!-- src="<%= contextPath %>/resources/place_upfiles/<%= pAt.getChangeName() %>" -->
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-8">
                    <table border="1px solid black">
                        <tr>
                            <th>상호명</th>  
                            <td><%=p.getPlaceTitle()%></td> 
                        </tr>
                        <tr>
                            <th>상세주소</th>
                            <td><%=p.getAddress()%></td> 
                        </tr>
                        <tr>
                            <th>영업 시간</th>
                            <td><%=p.getBsHour()%></td> 
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%=p.getPlacePhone()%></td>  
                        </tr>
                        <tr>
                            <th>대표 금액</th>
                            <td> <%=p.getPrice()%>원</td> 
                        </tr>
                        <tr>
                            <th>장소 설명</th>
                            <td><%=p.getDescription()%> </td>  
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->

    <div class="total_btn">           
        <a href="./index.html"><button type="button" class="btn btn-primary">이전으로</button></a>
    </div>

    <%@ include file="../common/footer.jsp"%>

    <!-- Js Plugins -->
    <script src="<%=contextPath%>/resources/js/main.js"></script>
</body>

<script>
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