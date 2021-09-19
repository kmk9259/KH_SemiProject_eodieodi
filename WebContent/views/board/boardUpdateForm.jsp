<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.board.model.vo.*"%>
    
    <% 
	Board board = (Board)request.getAttribute("b");
    ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");

	%>
<!DOCTYPE html>
<html>
<head>
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
    

#close {
    position: absolute;
    float: right;
    background: red;
	color: white;
	width:30px;
    z-index: 1;
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
      
      
          <form id="insertForm" action="<%= contextPath %>/update.bo" method="post" enctype="multipart/form-data">
          <input id="bno" type="hidden" name="bno" value="<%= board.getBoardNo() %>">
              <div class="form-group">
                  <label class="form-label" for="title"></label>
                  <input type="text" class="form-control" id="name" name="title" value="<%= board.getBoardTitle() %>" tabindex="1" required>
              </div>                            
                                        
                                         
              <div class="form-group">
                  
                  <textarea rows="15" cols="150" name="content" class="form-control" id="message"  tabindex="4" required><%= board.getBoardContent() %></textarea>                                 
              </div>
              
              
              <div class="text-center">
              
              
             
                
             
              <% if(fileList != null) { %> <!-- 기존파일 있으면 -->
              
              
              <div id="container">
              
               <a class="fileRemove1" id="close"> X </a>
              
              <img  name="file1" src="<%=contextPath%>/resources/board_upfiles/<%=fileList.get(0).getChangeName()%>" class="remove" id="titleImg"  width="200px" height="180">
          
              
             	<input type='hidden' name='originFile1' value='<%=fileList.get(0).getOriginName()%>'>
				<input id="fno1" type='hidden' name='originFileNo1' value='<%=fileList.get(0).getFileNo()%>'>
              	

              
              
             	 	 <% for(int i=1; i<fileList.size(); i++){ %>
             	 	 
             	
             	 <a class="fileRemove" id="close"> X </a>
             	 
                <img src="<%=contextPath%>/resources/board_upfiles/<%=fileList.get(i).getChangeName()%>"  id="contentImg<%=i%>" class="remove"  width="200px" height="180">
       
             	<input type='hidden' name='originFile<%=i +1%>' value='<%=fileList.get(i).getOriginName()%>'>
				<input id="fno<%=i+1 %>" type='hidden' name='originFileNo<%=i +1 %>' value='<%=fileList.get(i).getFileNo()%>'>

					<%} %>
					

				</div>

        
              <% } %>
              
             
             
              <% if(fileList.size() <= 4) { %>
             		<%for(int j= fileList.size(); j <4; j++) { %>
             
             
                <img name="file<%=j %>" id="contentImg<%=j %>" width="200px" height="180">
       				 <% } %>
   
              <% } %>
             
             
   
             
             
              
              	<div id="fileArea">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
				<input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
				<input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
				<input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
				</div>
              
     		
     		   
		
              
            
              
              
              <div class="text-center btns">
              
              
              <button type="submit" class="site-btn" onclick="checkValue()">수정하기</button>
              
              </div>
              
              
              </div><!--  전체 -->
              
          </form>
      </div>
  </div>
</div>
	
</div>
	
	
	<script>
	
	
	//사진클릭하면 업데이트되도록 설정되어 있음. 
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
		
		console.dir(inputFile);
	
	
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
			}
			
		}
	
	}
	
	
	
	
	
	
	</script>



<script>

//==================사진 지우기 함수 

 $(".fileRemove1").click(function(){

	
	var originFileNo1 = $("#fno1").attr("value");
	var remove = $(this).next().attr("src");
	
	console.log(originFileNo1); //57
	console.log(remove); // 파일 넘버
	

	
	$(this).next().attr("src", "");
	
	 $.ajax({
		
		url : "deleteFile.bo",
		data : {
			originFileNo1 : originFileNo1
		},
	 
	 	type: "post",
	 	processData:false,
        contentType:false,

	 	enctype:'multipart/form-data',

	 	
	 	success: function(result){
	 		console.log("ajax 통신 성공")
	 		$(this).next().attr("src");
	 		
	 	},
	 	error : function(){
	 		console.log("ajax 통신 실패")
	 	}
	}) 
	
	
}) 
	


</script>

</section>




	<script src="<%=contextPath%>/resources/js/main.js"></script>
	


	<%@ include file="../common/footer.jsp"%>



</body>
</html>