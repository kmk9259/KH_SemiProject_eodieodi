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
    
    
    <!-- Hero Section Begin
    <section class="hero set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/pascal-riben-YfZZvPaR9hY-unsplash.jpg">
   -->
     <section class="hero set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/jaemin-don-DBaVQ2rALYU-unsplash.jpg" style="height: 700px;"> 
        <div class="container" style="margin-top: -12%;">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text page-start">
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
    <section>
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
                            <form id="findIdForm" method="POST" action="<%=request.getContextPath() %>/findId.me">
                                <div class="form-group">
                                    <input maxlength="100" type="text" class="form-control" placeholder="이메일을 입력하세요" name="email" required="required" style="text-align: center;"/>
                                </div>
                                <div class="form-group">
                                    <input maxlength="7" type="text" class="form-control" placeholder="이름을 입력하세요" name="userName" required="required" style="text-align: center;" />
                                </div>
                                <div class="form-group-btn">
                                    <input type="button" class="btnSubmit" id= "idFind" value="ID 찾기" onclick="findID();" />
                                </div>
                            </form>
                        </div>
                        
                        <script type="text/javascript">
                           function findID() {
                              var email = $("input[name='email']");
                              var userName = $("input[name='userName']");
                  			  var userNameV = userName.val();
                			  var expUserName = /^[가-힣]{2,}$/
                              var emailV = email.val();
                              var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

                              if(email.val() == ""){
	                             alert("이메일을 입력해주세요.");
	                             email.focus();
	                             return false;
	                           	}else if(exptext.test(emailV)==false){
	                              alert("이메일 형식에 맞추어 입력해주세요.");
	                              email.val('');
	                              email.focus();
	                              return false;
	                           }else if( userName.val() == "" ) {
	                              alert("이름을 입력해주세요.");
	                              userName.focus();
	                             return false;
	                           }else if(expUserName.test(userNameV)==false){
		       						if(confirm("한글로 2자 이상의 이름을 입력해주세요.") == true){
		    							userName.val('');
		    							userName.focus();
		    							return false;
		    						}
	    						}
                              var info = {'email' : email.val(), 'userName' : userName.val()};
                              $.ajax({
                              url : "<%=request.getContextPath() %>/findId.me",
                              type : "post",
                              data : info,
                              success : function(findId){
                                 if(findId != null){
                                    confirm("입력하신 이메일로 이메일이 발송됩니다.");
                                    var url ="<%=request.getContextPath() %>/views/member/findIdEmailChkController.jsp?command=findEmailChk&email="+email.val()+"&userName=" + userName.val();
                                       var wname = "인증번호 입력";
                                       var option = "width = 500, height = 500, top = 100, left = 200"
                                       window.open(url, wname, option);

                                  	 console.log("===============>>> url " +url);
                                 }else if(findId == null){
                                    confirm("등록되지 않은 이메일 주소입니다.");
                                    email.focus();
                                 }
                              },
                              error:function(){
                                 console.log("서버통신실패");
                              }
                           })

                     }
                        </script>
                        
                        <div class="col-md-6 login-form-2">
                            <h3>비밀번호 찾기</h3>
                            <form id="findPwdForm" method="POST" action="<%=request.getContextPath() %>/findPwd.me">
                                <div class="form-group">
                                    <input maxlength="100" type="text" class="form-control" placeholder="이메일을 입력하세요" name="email2" required="required" style="text-align: center;" />
                                </div>
                                <div class="form-group">
                                    <input maxlength="30" type="text" class="form-control" placeholder="아이디를 입력하세요" name="userId" required="required" style="text-align: center;" />
                                </div>
                                <div class="form-group-btn">
                                    <input type="button" class="btnSubmit" value="PW 찾기" onclick="findPW();" />
                                </div>
                            </form>
                        </div>
                        <script type="text/javascript">
                           function findPW() {
                              var email = $("input[name='email2']");
                              var userId = $("input[name='userId']");
                              var userIdV = userId.val();
                  			  var expId = /^[0-9a-z]+$/;
                              var emailV = email.val();
                             var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

                              if(email.val() == ""){
	                             alert("이메일을 입력해주세요.");
	                             email.focus();
	                             return false;
	                           	}else if(exptext.test(emailV)==false){
	                              alert("이메일 형식에 맞추어 입력해주세요.");
	                              email.val('');
	                              email.focus();
	                              return false;
	                           }else if( userId.val() == "" ) {
	                              alert("아이디를 입력해주세요.");
	                              userId.focus();
	                              return false;
	                           }else if(expId.test(userIdV)==false){
		       						if(confirm("아이디에는 숫자, 영문만 입력 가능합니다.") == true){
		    							userId.val('');
		    							userId.focus();
		    							return false;
		    						}
	    						}
                              var info = {'email' : email.val(), 'userId' : userId.val()};
                              $.ajax({
                              url : "<%=request.getContextPath() %>/findPwd.me",
                              type : "post",
                              data : info,
                              success : function(findPwd){
                                 if(findPwd != null){
                                    confirm("입력하신 이메일로 이메일이 발송됩니다.");
                                    var url ="<%=request.getContextPath() %>/views/member/findPwdEmailChkController.jsp?command=findEmailChk&email="+email.val()+"&userId=" + userId.val();
                                       var wname = "인증번호 입력";
                                       var option = "width = 500, height = 500, top = 100, left = 200"
                                       window.open(url, wname, option);

                                  	 console.log("===============>>> url " +url);
                                 }else if(findPwd == null){
                                    confirm("등록되지 않은 이메일 주소입니다.");
                                    email.focus();
                                 }
                              },
                              error:function(){
                                 console.log("서버통신실패");
                              }
                           })

                     	}
                        </script>
                        
                    </div>
                    </div>
                    </div>
                    </section>
                    </section>
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>