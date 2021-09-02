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
    <title>어디어디 - 아이디/비밀번호 찾기</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/myInfo.css" type="text/css">
       

    <!-- login Section -->
    <!-- 첫 번째 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="../common/menubar.jsp"%>
    
    
    <!-- Hero Section Begin -->
    <section class="hero set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/jaemin-don-DBaVQ2rALYU-unsplash.jpg">
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


    <!-- login -->
    <!------ Include the above in your HEAD tag ---------->
    <section class="page-start">
        <section class="login">
            <div class="container">
                <div class="sidenav">
                    <div class="login-main-text">
                        <h2 style="color: #D34B32 !important">Eodi Eodi<br> Forget ID/PW Page</h2>
                        <p>Find ID/PW from here to access.</p>
                    </div>
                </div>

                <div class="container login-container">
                    <div class="findrow">
                        <div class="col-md-6 login-form-1">
                            <h3>아이디 찾기</h3>
                            <form class="findId" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이메일을 입력하세요" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이름을 입력하세요" value="" />
                                </div>
                                <div class="form-group-btn">
                                    <input type="submit" class="btnSubmit" value="ID 찾기" />
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6 login-form-2">
                            <h3>비밀번호 찾기</h3>
                            <form class="findPwd" method="POST">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="이메일을 입력하세요" value="" />
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="아이디를 입력하세요" value="" />
                                </div>
                                <div class="form-group-btn">
                                    <input type="submit" class="btnSubmit" value="PW 찾기" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </section>
    
    <%@ include file="../common/footer.jsp"%>

    <!-- Header -->
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
    
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>