<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.board.model.vo.*,
    semiProject.com.kh.notice.model.vo.*"
    
    %>
    
    <%
	//공지사항
	ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist"); 
    
	//게시글 
	ArrayList<Board> list  = (ArrayList<Board>)request.getAttribute("list");
	
	//검색글
	ArrayList<Board> searchBoard  = (ArrayList<Board>)request.getAttribute("searchBoard");
	
	//페이지 정보 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String searchWord = (String)request.getAttribute("searchWord");
	
	
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style type="text/css">
.resultTitle{
	padding: 50px; 50px;
	text-align: center;

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
        
        
        function goBack(){
			location.href="<%=request.getContextPath()%>/list.bo";
		}

    </script>
    
    
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb/breadcrumb-blog.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>커뮤니티</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> 홈</a>
                            <span>커뮤니티</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
    
     <!--폴라로이드 -->


 <%@ include file="../common/polaroid.jsp"%> 

    <!-- 폴라로이드  end-->
    
    
    <!-- ================= 공지사항 =============== -->

<section class="faq bg-color">
      <div class="container">
        <div class="faq-title">
          <h2>공지사항</h2>
          <p>어디어디 공지사항입니다!</p>
        </div>
        
        <% if(nlist.isEmpty()){ %>
        <% System.out.print(nlist); %>
        <div><p>공지사항이 없습니다.</p></div>
        
        
        <% }else{  %>
        
				 <% for(int i =0; i<nlist.size(); i++){ %>
				 
		<ul class="faq-list">
          <li data-aos="fade-up" data-aos-delay="100" class="aos-init aos-animate noticeView">
          
            <a data-toggle="collapse" class="collapse multi-collapse" href="#faq<%=i %>" aria-expanded="true" id="title" onchange="myFunction()" >
            <%= nlist.get(i).getNoticeTitle() %> <i class="fas fa-arrow-up"></i></a>
            <div id="faq<%=i %>" class="collapse" data-parent=".faq-list" >
               <p>
                <%= nlist.get(i).getNoticeContent() %>
              </p>  
            </div>
          </li>
          </ul>
				<% } %>
			<% } %>

      </div>

    </section>
    


<!-- =================공지사항 end =============== -->
    
   
    <section class="blog-section spad">
    
        <div class="container">
            <div class="row">
            
                <div class="col-lg-8">
                    
                    <div class="faq-title">
			          <h2><%=searchWord %></h2><br>
			          <p> 검색 결과 입니다!</p>
        			</div>
                    
                     <div class="row">
                    
                    
                    <%if(searchBoard.isEmpty()){ %>
				
					<p>조회된 리스트가 없습니다.</p>
				
					<%}else{ %>
					<% for(Board sb : searchBoard){ %>
                    
                   
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                               
                                
                                
                                <div class="blog__item__pic set-bg thumbnail" data-setbg="<%=contextPath %>/resources/board_upfiles/<%= sb.getTitleImg() %>" >
				                <input type="hidden" value="<%=sb.getBoardNo()%>">
                                </div>
                                
                                <div class="blog__item__text">
                                   
                                    <h4 class="thumbnail" ><%= sb.getBoardTitle() %>
                                    <input type="hidden" value="<%=sb.getBoardNo()%>">
                                    </h4>
                                    <br>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> <%= sb.getCreateDate() %></li>
                                        <li><i class="fa fa-user"></i> <%= sb.getBoardWriter() %></li>
                                        <li><i class="fa fa-stars"></i> <%= sb.getCount() %></li>
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <%} %>
				<%} %>
                      
                        
                        
                    </div> 
                    
                    <!-- ========================공지 사항 끝================================ -->
                    
                    
                   
                    
          <br><br><br>          
           <% if(loginUser != null){ %>
			<button  type="submit" class="site-btn" onclick="location.href='enroll.bo'">글쓰기</button>
			<button type="submit" class="site-btn" onclick="goBack();">목록으로</button>
		 <% }else {%>         
                    
			
			<button type="submit" class="site-btn" onclick="goBack();">목록으로</button>
                    
            <% } %>        
                    
           
			</div> <!-- col-lg-8 닫는 div -->
			
			
			
                <div class="col-lg-4"> 
                
                    	<div class="blog__sidebar"> 
                        
                        <!-- ==================== 검색바 ===================== -->
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
                        <!-- 인기 글 뿌려 줄 장소  -->
                       
                    	</div>
                </div>
                
            </div> <!-- div row ending -->
        </div> <!-- div container ending -->
    </section>
    <!-- Blog Section End -->

	</section><!-- 네비바 스크롤 다운시 검은색으로 변하는 구간 ending -->

    
	<script>
	
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

    </script>
    
    
      <!-- Js Plugins -->
   
    
    <script src="<%= contextPath %>/resources/js/main.js"></script>
    
    <!-- QnA 부분 아이콘 불러오는 cdn -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    
     <%@ include file="../common/footer.jsp"%> 
</body>
</html>