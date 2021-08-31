<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디 - 로그인</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min333.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myInfo.css" type="text/css">
       
    <!-- login Section -->
    <!-- 첫 번째 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<body>
<!-- Page Preloder -->
	<div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="../common/menubar.jsp"%>


    <!-- Hero Section Begin -->
        <section class="hero set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/gyeongbokgung-palace.jpg">
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

    <!-- login -->
    <!------ Include the above in your HEAD tag ---------->
    <section class="page-start">
        <section class="login">
            <div class="container">
                <div class="sidenav">
                <div class="login-main-text">
                    <h2>Eodi Eodi<br> Login Page</h2>
                    <p>Login from here to access.</p>
                </div>
                </div>
                <div class="main">
                    <div class="col-md-6 col-sm-12">
                        <div class="login-form">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="caixa">
                                        <form action="" method="POST">
                                            <div class="row">
                                                <div class="col-lg-9 col-md-9">
                                                    <fieldset class="formRow">
                                                        <div class="formRow--item">
                                                            <label for="firstname" class="formRow--input-wrapper js-inputWrapper">
                                                                <input type="text" class="formRow--input js-input" id="inputId" placeholder="아이디를 입력하세요">
                                                            </label>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="formRow">
                                                        <div class="formRow--item">
                                                            <label for="firstname" class="formRow--input-wrapper js-inputWrapper">
                                                                <input type="password" class="formRow--input js-input" id="pwd" placeholder="비밀번호를 입력하세요">
                                                            </label>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <div class="col-lg-3 col-md-3">
                                                    <button type="submit" class="vamos_mudar_um_pouco" title="Entrar">로그인</button>
                                                </div>
                                                <div class="pp">
                                                    <div class="left">
                                                        <p class="help">아이디나 비밀번호를 잊으셨다면?</p>
                                                        <a href="find.html" class="linkA">ID/PW 찾기</a>
                                                    </div>
                                                    <div class="right">
                                                        <p class="help">어디어디 회원이 아니라면?</p>
                                                        <a href="signUp.html" class="linkB">회원가입</a>
                                                    </div>
                                                </div>
                                            </div>

                                            
                                        </form>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        var $inputItem = $(".js-inputWrapper");
                        $inputItem.length && $inputItem.each(function() {
                            var $this = $(this),
                            $input = $this.find(".formRow--input"),
                            placeholderTxt = $input.attr("placeholder"),
                            $placeholder;
                        
                            $input.after('<span class="placeholder">' + placeholderTxt + "</span>"),
                            $input.attr("placeholder", ""),
                            $placeholder = $this.find(".placeholder"),
                        
                            $input.val().length ? $this.addClass("active") : $this.removeClass("active"),
                        
                            $input.on("focusout", function() {
                                $input.val().length ? $this.addClass("active") : $this.removeClass("active");
                            }).on("focus", function() {
                                $this.addClass("active");
                            });
                        });
                    </script>
                </div>
            </div>
        </section>

	</section>
   

    <%@ include file="../common/footer.jsp"%>
    
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>