<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </style>
   
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="../common/menubar.jsp"%>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb/breadcrumb-blog2.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="breadcrumb__text">
                        <h2>일정 상세페이지</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> 홈</a>
                            <span>일정보관함</span>
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

    <!-- Categories Area Start -->
    <div class="categories-area section-padding30 user_planDetail">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="planDetail_title">
                        <h3>일정 제목</h3>
                    </div>
                </div>
            </div>

            <div class="planDetail_contents">
                <div>
                    <h4>일정 메모</h4>
                </div>
                <div>
                    <input type="textArea" readonly>
                </div>
                <div>
                    <h4>날짜 : 09/30/2021</h4>
                </div>
                <table class="listArea">
                    <thead>
                        <tr>
                            <th width="150">장소명</th>
                            <th width="500">주소</th>
                            <th width="50"></th>
                        </tr>
                    </thead>
                    <tr>
                        <td>뚱이네 고기</td>
                        <td>서울시 홍대 어딘가 11-1번지</td>
                        <td><button onclick="newPage()">돋</button></td>
                    </tr>
                    <tr>
                        <td>뚱이네 고기</td>
                        <td>서울시 홍대 어딘가 11-1번지</td>
                        <td><button onclick="newPage()">돋</button></td>
                    </tr>
                    <tr>
                        <td>뚱이네 고기</td>
                        <td>서울시 홍대 어딘가 11-1번지</td>
                        <td><button onclick="newPage()">돋</button></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div class="categories-area section-padding30 user_planDetail">
        <div class="container">
            <div class="total_btn btn_left btn_right"> 
                <div class="row">
                    <div class="col-lg-6 btn_left">
                        <a href="./index.html"><button type="button" class="btn btn-primary">이메일 전송</button></a>
                    </div>          
                    <div class="col-lg-6">
                        <a href="./listing.html"><button type="button" class="btn btn-primary">수정</button></a>
                        <a href="#"><button type="button" class="btn btn-primary">삭제</button></a>

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
    
 	 //새 창 열기
    function newPage()  {
        window.open('./placeDetail.html');
    }
</script>

</html>