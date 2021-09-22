<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.board.model.vo.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<style>
.bcontent{
 font-size: 1.5rem;
 word-break:break-all;
}


.reBtn {
	font-size: 14px;
    color: #ffffff;
    font-weight: 700;
    text-transform: uppercase;
    display: inline-block;
    padding: 5px 10px 5px;
    background: #D958A0;
    border: none;
    display: inline-block;

}


</style>

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
					
                        <div class="blog__details__video set-bg" data-setbg="<%= contextPath %>/resources/board_upfiles/<%=fileList.get(0).getChangeName()%>">
                            
                        </div>
                        <p class="bcontent"> <%= b.getBoardContent() %></p>
                        
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
                                <textarea rows="5" cols="90" id="replyContent" style="resize:none;" readonly="readonly" disabled>로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요</textarea>
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
                            <form action="<%=contextPath %>/search.bo">
                                <input type="text" name="search" placeholder="검색하기">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        
                        <!-- 인기 글 뿌려 줄 장소  -->
                        <div class="blog__sidebar__recent">
                            <h5>인기 글 </h5>
                          
                          <div id="thumbList">
                                
                            </div> 
                            <!-- </a> -->
                         
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
			
			if($("#replyContent").val() != "") {
			var content = $("#replyContent").val();
			var bno = <%=b.getBoardNo()%>;
			<%-- var rno = <%=reply.getReplyNo()%> --%>
			
			$.ajax({
				url:"rInsert.bo",
				type: "post",
				data: {
					content: content,
					bno:bno,
					/* rno: rno */
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
			
			}else{
				alert("댓글 내용을 입력하세요.")
			}
		})
		
		
		
	})
		
		function selectReplyList(){
    	
			$("#replyList").empty(); //테이블을 비우고 
			
			$.ajax({
				url: "rList.bo",
				type: "get",
				data: {
					bno: <%=b.getBoardNo() %>

				},
				
				success : function(list){
					console.log(list);
					
				var value="";
				for(var i in list){
					var rno = list[i].replyNo;
					var user = list[i].replyWriter;
					value += '<br><br><p>'+
					'<input type="hidden" name="rno" value="'+rno+'">'+
					list[i].replyContent+
					'<ul class="blog__item__widget">'+
					'<hr>'+
					'<li>'+'<i class="no"> No.'+list[i].replyNo+'</li>'+
					'<li>'+'<i class="fa fa-clock-o">'+'</i>'
					+list[i].createDate+'</li>'+
					'<li>'+'<i class="fa fa-user">&nbsp;'+user+'</i>'
					+'</li>'<%if(loginUser != null) { %>+
					'<button class="reBtn" onclick="del()">삭제</button>'<% } %>+
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
    //댓글 삭제 
    function del(){
    	
    	var rno = $('input:hidden[name="rno"]').val();
    	console.log(rno);
    	$.ajax({
    		url: "deleteComment.bo",
    		data : { 
    			rno : rno
    		},
    		type: "post",
    		
    		success : function(){
    			console.log("Ajax 통신 성공");
    			selectReplyList();
    		},
    		error : function(e){
    			console.log(e);
    		}
    	})
    	
    }
    //========================= 인기글 ========================
    	
    	
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
		$.ajax({
			url : "topList.do",
			type: "get",
			success:function(list){
				console.log(list);
				console.log(list[0].titleImg);
				console.log(list[0].boardTitle);
				var contextPath = "<%=contextPath%>"; 
				var value = "";
				for(var i in list){
					var tmp = list[i].boardTitle;
					var time = list[i].createDate;
					console.log(time);
					value += '<div class="blog__sidebar__recent__item__pic thumb" >'+ 
							 '<input type="hidden" value="' +list[i].boardNo+ '">'+
							 '<img src="'+contextPath+'/resources/board_upfiles/' + list[i].titleImg + '" width="80px" height="70px">'+
							 '</div><div class="blog__sidebar__recent__item__text"><span class="lanking">'+ (++i)+ 
							 '</span></div><h6 class="thumb">'+ tmp +'</h6>'+
							 '<p><i class="fa fa-clock-o"></i>&nbsp;&nbsp;&nbsp;'+time+'</p></div>';
							
							 
				}
				console.log(value);
				$("#thumbList").html(value).trigger("create");
			},
			error:function(){
				console.log("ajax통신실패");
			}
		})
	}
    	
    	
    //========================== 인기글 관련===============================
    	
    	
    

    </script>
    
    
    
    
    <script src="<%= contextPath %>/resources/js/main.js"></script>

    
     <%@ include file="../common/footer.jsp"%> 
</body>
</html>