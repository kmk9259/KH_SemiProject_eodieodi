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
                                        <li><a href="#" onclick="goPlan();">마음대로일정</a></li>
                                        <li><a href="<%=contextPath %>/views/plan/adminRecommend.jsp">추천일정</a></li>
                                        <li><a href="<%=contextPath %>/views/plan/planSave.jsp">일정보관함</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a href="<%=contextPath %>/views/board/faq.jsp">FAQ</a></li>
                                <li><a href="<%=contextPath %>/views/board/blogListView.jsp">커뮤니티</a></li>
                                
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
    
      function goPlan(){
         <%if(loginUser == null) {%>
            alert("로그인 후 이용해주세요");
            location.href="<%=request.getContextPath()%>";
         <%}else{ %>
            location.href="<%=request.getContextPath()%>/list.pm";
         <%} %>
      } 
   </script>
</body>
</html>