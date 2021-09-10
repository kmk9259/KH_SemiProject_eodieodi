<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy
    ,semiProject.com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<%
	ArrayList<PlanMy> list = (ArrayList<PlanMy>)request.getAttribute("list"); 
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
                        <a href="<%=contextPath%>/list.ps"><h4>내일정 보관함</h4></a>
                        <a href="#"><h4>추천일정 보관함</h4></a>
                        <input type="checkBox" id="allCheck" name="allCheck"><label>모두 선택</label>
                        
                        <script> //맨 위에 체크박스 체크하면 일정보관함의 모든 일정들 체크됨
                            $("#allCheck").click(function() {
                                var chk = $("#allCheck").prop("checked");
                                if (chk) {
                                    $(".chBox").prop("checked", true);
                                } else {
                                    $(".chBox").prop("checked", false);
                                }
                            });
                        </script>
                    </div>
                </div>
                <!-- <div class="col-lg-2">
                    <div class="planDetail_title">
                        <button class="btn btn-primary">뒤로</button>
                    </div>
                </div> 버튼 이상해서 일단 지웠음-->
            </div>

			<%if(list.size()==0){%>
			 <h2>저장하신 일정이 없습니다.</h2> 
			
			<%}else{ %>
			<form id="delPlanForm" action="" method="post">
				<div class="listArea">
					<%for(PlanMy pm : list) {%>
						<div class="thumbnail" align="center">
                    		<input type="checkbox" name="planNo" id="planNo" value="<%=pm.getPlanNo()%>" class="chBox"><br>
                    		<img src="<%=request.getContextPath()%>/resources/place_upFiles/<%= pm.getTitleImg() %>" width="350px" height="250px" class="placeImg"> <br>
                    		<p>
                        	<%=pm.getPlanTitle()%>
                    		</p>
                		</div>
                	<%} %>
				</div>
				
				<div class=" deleteBtn">
                	<button type="submit" class="btn btn-primary" onclick="delPlan()">삭제하기</button>
            	</div>
            	
            	<script>
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
            		
            		//일정 상세보기 PlanMyDeleteServlet으로 이동
            		$(function(){
            			$(".placeImg").click(function(){
            				var planNo = $(this).siblings("#planNo").val();
                		    location.href="<%=contextPath%>/detailP.ps?planNo="+planNo;
            			})
            		})
            	</script>
			</form>
			<%} %>
        </div>
    </div>

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