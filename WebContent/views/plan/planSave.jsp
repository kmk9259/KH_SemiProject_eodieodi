<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy
    ,semiProject.com.kh.member.model.vo.Member, semiProject.com.kh.board.model.vo.PageInfo"%>
<!DOCTYPE html>
<%
	ArrayList<PlanMy> list = (ArrayList<PlanMy>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>일정 보관함</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        .user_planDetail{
            padding-top: 50px;
            padding-bottom: 40px;
        }
        .planDetail_title{
            padding: 30px 0px 40px;
            text-align: left;
            display: inline-flex;
            align-items: baseline;
        }
        .planDetail_contents{
            width: 80%;
            align-items: center;
        }
        .deleteBtn{
            text-align: center;
        }
        .listArea{
            width:100%;
            min-height: 500px;
    		height: 100%;
    		margin: 30px 0px 50px;
            /* margin:auto; */
        }
        .thumbnail{  
            display:inline-block;  /*가로너비에 맞게 나란히 일정한 간격으로 보이게*/
            float:left;
            width:100%;
           /*  border:1px solid white; */
            margin-bottom: 20px;
            box-shadow: 0 0px 6px rgb(0 0 0 / 10%), 0 0px 6px rgb(0 0 0 / 18%);
        }
        .thumbnail:hover{
            opacity:0.7;
            cursor:pointer;
        }
        .planBox{
        	/* width: 350px; */
        	/* width: 100%; */
		    /* border: solid 1px #dfdfdf; */
		    height: 100px;
		    padding: 15px;
        }
        .planTitle{
        	line-height: 30px;
		    font-size: 21px;
		    color: black;
        }
        .blog__pagination{
        	text-align: center;
    		margin: 25px;
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
                        <h2>일정 보관함</h2>
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
                        <a href="<%=contextPath%>/list.ps"><h4 style="font-size: 28px;">내일정 보관함</h4></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- <a href="#"><h4>추천일정 보관함</h4></a> -->
                    </div>
                </div>
            </div>
            

			<%if(list.size()==0){%>
			 <h2 style="margin: 180px 0px 250px 0px;text-align: center;">저장하신 일정이 없습니다.</h2> 
			
			<%}else{ %>
			<form id="delPlanForm" action="" method="post">
				<div class="row">
	                <div class="col-lg-12">
	                    <div style="float: right;display: -webkit-inline-box;">
	                        <input type="checkBox" id="allCheck" name="allCheck" style="zoom:1.5;"><label style="line-height:40px; font-size: 20px; padding: 0px 20px 0px 5px;">모두 선택</label>
	                        <div class=" deleteBtn"><button type="submit" class="btn site-btn" onclick="delPlan()">삭제하기</button></div>
	                    </div>
	                </div>
	            </div>
				<div class="listArea">
					<div class="row">
						<%for(PlanMy pm : list) {%>
						
							<div class="col-lg-4 col-md-6">
		                		<div class="thumbnail" align="center">
		                    		<input type="checkbox" name="planNo" id="planNo" value="<%=pm.getPlanNo()%>" class="chBox" style="zoom:1.5; margin-top:5px;"><br>
		                    		<img src="<%=request.getContextPath()%>/resources/place_upFiles/<%= pm.getTitleImg() %>" width="100%" height="280px" class="placeImg"> <br>
		                    		<div class="planBox">
		                    			<p class="planTitle"><%=pm.getPlanTitle()%></p>
		                    			<p class="planTitle" style="float: right;font-size: 18px;"><%=pm.getPlanDate()%></p>
		                    		</div>
		                		</div>
		                	</div>
	                	<%} %>
                	</div>
				</div>
			</form>
			<%} %>
			
			<!-- 페이징 바 -->
			<div class="blog__pagination">
				<!-- 맨 처음으로 (<<) -->
				<a href="<%=contextPath%>/list.ps?currentPage=1"> &lt;&lt; </a> 

				<!-- 이전페이지로(<) -->
				<%if(currentPage == 1){ %>
				<a class="noHover"> &lt; </a>
				<%}else{ %>
				<a href="<%= contextPath %>/list.ps?currentPage=<%= currentPage-1 %>"> &lt; </a>
				<%} %>
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
					
					<%if(p == currentPage){ %>
					<a class="noHover"> <%= p %> </a>
					<%}else{ %>
					<a href="<%=contextPath %>/list.ps?currentPage=<%= p %>"> <%= p %> </a>
					<%} %>
					
				<%} %>
				
				<!-- 다음페이지로(>) -->
				<%if(currentPage == maxPage){ %>
				<a class="noHover"> &gt; </a>
				<%}else { %>
				<a href="<%= contextPath %>/list.ps?currentPage=<%= currentPage+1 %>"> &gt; </a>
				<%} %>
			
				<!-- 맨 끝으로 (>>) -->
				<a href="<%=contextPath%>/list.ps?currentPage=<%=maxPage%>"> &gt;&gt; </a>
			</div> 
		
			<div class=" deleteBtn">
                <input type="button" class="btn site-btn" value="이전으로" onClick="history.go(-1)" style="font-size: 18px; margin-bottom:20px;">
            </div>
        </div>
    </div>
    
    
    <script>    
        //맨 위에 체크박스 체크하면 일정보관함의 모든 일정들 체크됨
        $("#allCheck").click(function() {
            var chk = $("#allCheck").prop("checked");
                if (chk) {
                     $(".chBox").prop("checked", true);
                } else {
                     $(".chBox").prop("checked", false);
                }
        });

        //일정 삭제 PlanMyDeleteServlet으로 이동
        function delPlan(){
            if(confirm("삭제하시겠습니까? ")){
            	if($('input:checkBox[name=planNo]:checked').length == 0){
            		alert("아무 일정도 체크되지 않았습니다!! 체크 후 삭제해주세요")
            	}else{
            		$("#delPlanForm").attr("action", "<%=contextPath%>/deleteP.ps");
            	}
            }
         }
            		
         //일정 상세보기 PlanMyDetailServlet으로 이동
         $(function(){
            $(".placeImg").click(function(){
            	var planNo = $(this).siblings("#planNo").val();
                location.href="<%=contextPath%>/detailP.ps?planNo="+planNo;
            })
         })
    </script>

    <%@ include file="../common/footer.jsp"%>

    <!-- Js Plugins -->
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
</script>

</html>