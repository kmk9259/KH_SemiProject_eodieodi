<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy, semiProject.com.kh.place.model.vo.Place"%>
<%
	PlanMy pm = (PlanMy)request.getAttribute("pm");
	ArrayList<Place> pList = (ArrayList<Place>)request.getAttribute("pList");
%> 	
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
    		margin:50px 0px 40px;
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
        .planDetail_detail{
        	text-align: left;
        	margin: 15px 0px 15px;
        }
        .plan_cover {
		    width: 100%;
		    height: 350px;
		    position: relative;  /*cover_img, cover_bottom 부모 div*/
		}
        .cover_img {
		    position: absolute;  /*plan_cover 태그에 붙는다.*/
		    left: 0px;			 /*왼쪽으로부터 0만큼 떨어져있음*/
		    top: 0px;            /*위로부터 0만큼 떨어져있음*/
		    width: 100%;
		    height: 350px;
		    z-index: 1;
		    background-size: 100%;  /*backgroundimg 크기 지정*/
    		background-position: center center;
		    background-image: url("<%=request.getContextPath()%>/resources/img/listing/planCover.jpg");
		}
		.cover_bottom {
		    width: 100%;
		    height: 204px;
		    position: absolute;
		    z-index: 2;
		    left: 0px;
		    bottom: 0px;  /*바닥으로부터 0만큼 떨어져있음*/
		    padding-top: 60px;
		    padding-left: 30px;
		    padding-right: 30px;
		}
		.plan_set{
			float:left;
			width:520px;
			height:100%
		}
		.plan_title{
			color: white;
			font-weight: bold;
			font-size: 38px;
			text-align: left;
		}
		.plan_date{
			font-size: 22px;
			color:white;
			padding-top: 2px;
			text-align: left;
			width:100%;
		}
		.plan_places{
			padding-top: 3px;
			display: inline-block;
			float: left;
			font-size: 20px;
			color:white;
		}
		#planLine{
			border-bottom: solid 1px #dfdfdf;
		}
		.listArea{
			font-size: 18px;
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
    <section class="page-start"></section>

    <!-- Categories Area Start -->
    <div class="categories-area section-padding30 user_planDetail">
        <div class="container">
        	<div class="row">
        		<div class="plan_cover">
        			<div class="cover_img"></div>  
        			<div class="cover_bottom">
        				<div class="plan_set">
        					<div class="plan_title"><%=pm.getPlanTitle()%></div>
        					<div class="plan_date"><%=pm.getPlanDate()%></div>
							<div class="plan_places">
								<img src="<%=request.getContextPath()%>/resources/img/listing/map.png" style="width:25px;">  <%=pList.size()%>	
							</div>
        				</div>
        			</div>      	
        		</div>
        	</div>
        
            <div class="row" id="planLine">
            	<div class="col-lg-6 btn_left">
            		<%=loginUser.getUserName()%>님의 일정
            	</div>
                <div class="col-lg-6 btn_right">
                    <button type="button" class="btn btn-primary" onclick="updateForm()" style="margin: 10px; ">수정하기</button>
                    <button type="button" class="btn btn-primary" onclick="deleteBoard()">삭제하기</button>
                </div>
            </div>

			<div class="row" style="margin-top: 20px;background-color: #faf1d6">
				<div class="col-lg-9">
					<div class="planDetail_detail">
	                    <h4>장소 목록</h4>
	                </div>
					<table class="listArea">
	                    <thead>
	                        <tr>
	                            <th width="180">장소명</th>
	                            <th width="500">주소</th>
	                            <th width="100">1인금액</th>
	                            <th width="65">더보기</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<%if(pList.size() == 0) {%>
	                    		<tr>
	                    			<td colspan="2">일정이 없습니다.
	                    		</tr>
	                    	<%}else{ %>
	                    		<%for(Place p : pList){%>
	                    			<tr>
				                        <td><%=p.getPlaceTitle()%></td>
				                        <td><%=p.getAddress()%></td>
				                        <td><%=p.getPrice()%></td>
				                        <td>	
				                        	<!-- onclick으로 안되서 href로 걸어뒀음 -->
				                        	<a href="<%=contextPath%>/detail.pl?pNo=<%=p.getPlaceNo()%>"><img src="<%=request.getContextPath()%>/resources/img/listing/magnifying-glass.png" style="width:25px;  cursor:pointer;"></a>
				                        	<input type="hidden" id="placeNo" value="<%=p.getPlaceNo()%>">
				                        </td>
				                    </tr>
	                    		<%}%>
	                    	<%}%>
	                    </tbody>
	                </table> 
				</div>
				<div class="col-lg-3">
					<div class="planDetail_detail">
	                    <h4>일정 메모</h4>
	                </div>
	                <div class="planDetail_detail">
	                    <textArea cols="30" rows="9" readonly><%=pm.getPlanMemo()%></textArea>
                	</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-7">
					<div id="map" style="width:100%;height:400px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=879134364fa796c4ccf9a5a523dc7377&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 6 // 지도의 확대 레벨
					    };  
					
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					<%if(pList.size() == 0) {%>
						
					<%}else{%>
						<%for(Place p : pList){%> 
						
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch('<%=p.getAddress()%>', function(result, status) {
							
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
							
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });
							
							        
							        // 인포윈도우로 장소에 대한 설명을 표시합니다
							        var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'<%=p.getPlaceTitle()%>'+'</div>'
							        });
							        infowindow.open(map, marker);
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});
						<%}%>
					<%}%>
					  
					</script>
				</div>
			</div>
			<div class="row" style="text-align: center; margin:20px;">
				<div class="col-lg-12">
					<input type="button" class="btn btn-primary" value="이전으로" onClick="history.go(-1)">
				</div>
			</div>
		</div>
    </div>

    

   <!--  <div class="categories-area section-padding30 user_planDetail">  ///0912_이메일 기능 시간남으면 구현
        <div class="container">
            <div class="total_btn"> 
                <div class="row">
                    <div class="col-lg-6 btn_left">
                        <a href="./index.html"><button type="button" class="btn btn-primary">이메일 전송</button></a>
                    </div>          
                </div>
            </div>
        </div> -->
        
        <form action="" id="postForm" method="post">
			<input type="hidden" name="planNo" value="<%=pm.getPlanNo()%>">
		</form>
		<script>
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateForm.ps");
				$("#postForm").submit();
			}
			
			function deleteBoard(){
				if(confirm("삭제하시겠습니까?")){
					$("#postForm").attr("action", "<%=contextPath%>/deleteP.ps");
					$("#postForm").submit();
				}
			}
		</script>


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