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

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css">

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
            width:1150px;
            height:550px;
            margin:auto;
        }
        .thumbnail{
            display:inline-block;
            /* width:220px; */
            border:1px solid white;
            margin:10px;
        }
        .thumbnail:hover{
            opacity:0.7;
            cursor:pointer;
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
                <div class="col-lg-12">
                    <div class="planDetail_title">
                        <a href="#"><h4>내일정 보관함</h4></a>
                        <a href="#"><h4>추천일정 보관함</h4></a>
                    </div>
                </div>
                <!-- <div class="col-lg-2">
                    <div class="planDetail_title">
                        <button class="btn btn-primary">뒤로</button>
                    </div>
                </div> 버튼 이상해서 일단 지웠음-->
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
            </div>
            
        </div>
    </div>


    <%@ include file="../common/footer.jsp"%>

    <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
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
 	 
    function goPlanSaveDetail() {
        location.href = './planSaveDetail.jsp'
    }
</script>

</html>