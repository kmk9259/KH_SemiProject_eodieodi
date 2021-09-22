<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, semiProject.com.kh.planMy.model.vo.PlanMy, 
    semiProject.com.kh.place.model.vo.Place, semiProject.com.kh.board.model.vo.PageInfo, java.util.Collections"%>
<%
	PlanMy pm = (PlanMy)request.getAttribute("pm");
	ArrayList<Place> pList = (ArrayList<Place>)request.getAttribute("pList");
	//ArrayList<Place> bpList = (ArrayList<Place>)request.getAttribute("bpList");
	
	
	String memo = pm.getPlanMemo();  //메모 null값인 경우 
	if(memo == null){
		memo="";
	}

%> 	

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>일정 상세보기</title>

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
		.plan_email{
			float:right;
			width:100px;
			height:100%;
		}
		#img_email{
			margin-top: 70px;
    		margin-left: 45px;
    		cursor:pointer;
		}
		.pleaseCenter{
			display: flex;
	    	justify-content: center;
	    	padding: 20px;
		}
		
		table{
        	border-collapse:collapse;
        }
        th,td{
        	border-bottom: 1px solid lightgrey;
        	padding:3px;
        	text-align: center;
        }
        th{
        	padding: 15px 0px 7px 0px;
        }
        thead{
        	text-align: center;
        	font-size: 21px;
		    font-weight: bold;
		    border-bottom: 1px solid slategrey;
        }
        
        /*테이블 페이징 처리*/
        .off-screen {
            /*이건 뭐지?*/
            display: none;
        }
        
        #nav {
            /*페이징바 div / <div id="nav">*/
            width: 100%;
		    text-align: center;
		    margin-bottom: 15px;
        }
        
        #nav a {
            /*<a href="#" rel="0" class="active">1</a> : 클릭하면 class="acitive"가 된다*/
            display: inline-block;
            padding: 3px 5px;
            margin-right: 10px;
            font-family: Tahoma;
            background: #ccc;
            color: #000;
            text-decoration: none;
        }
        
        #nav a.active {
            background: #333;
            color: #fff;
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
        					<div class="plan_title" style="width:1000px;"><%=pm.getPlanTitle()%></div>
        					<div class="plan_date"><%=pm.getPlanDate()%></div>
							<div class="plan_places">
								<img src="<%=request.getContextPath()%>/resources/img/listing/map.png" style="width:25px;">  <%=pList.size()%>	
							</div>
        				</div>
        				<div class="plan_email">
        					<img data-toggle="modal" data-target="#mo1" id="img_email" src="<%=request.getContextPath()%>/resources/img/listing/email.png" style="width:50px;">
        				</div>
        			</div>      	
        		</div>
        	</div>
        
            <div class="row" id="planLine">
            	<div class="col-lg-6 btn_left">
            		<h5 style="line-height:60px"><b><%=loginUser.getUserName()%></b>님의 일정</h5>
            	</div>
                <div class="col-lg-6 btn_right">
                	
                    <button type="button" class="btn btn-primary" onclick="updateForm()" style="margin: 10px; ">수정하기</button>
                    <button type="button" class="btn btn-primary" onclick="deleteBoard()">삭제하기</button>
                </div>
            </div>

			<div class="row" style="margin-top: 20px;background-color: #faf1d6">
				<div class="col-lg-9">
					<div class="planDetail_detail">
	                    <h4><b>장소 목록</b></h4>
	                </div>
					<table id="placeDetail" class="listArea">
						
						<caption>
						<form action="" id="setRows">
			            </form>
						</caption>
						
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
				                        </td>
				                    </tr>
	                    		<%}%>
	                    	<%}%>
	                    </tbody>
	                </table>
	                
	               <%--  <div class="blog__pagination">
						<!-- 맨 처음으로 (<<) -->
						<a href="<%=contextPath%>/detailP.ps?planNo=<%=pm.getPlanNo()%>&currentPage=1"> &lt;&lt; </a> 
		
						<!-- 이전페이지로(<) -->
						<%if(currentPage == 1){ %>
						<a class="noHover"> &lt; </a>
						<%}else{ %>
						<a href="<%= contextPath %>/detailP.ps?planNo=<%=pm.getPlanNo()%>&currentPage=<%= currentPage-1 %>"> &lt; </a>
						<%} %>
						
						<!-- 페이지 목록 -->
						<%for(int p=startPage; p<=endPage; p++){ %>
							
							<%if(p == currentPage){ %>
							<a class="noHover"> <%= p %> </a>
							<%}else{ %>
							<a href="<%=contextPath %>/detailP.ps?planNo=<%=pm.getPlanNo()%>&currentPage=<%= p %>"> <%= p %> </a>
							<%} %>
							
						<%} %>
						
						<!-- 다음페이지로(>) -->
						<%if(currentPage == maxPage){ %>
						<a class="noHover"> &gt; </a>
						<%}else { %>
						<a href="<%= contextPath %>/detailP.ps?planNo=<%=pm.getPlanNo()%>&currentPage=<%= currentPage+1 %>"> &gt; </a>
						<%} %>
					
						<!-- 맨 끝으로 (>>) -->
						<a href="<%=contextPath%>/detailP.ps?planNo=<%=pm.getPlanNo()%>?currentPage=<%=maxPage%>"> &gt;&gt; </a>
					</div>  --%>
					<!-- 페이징바 끝 -->
				</div>
				<div class="col-lg-3">
					<div class="planDetail_detail">
	                    <h4><b>일정 메모</b></h4>
	                </div>
	                <div class="planDetail_detail">
	                    <textArea rows="9" style="width: 100%; margin-top:15px;" readonly><%=memo%></textArea>
                	</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-12 pleaseCenter">
					<div id="map" style="width:100%;height:400px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=879134364fa796c4ccf9a5a523dc7377&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.49925684737235, 127.03283389631359), // 지도의 중심좌표->KH정보교육원
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
			var $setRows = $('#setRows');
	        console.log("$setRows : " + $setRows);
	        console.log("$setRows : " + $setRows.val());
	
	        $setRows.submit(function(e) {
	            e.preventDefault();
	            //var rowPerPage = $('[name="rowPerPage"]').val() * 1; // 1 을  곱하여 문자열을 숫자형로 변환
	
	            var rowPerPage = 5 * 1;
	            //		console.log(typeof rowPerPage);
	
	            var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	            if (!rowPerPage) {
	                alert(zeroWarning);
	                return;
	            }
	            $('#nav').remove();
	            var $placeDetail = $('#placeDetail');
	
	            $placeDetail.after('<div id="nav">');
	
	
	            var $tr = $($placeDetail).find('tbody tr');
	            var rowTotals = $tr.length;
	            //	console.log(rowTotals);
	
	            var pageTotal = Math.ceil(rowTotals / rowPerPage);
	            var i = 0;
	
	            for (; i < pageTotal; i++) {
	                $('<a href="#"></a>')
	                    .attr('rel', i)
	                    .html(i + 1)
	                    .appendTo('#nav');
	            }
	
	            $tr.addClass('off-screen')
	                .slice(0, rowPerPage)
	                .removeClass('off-screen');
	
	            var $pagingLink = $('#nav a');
	            $pagingLink.on('click', function(evt) {
	                evt.preventDefault();
	                var $this = $(this);
	                if ($this.hasClass('active')) {
	                    return;
	                }
	                $pagingLink.removeClass('active');
	                $this.addClass('active');
	
	                // 0 => 0(0*4), 4(0*4+4)
	                // 1 => 4(1*4), 8(1*4+4)
	                // 2 => 8(2*4), 12(2*4+4)
	                // 시작 행 = 페이지 번호 * 페이지당 행수
	                // 끝 행 = 시작 행 + 페이지당 행수
	
	                var currPage = $this.attr('rel');
	                var startItem = currPage * rowPerPage;
	                var endItem = startItem + rowPerPage;
	
	                $tr.css('opacity', '0.0')
	                    .addClass('off-screen')
	                    .slice(startItem, endItem)
	                    .removeClass('off-screen')
	                    .animate({
	                        opacity: 1
	                    }, 300);
	
	            });
	
	            $pagingLink.filter(':first').addClass('active');
	
	        });
	
	
	        $setRows.submit();
		
		
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateForm.ps?planNo=<%=pm.getPlanNo()%>");
				$("#postForm").submit();
			}
			
			function deleteBoard(){
				if(confirm("삭제하시겠습니까?")){
					$("#postForm").attr("action", "<%=contextPath%>/deleteP.ps");
					$("#postForm").submit();
				}
			}
			
			$(document).on('click','#sendEmail',function(){
		    	
		    	var planNo = <%=pm.getPlanNo()%>
		    	var userEmail = $("#userEmail").val();

		    	console.log("planNo : " + planNo);
		    	console.log("userEmail : " + userEmail);

				$.ajax({
		
					url : "sendEmail.pl",
					data : {
						planNo : planNo,
						userEmail : userEmail
					},
					type : "post",
					success: function(result){ 
						console.log("ajax 통신성공");
					
						console.log("왜 안되는거야? result : " + result)
						if(result>0){              //if(true) 하면 안되네! 세상에
							$('.modal').modal("hide"); //모달창 닫기
							alert("메일 전송이 완료되었습니다.");
						}else{
							alert("메일 전송에 실패하였습니다. \n이메일이 올바른지 확인해주세요.")
						}

					},
					error : function(){	
						alert("메일전송실패 : 관리자에게 문의하세요")
					}
				}) 
		    })
		</script>

<!-- modal  -->
  <div class="modal fade" id="mo1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">일정을 전송받으실 이메일을 입력해주세요.</h5> 
          <!-- data-dismiss="modal" 입려하여야 버튼클릭시 창닫김 -->
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
      <!--body-->
         <div class="modal-body">
          <div class="row">
            <div class="col-12">
              <div class="form-group">
                <label>Email</label>
                <input type="email" id="userEmail" value="<%=loginUser.getEmail()%>" class="form-control"> <!-- 사용자 이메일 처음에 나오도록해줌 -->
              </div>
            </div>
          </div>
        </div>
       <div class="modal-footer">
          <button type="button" id="sendEmail" class="btn btn-primary">전송하기</button>
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
</script>

</html>