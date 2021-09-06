<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta charset="UTF-8">
    <title>community</title>
    
    <style type="text/css">
    
    .page-start{
    	background-color: white;
    	margin: 0;
    	padding: 0;
    }
    

    
    .btns {
    margin: 15px 15px;
    text-align: center; 
    }
    
    .outer{
		width:900px;
		height:1500px;
		color:white;
		margin:auto;
	}
	

	}

    
    
    </style>
    
    
</head>


</head>

<body>


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<%@ include file="../common/menubar.jsp"%>



	<script>
		$(function() {
			var $header = $('header'); //헤더를 변수에 넣기
			var $page = $('.page-start'); //색상이 변할 부분
			var $window = $(window);
			var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

			$window.resize(function() { //반응형을 대비하여 리사이즈시 top값을 다시 계산
				pageOffsetTop = $page.offset().top;
			});

			$window.on('scroll', function() { //스크롤시
				var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
				$header.toggleClass('down', scrolled); //클래스 토글
			});
		});
		
		
		$(document).ready(function() {
			  $('#summernote').summernote({
				// set editor height
				    height:1000,                 // set editor height
				    minHeight: 1000,             // set minimum height of editor
				    maxHeight: 1000,       
				    disableResizeEditor: true,
				    callbacks:{
				      onChange: function(){
				        if($(".note-editable")[0].scrollHeight>1000){
				          $(".note-status-output").html('<div class="alert alert-danger">내용이 영역을 벗어났습니다. 스크롤를 이용하세요</div>');
				        }else{
				          $(".note-status-output").html("");
				        }
				      }
				    }
			  });
			});
		
		
		$('p').attr('name', 'content');
	</script>


	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="<%=request.getContextPath()%>/resources/img/breadcrumb/breadcrumb-blog.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>커뮤니티</h2>
						<div class="breadcrumb__option">
							<a href="#"><i class="fa fa-home"></i> 홈</a> <span>커뮤니티</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- Breadcrumb End -->

<section class="page-start">
	
	<!--insert page -->
	<div class="outer">
	<br><br><br>
	
	<!-- 이미지요청시 enctype="multipart/form-data 명시해줘야한다. -->
	<form id="insertForm" action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
	<div>제목</div><input type="text" name="title">

	 <div id="summernote"></div>
	 <div class="btns">
	 <button type="reset" class="site-btn">취소하기</button>
	 <button type="submit" class="site-btn">등록하기</button>
	 </div>
	 </form>
	 
	 </div>
    
    
      
   



</section>

	<!-- Js Plugins -->


	<script src="<%=contextPath%>/resources/js/main.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


	<%@ include file="../common/footer.jsp"%>




</body>

</html>