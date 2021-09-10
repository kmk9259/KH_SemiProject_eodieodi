<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.board.model.vo.*"%>
<% 
Board b = (Board)request.getAttribute("b");
ArrayList<Attachment> Filelist = (ArrayList<Attachment>)request.getAttribute("Filelist");
	%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta charset="UTF-8">
    <title>커뮤니티</title>
    
    
    
   
	
	<script type="text/javascript">
		function checkValue(){
			var form = document.forms[0];
			var title = form.title.value;
			var content = form.content.value;
			var file1 = form.file1.value;
			var file2 = form.file2.value;
			var file3 = form.file3.value;
			var file4 = form.file4.value;
			
			if(!title){
				alert("제목을 입력해주세요.")
				return false;
			}
			else if(!content){
				alert("내용을 입력해주세요.")
				return false;
			}else if(!file1){
				alert("thumnail 사진은 반드시 올려야 합니다.")
				return false;
			}
				
		}
	
	</script>
    
    
    
    
    <style type="text/css">
    
    .page-start{
    	background-color: white;
    	margin: 0;
    	padding: 0;
    }
    

    .btns{
    	margin: 100px;
    	padding: 100px;
    }
  
    
    .outer{
		width:900px;
		height:1500px;
		color:white;
		margin:auto;
	}
	

	.image-form{
	
	width: 900px;
	}

	.title{
	
	color: black;
	}
	
	.btns{
	margin: 10px;
	padding: 30px;
	}
    
    
    </style>


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
		
		
		/* $(document).ready(function() {
			  $('#summernote').summernote({
				// set editor height
				    height:1000,                 // set editor height
				    minHeight: 1000,             // set minimum height of editor
				    maxHeight: 1000,       
				    disableResizeEditor: true,
				    focus: true,
				    lang: "ko-KR",
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
			}); */
		
		
			function goBack(){
				history.back();
			}
		
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
	
	
	
	<div class="container">
  <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">                        
        <h2>글 작성</h2>
      </div>
  </div>
  <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
      
      
          <form id="insertForm" action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
          <input type="hidden" name="writer" value="<%= loginUser.getUserNo() %>">
              <div class="form-group">
                  <label class="form-label" for="title">Title</label>
                  <input type="text" class="form-control" id="name" name="title" placeholder="제목을 입력하세요" tabindex="1" required>
              </div>                            
                                        
                                         
              <div class="form-group">
                  
                  <textarea rows="15" cols="150" name="content" class="form-control" id="message" placeholder="글을 작성하세요." tabindex="4" required></textarea>                                 
              </div>
              
              
              <div class="text-center">
              <label class="title">thumbnail 이미지</label>
              <div>
             
              <img name="files" id="titleImg" width="200px" height="180">
              
              </div>
              
              <br>
              <div>
              <img name="files" id="contentImg1" width="200px" height="180">
              <img name="files" id="contentImg2" width="200px" height="180">
              <img name="files" id="contentImg3" width="200px" height="180">
              
              </div>
              
              
              
              <div id="fileArea">
           
				<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
				<input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
				<input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
				<input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
			  </div>
              
              </div>
              
              
              <div class="text-center btns">
              
              
              <button type="submit" class="site-btn" onclick="checkValue()">등록하기</button>
       		  <button type="reset" class="site-btn">취소하기</button>
              <button type="history" class="site-btn" onclick=goBack();>목록으로</button>
              </div>
              
          </form>
      </div>
  </div>
</div>
	
	
	
	
	<script>
	
	
	
	$(function(){
		$("#fileArea").hide();
		
		$("#titleImg").click(function(){
			$("#file1").click();
		});
		
		$("#contentImg1").click(function(){
			$("#file2").click();
		});
		
		$("#contentImg2").click(function(){
			$("#file3").click();
		});
		
		$("#contentImg3").click(function(){
			$("#file4").click();
		});
		
	});
	
	
	function loadImg(inputFile, num){// 이미지 미리보기 
		//inputFile : 현재 변화가 생긴 input type = "file"
		//num : 조건문을 활용 하기 위해 전달받은 매개변수
		
		//console.dir(inputFile);
	
	
		if(inputFile.files.length == 1){//file이 존재 할경우 
			var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 
			
			reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )
			
			
			reader.onload = function(e){//파일 읽기가 다완료 되면 실행할 메소드 
				console.log(e);
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;// result :  읽어들이 파일 내용 data:URL 형식 
				case 2 : $("#contentImg1").attr("src", e.target.result); break;
				case 3 : $("#contentImg2").attr("src", e.target.result); break;
				case 4 : $("#contentImg3").attr("src", e.target.result); break;
				}
			};
			
		}
	}
	</script>

	 
	 
	 

		<%-- <div style="width: 60%; margin: auto;">
			<form id="insertForm" action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">
				<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
				<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
				<br><br> 
				<textarea id="summernote" name="content"></textarea>
				<button type="submit">등록하기</button>
			</form>
		</div> --%>
	 
	 </div>
    
    
      
   



</section>

	<!-- Js Plugins -->


	<script src="<%=contextPath%>/resources/js/main.js"></script>
	<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->


	<%@ include file="../common/footer.jsp"%>




</body>

</html>