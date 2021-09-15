<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "semiProject.com.kh.member.model.vo.Member" %>

    <%

   Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
   String contextPath = request.getContextPath();
   
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 폰트 1 
<style>
h1, h2, h3, h4, h5, h6, p, span, a, input, button {
    font-family: 'Gowun Dodum'!important;
  }
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
-->

<!-- 폰트 2 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">
<style>
h1, h2, h3, h4, h5, h6, p, span, a, input, button {
    font-family: 'Gowun Batang'!important;
  }
</style>
-->

<!-- 폰트 3 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
<style>
h1, h2, h3, h4, h5, h6, p, a, input, button, li, div {
    font-family: 'Gowun Batang'!important;
  }
</style>


        <!-- Css Styles -->
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/css/style.css" type="text/css">
</head>
<body>

<!-- Header Section Begin -->
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/resources/img/Logo.png" alt="야호"></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                             
                                
                                <li><a href="<%=contextPath %>/views/plan/planSelect.jsp">일정플래너</a>
                                    
                                    <ul class="dropdown">
                                        <li><a href="#" class="movePage">마음대로일정</a></li>
                                        <li><a href="<%=contextPath %>/admin_List.pl">추천일정</a></li>
                                        <li><a href="#" class="movePage">일정보관함</a></li>
                                        
                                    </ul>
                                </li>
                                
                                <li><a href="<%=request.getContextPath() %>/list.bo">커뮤니티</a></li>
                                
                                <%if(loginUser == null){%>  
                                <li><a href="<%=contextPath %>/views/member/login.jsp" onclick="goLogin();">로그인</a></li>
                                <li><a href="<%=contextPath %>/views/member/signUp.jsp" onclick="enrollPage();">회원가입</a></li>
                                 <%}else if(loginUser.getUserId().equals("admin")) { %>
                                <li><a href="<%=contextPath %>/adminPage.ad">관리자페이지</a></li>
                               	<li><a href="<%=contextPath %>/logout.me">로그아웃</a></li>                                
                                 <%}
                                else { %>
	                                <li><a href = "<%=request.getContextPath() %>/mypage.me">마이페이지</a></li>
	                                <li><a href = "<%=request.getContextPath() %>/logout.me">로그아웃</a></li>
							      <%}%>
                            </ul>
                        </nav>
                        <div class="header__menu__right">
                           
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->
    
       <script type="text/javascript">
		   function enrollPage(){
			   location.href = "<%= request.getContextPath()%>/enrollForm.me";
		   }
		   
		   //로그인 상태에 따라 plan페이지 이동
		   $(function(){
			   $('.movePage').click(function(){
	               var text = $(this).text();
	               <%if(loginUser == null) {%>  //로그인 X -> 로그인페이지로 이동
	                    alert("로그인 후 이용해주세요");
	                    location.href="<%=contextPath%>/views/member/login.jsp";
	               <%}else{ %>
	                    if(text == "마음대로일정"){
	                      	 location.href="<%=contextPath%>/list.pm";	
	                    }else if(text == "일정보관함"){
	                        location.href="<%=contextPath%>/list.ps";
	                    }
	               <%}%>
	           })
		   })
   		</script>
    
    
      <!-- Js Plugins -->
    <script src="<%=contextPath %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=contextPath %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=contextPath %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=contextPath %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=contextPath %>/resources/js/main.js"></script>

    <script src="<%=contextPath %>/resources/js/modernizr.min.js"></script>
    <script src="<%=contextPath %>/resources/js/classie.js"></script>
    <script src="<%=contextPath %>/resources/js/photostack.js"></script>
    
    <script>
	$(function(){
		var msg = "<%=msg%>";
		if(msg != "null"){
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	})

   </script>
</body>
</html>