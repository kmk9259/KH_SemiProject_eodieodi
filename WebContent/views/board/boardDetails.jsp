<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.board.model.vo.*"%>
    
   <%
   	Reply reply  = (Reply)request.getAttribute("reply");
   	Board b = (Board)request.getAttribute("b");
    ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	Attachment titleImg = fileList.get(0);
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상세 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

<%@ include file="../common/menubar.jsp"%>


 <script>
        $(function () {
            var $header = $('header'); //헤더를 변수에 넣기
            var $page = $('.page-start'); //색상이 변할 부분
            var $window = $(window);
            var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기

            $window.resize(function () { //반응형을 대비하여 리사이즈시 top값을 다시 계산
                pageOffsetTop = $page.offset().top;
            });

            $window.on('scroll', function () { //스크롤시
                var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
                $header.toggleClass('down', scrolled); //클래스 토글
            });
        });

    </script>


 

   


<section class="page-start">
    <!-- Blog Hero Begin -->
    <div class="blog-details-hero set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb/breadcrumb-blog2.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="blog__hero__text">
                        <div class="label">어디어디 커뮤니티</div>
                        <h2><%= b.getBoardTitle() %></h2>
                        <ul>
                            <li><i class="fa fa-clock-o"></i> <%= b.getCreateDate() %></li>
                            <li><i class="fa fa-user"></i> <%= b.getBoardWriter() %> </li>
                            <li><i class="fa fa-star"></i> <%= b.getCount() %></li>
                            <%-- <li><i class="fa fa-heart"></i> <%= b.getLikes() %></li> --%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog Hero End -->
    

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog__details__text">
                    <form action="" id="postForm" method="post">
			<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
			
		</form>
                        <div class="blog__details__video set-bg" data-setbg="<%= contextPath %>/resources/board_upfiles/<%=titleImg.getChangeName()%>">
                            
                        </div>
                        <p> <%= b.getBoardContent() %></p>
                        
                        <% for(int i=1; i<fileList.size(); i++){ %>
                        <img src="<%=contextPath%>/resources/board_upfiles/<%=fileList.get(i).getChangeName()%>">
                        
                		<% } %>
                    </div>
                   
                   <br><br>
                   <!-- 수정,삭제,목록 -->
                   <div class="btns" align="center">
					<button type="button"  class="site-btn" onclick="location.href='<%=contextPath%>/list.bo?currentPage=1';">목록으로</button>
					
					<% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())){ %>
						
						<button type="button"  class="site-btn" onclick="updateForm();">수정하기</button>
						<button type="button" class="site-btn" onclick="deleteBoard();">삭제하기</button>
					<% } %>
				   </div>
				   
				   <!-- 보드 번호 보내주려고  -->
					<%-- <form action="" id="postForm" method="post">
					<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
					</form> --%>
				<script>
					function updateForm(){
						$("#postForm").attr("action", "<%=contextPath%>/updateForm.bo");
						$("#postForm").submit();
					}
					
					function deleteBoard(){
						$("#postForm").attr("action", "<%=contextPath%>/deleteB.bo");
						$("#postForm").submit();
					}
				</script>
				   
				   <br><br>
                    
                    <div class="blog__details__comment__form">
                        
                       
                        
                        <% if(loginUser != null) { %> 
                        
                        
                           <div class="blog__details__comment__title">
                            <h4>댓글 달기</h4>
                            
                            
                           </div>
                            <div class="input-comment">
                                
                                <textarea rows="5" id="replyContent" style="resize:none; width:100%;"></textarea>
                            </div>
                            <button type="submit" class="site-btn" id="addReply">댓글 등록</button>
                            
                            <% }else{ %> 
                            
                            <div class="input-comment">
                                <p>Comment</p>
                                <textarea rows="5" cols="90" id="replyContent" style="resize:none;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea>
                            </div>
                            <button type="submit" class="site-btn" disabled>댓글 등록</button>
                            
                             <% } %> 
                             
                             
                             <!-- --댓글 달면 보여질 리스트  -->
                             
                             
                             
                             <br><br>
                             
   			 		
   			 		
   			 	     <section class="content-item" id="comments">

			                
			                   
			                    <div class="blog__item__text" id="replyListArea">
			                        <div id="replyList"> <!-- 글이 선택되면 자동으로 댓들이 조회됨 -->
			                        
			                        </div>
			                    </div>
			                
    
					</section>
                             
                             
					</div> <!-- 코멘트 섹션 end  -->
                </div>
                
                
                
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Searching...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        
                        <!-- 인기 글 뿌려 줄 장소  -->
                        <div class="blog__sidebar__recent">
                            <h5>인기 글 </h5>
                          <!--   <a href="#" class="blog__sidebar__recent__item"> -->
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-1.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span class="lanking">1</span>
                                    <h6>Tortoise grilled on salt</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            <!-- </a> -->
                         
                        </div>
                        <!-- 인기 글 뿌려 줄 장소  -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    </section>
    <!-- Blog Details Section End -->
    
    <!-- 댓글 등록 된거 보여질수 있게 ajax 통신 이용할것 -->
    <script type="text/javascript">
    
    $(function(){
		selectReplyList(); //글이 조회되면 댓글이조회 되어야 한다.
		
		$("#addReply").click(function(){
			var content = $("#replyContent").val();
			var bno = <%=b.getBoardNo()%>;
			
			$.ajax({
				url:"rInsert.bo",
				type: "post",
				data: {
					content: content,
					bno:bno
				},
				success:function(status){
					if(status == "success"){
						selectReplyList();
						$("#replyContent").val(""); //컨테츠에 값으 초기화 함 
					}
				},error : function() {
					console.log("ajax 통신 실패  - 댓글 등록")
				}
			})
			
			//location.reload(); //새로고침
		})
		
		
		
	})
		
		function selectReplyList(){
    	
			$("#replyList").empty(); //테이블을 비우고 
			
			$.ajax({
				url: "rList.bo",
				type: "get",
				data: {bno: <%=b.getBoardNo() %>},
				
				success : function(list){
					console.log(list);
					
				var value="";
				for(var i in list){
					value += '<p>'+
					list[i].replyContent+
					'<ul class="blog__item__widget">'+
					'<hr>'+
					'<li>'+'<i class="fa fa-clock-o">'+'</i>'
					+list[i].createDate+'</li>'+
					'<li>'+'<i class="fa fa-user">'+'</i>'
					+list[i].replyWriter+'</li>'+
					'<li id="result">'+'<a class="fa fa-thumbs-up" onclick= "count("plus")" >'+'</a>'
					+list[i].likes+'</li>'+
					'<br><br><br>'
					
					'</ul>';
				}
				$("#replyList").html(value);
				
				},
	            error:function(){
	               console.log("ajax 통신 실패 - 댓글 조회");
	            }
	            
	         })
	      }
    
     
    
  //좋아요 클릭함수 넣어줄것
  function count(){
	  const result = document.getElementById('result');
	  
	  let number = result.innerText;
	  
	  if(type === 'plus') {
		    number = parseInt(number) + 1;
	  }
  }
  
<%-- 	$('#thumbup').click(function(){
		var likes = $('#thumbup').val();
		var rno = <%=reply.getReplyNo() %>;
		
		$.ajax({
			
			url: "rDetail.bo",
			type: "get",
			data: {rno: <%=reply.getReplyNo() %>},
			
			success:function(status){
				if(status == "success"){
					selectReplyList();
					
				}
			},error : function() {
				console.log("ajax 통신 실패  - 좋아요 클릭")
			}
		})
	}) --%>
    </script>
    
    
    
    
    <script src="<%= contextPath %>/resources/js/main.js"></script>

    
     <%@ include file="../common/footer.jsp"%> 
</body>
</html>