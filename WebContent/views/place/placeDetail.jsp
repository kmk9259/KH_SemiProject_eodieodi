<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "semiProject.com.kh.place.model.vo.Place, 
    semiProject.com.kh.board.model.vo.PlaceAttachment"%>
<!DOCTYPE html>
<%
	Place p = (Place)request.getAttribute("p");
	PlaceAttachment pAt= (PlaceAttachment)request.getAttribute("at");
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>장소상세 | <%=p.getPlaceTitle()%></title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        .categories-area .single-cat {
            border: 1px solid #e1ebf7;
            border-radius: 6px;
            padding: 61px 22px;
            -webkit-transition: all .4s ease-out 0s;
            -moz-transition: all .4s ease-out 0s;
            -ms-transition: all .4s ease-out 0s;
            -o-transition: all .4s ease-out 0s;
            transition: all .4s ease-out 0s;
            position: relative;
            z-index: 1
        }
        
        .categories-area .single-cat::before {
            position: absolute;
            content: "";
            width: 100%;
            height: 0;
            background: #D958A0;
            transition: .6s;
            bottom: 0;
            left: 0;
            z-index: -1;
            border-radius: 6px
        }
        
        .categories-area .single-cat .cat-icon span {
            color: #eb566c;
            font-size: 50px;
            margin-bottom: 30px;
            display: block
        }
        
        .categories-area .single-cat .cat-cap h5>a {
            font-size: 25px;
            font-weight: 700;
            margin-bottom: 21px;
            display: block;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        @media only screen and (min-width: 576px) and (max-width: 767px) {
            .categories-area .single-cat .cat-cap h5>a {
                font-size: 29px
            }
        }
        
        .categories-area .single-cat .cat-cap p {
            margin-bottom: 36px;
            color: #57667e;
            font-size: 16px;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        @media only screen and (min-width: 576px) and (max-width: 767px) {
            .categories-area .single-cat .cat-cap p {
                font-size: 15px
            }
        }
        
        .categories-area .single-cat .cat-cap a {
            color: #1c165c;
            font-size: 16px;
            font-weight: 600;
            -webkit-transition: all .2s ease-out 0s;
            -moz-transition: all .2s ease-out 0s;
            -ms-transition: all .2s ease-out 0s;
            -o-transition: all .2s ease-out 0s;
            transition: all .2s ease-out 0s
        }
        
        .categories-area .single-cat:hover {
            border: 1px solid transparent
        }
        
        .categories-area .single-cat:hover::before {
            height: 100%
        }
        
        .categories-area .single-cat:hover .cat-icon span {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap h5 {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap p {
            color: #fff
        }
        
        .categories-area .single-cat:hover .cat-cap a {
            color: #fff
        }
        #placeTitle{
        	margin: 0px 15px 30px;
        }
        /* #placeImg{
        	position:relative;
        }
        .count{
        	position:absolute;
        	z-index:2;
        	bottom:0px;
        	right:0px;
        	width:140px;
        	height:70px;
        	border: 2px solid white;
        } */
        table{
        	border-collapse:collapse;
        }
        th,td{
        	border-bottom: 1px solid lightgrey;
        	padding:10px;
        }
        th{
        	background-color:#FAE6B9;
        	width:100px;
        }
        .modal-body{
			width:100%;
			height: 265px;
			padding: 15px 20px 15px 20px;
		}
		.content_scroll{
			width:100%;
			height:100%;
			overflow-y:auto;
		}
		.plan_box{
			width:100%;
			min-height:67px;
			background:#f4f3f3;
			margin-top:3px;
		}
		.plan_left{
			float:left;
			width:360px;
			padding-left:15px;
		}
		.plan_select{
			width:60px;
			height:30px;
			text-align:center;
			float:right;
			cursor:pointer;
			margin-right:15px;
			margin-top:20px;
			font-size:13px;
			background:#D958A0;
			line-height: 30px;
    		color: white;
		}
		.plan_title{
			margin-top: 10px;
		    font-size: 18px;
		    font-weight: bold;
		}
		.pleaseCenter{
			display: flex;
    		justify-content: center;
    		padding: 20px;
		}
		.renewspad{
			padding-top: 80px;
    		padding-bottom: 80px;
		}
		.pleaseBg{
			background-repeat: no-repeat;
		    background-size: cover;
		    background-position: center center;
		    background-image:url('<%=request.getContextPath()%>/resources/place_upFiles/<%= p.getTitleImg() %>');
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
    <div class="breadcrumb-area set-bg" data-setbg="<%=contextPath%>/resources/img/breadcrumb/breadcrumb-blog2.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="breadcrumb__text">
                        <h2>장소 상세페이지</h2>
                        <div class="breadcrumb__option">
                            <!-- <a href="#"><i class="fa fa-home"></i> 홈</a> -->
                            <span>원하는 장소의 상세 설명을 확인해보세요</span>
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

    <!-- About Section Begin -->
    <section class="about renewspad">
        <div class="container">
        	<div style="text-align:left;">
        		<h2 id="placeTitle"><%=p.getPlaceTitle()%></h2>
        	</div>
            <div class="row">
                <div class="col-lg-8 col-md-8 pleaseCenter">
                    <div style="width:100%">
                        <%-- <div id="placeImg" class="listing__item__pic set-bg" style="background-image: url(<%=contextPath%>/resources/place_upFiles/<%= p.getTitleImg()%>);"></div> --%>
                    	<%-- <img class="pleaseBg" src="<%=contextPath%>/resources/place_upFiles/<%= p.getTitleImg() %>" style="height:500px;"> --%>
                    	<div class="pleaseBg" style="height:650px; width:100%;"></div>
                    </div>
                </div>
                
                 <div class="col-lg-4">
                 
                 	<div class="blog__sidebar">
                 		<div class="blog__sidebar__recent" style="margin-top: 20px;">
                            <h5>같은 지역의 인기장소</h5>
                          
                          <div id="thumbList">     
                          </div> 
                         
                        </div>
                 	</div>
                 </div>
                
                <div class="col-lg-8 col-md-12 pleaseCenter">   
                    <table style="width:100%;">
                        <tr>
                            <th>상세주소</th>
                            <td><%=p.getAddress()%></td> 
                        </tr>
                        <tr>
                            <th>영업 시간</th>
                            <td><%=p.getBsHour()%></td> 
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><%=p.getPlacePhone()%></td>  
                        </tr>
                        <tr>
                            <th>대표 금액</th>
                            <td> <%=p.getPrice()%>원</td> 
                        </tr>
                        <tr>
                            <th>장소 설명</th>
                            <td><%=p.getDescription()%> </td>  
                        </tr>
                    </table>
                </div>
                
            </div>
        </div>
    </section>
    <!-- About Section End -->

	 <%if(loginUser == null){%>
	    <div class="total_btn">           
	        <input type="button" class="btn btn-primary" value="이전으로" onClick="history.go(-1)">
	    </div>
    <%}else {%>
    	<div class="total_btn" id="bottonBtn">       
    		<input type="button" class="btn btn-primary" value="이전으로" onClick="history.go(-1)">    
	        <button type="button" id="addPlace" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-left: 15px;">일정에 추가</button>
	    </div>
    <%} %>
    
    
    <script>
		/* $(function(){
			var goback = '<input type="button" class="btn btn-primary" value="이전으로" onClick="history.go(-1)">'
			if(history.go(-1) != "undefined"){
				$("#bottonBtn").append(goback);
			}	
		})  */
		
	   $(function(){
			selectTopList(); // 열자 마자 호출 하고 
			
		   
				$(".thumbnail").click(function(){
					var bno = $(this).children().eq(0).val();
					location.href="<%=contextPath%>/detail.bo?bno="+bno;
				})

			
			//setInterval(selectTopList, 2000)
		 	 $("#thumbList").on("click",".thumb",function(){
				var bno = $(this).children().eq(0).val();
				location.href = "<%=contextPath%>/detail.bo?bno="+bno;
			}) 
		})
		
		function selectTopList(){
		   var placeNo = <%=p.getPlaceNo()%>
		   
			$.ajax({
				url : "planTopList.do",
				type: "post",
				data:{
					placeNo : placeNo
				},
				success:function(list){
					
					var contextPath = "<%=contextPath%>"; 
					var value = "";
					for(var i in list){
						var tmp = list[i].placeTitle;
						value += '<div class="blog__sidebar__recent__item__pic thumb" >'+ 
								 '<input type="hidden" value="' +list[i].placeNo+ '">'+
								 '<img src="'+contextPath+'/resources/place_upFiles/' + list[i].titleImg + '" width="80px" height="70px">'+
						
								 '</div><div class="blog__sidebar__recent__item__text"><span class="lanking">'+ (++i)+ 
								 '</span></div><h6 class="thumb">'+ tmp +'</h6>'+
								 '<p><i class="fa fa-clock-o"></i>&nbsp;&nbsp;&nbsp;</p></div>';
								
								 
					}
					console.log(value);
					$("#thumbList").html(value).trigger("create");
				},
				error:function(){
					console.log("ajax통신실패");
				}
			})
		}
    
    
    	//'일정에 추가'버튼 클릭 -> 사용자의 모든 일정 중 해당 장소가 포함되지 않은 일정만 뽑아서 리스트로 받기
	    $("#addPlace").click(function(){
	    	var placeNo = <%=p.getPlaceNo()%>
	    	
			$.ajax({
	
				url : "addPlanlist.do",
				data : {
					placeNo : placeNo
				},
				type : "get",
				success: function(planList){  //success : ajax 통신 성공시 처리할 함수를 지정하는 속성
				
					console.log("ajax 통신성공");
					console.log(planList);
					
					ajaxPlaceList(planList);
					
				},
				error : function(){	
					console.log("ajax 통신 실패")
				}
			})
	    })

	    //위에서 받은 리스트를 모달화면에 뿌려주기
	    function ajaxPlaceList(planList){
         	var result = '';
         	var contextPath = "<%=contextPath%>"
         	if(planList.length==0){
         		result += '해당되는 일정이 없습니다😥<br>새로운 일정을 등록하러 가볼까요?';
         	}else{
         		$.each(planList, function(i){                         	
                   	result += '<div class="plan_box">'  
    						+ '<div class="plan_left">'
    						+ '<input type="hidden" value="'+ planList[i].planNo +'" id="planNo">'
    	                   	+ '<div class="plan_title">'+planList[i].planTitle+'</div>'
    	                   	+ '<div class="plan_date">'+planList[i].planDate+'</div>'
    	                   	+ '</div>'
    	                   	+ '<div class="plan_select">선택</div>'
    						+'</div>';		
            	})
         	}
          		
          	$(".content_scroll").html(result);
	    }
	    
    	//모달화면에서 '선택'을 클릭하여 해당장소를 해당일정에 추가사키기
	    $(document).on('click','.plan_select',function(){
	    	
	    	var placeNo = <%=p.getPlaceNo()%>
	    	var planNo = $(this).siblings().children("#planNo").val();

	    	console.log("placeNo : " + placeNo);
	    	console.log("planNo : " + planNo);

			$.ajax({
	
				url : "addPlanPlace.do",
				data : {
					placeNo : placeNo,
					planNo : planNo
				},
				type : "get",
				success: function(result){ 
					console.log("ajax 통신성공");
				
					if(result){
						alert("일정에 추가되었습니다.");
					}else{
						alert("ajax 통신은 됐지만 일정추가는 실패!")
					}
					
					$('.modal').modal("hide"); //모달창 닫기
				},
				error : function(){	
					alert("일정 추가가 실패했습니다.")
				}
			})
	    })
    </script>
    
     <!-- The Modal -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog modal-dialog-centered">  <!-- modal-dialog-centered : 모달창 화면중앙 -->
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">이 장소가 포함되지 않은 일정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div class="content_scroll">

	          </div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <a class="btn btn-primary" href="<%=contextPath%>/list.pm">새로운 일정 만들기</a>
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