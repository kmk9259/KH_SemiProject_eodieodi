<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.board.model.vo.*,
    semiProject.com.kh.notice.model.vo.*"
    
    %>
    
<%
      
    ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist"); 
	ArrayList<Board> list  = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디 커뮤니티</title>


 



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

<section class="page-start">
    <section id="photostack-1" class="photostack photostack-start">
        <div>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/1.jpg" alt="img01" /></a>
                <figcaption>
                    <h2 class="photostack-title">2020.10.17</h2>
                </figcaption>
            </figure>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/2.jpg" alt="img02" /></a>
                <figcaption>
                    <h2 class="photostack-title">2018.03.12</h2>
                </figcaption>
            </figure>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/3.jpg" alt="img03" /></a>
                <figcaption>
                    <h2 class="photostack-title">2021.06.30</h2>
                </figcaption>
            </figure>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/4.jpg" alt="img04" /></a>
                <figcaption>
                    <h2 class="photostack-title">2017.12.18</h2>
                </figcaption>
            </figure>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/5.jpg" alt="img05" /></a>
                <figcaption>
                    <h2 class="photostack-title">2020.08.25</h2>
                </figcaption>
            </figure>
            <figure>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/6.jpg" alt="img06" /></a>
                <figcaption>
                    <h2 class="photostack-title">2021.01.17</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/7.jpg" alt="img07" /></a>
                <figcaption>
                    <h2 class="photostack-title">2019.05.23</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/8.jpg" alt="img08" /></a>
                <figcaption>
                    <h2 class="photostack-title">2020.09.05</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/9.jpg" alt="img09" /></a>
                <figcaption>
                    <h2 class="photostack-title">2016.05.21</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/10.jpg" alt="img10" /></a>
                <figcaption>
                    <h2 class="photostack-title">2018.04.02</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/11.jpg" alt="img11" /></a>
                <figcaption>
                    <h2 class="photostack-title">2020.03.08</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/12.jpg" alt="img12" /></a>
                <figcaption>
                    <h2 class="photostack-title">2019.07.15</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/13.jpg" alt="img13" /></a>
                <figcaption>
                    <h2 class="photostack-title">2021.05.30</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/14.jpg" alt="img14" /></a>
                <figcaption>
                    <h2 class="photostack-title">2017.06.04</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/15.jpg" alt="img15" /></a>
                <figcaption>
                    <h2 class="photostack-title">2020.08.23</h2>
                </figcaption>
            </figure>
            <figure data-dummy>
                <a href="#" class="photostack-img"><img src="<%= request.getContextPath() %>/resources/img/blog/16.jpg" alt="img16" /></a>
                <figcaption>
                    <h2 class="photostack-title">2019.10.20</h2>
                </figcaption>
            </figure>
        </div>
    </section>




    <!-- 폴라로이드  end-->


<!-- =================QnA =============== -->

<%-- <%@ include file="../board/notice.jsp"%> --%>

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
				 <% for(Notice n : nlist){ %>
		<ul class="faq-list">
          <li data-aos="fade-up" data-aos-delay="100" class="aos-init aos-animate">
            <a data-toggle="collapse" class="collapsed" href="#faq1" aria-expanded="false"><%= n.getNoticeTitle() %> <i class="fas fa-arrow-up"></i></a>
            <div id="faq1" class="collapse" data-parent=".faq-list" style="">
              <p>
                <%= n.getNoticeContent() %>
              </p>
            </div>
          </li>
          </ul>
				<% } %>
			<% } %>
          
        
      </div>
      
     
    </section>


<!-- =================QnA end =============== -->


    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog__item__large">
                    
                        <a href="<%= request.getContextPath() %>/views/board/blogDetails.jsp">
                        
                        <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/seoul.jpg"></div>
                        </a>
                        <div class="blog__item__text">
                           
                            <h3><a href="#">Internet Banner Advertising Most Reliable</a></h3>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                            <p>One of my favorite things I like to watch is the bloopers and outtakes that are shown of
                                mistakes made during the making of a movie.</p>
                        </div>
                    </div>
                    
                    
                    <div class="row">
                    
                    
                    <%if(list.isEmpty()){ %>
				
					<p>조회된 리스트가 없습니다.</p>
				
					<%}else{ %>
					<% for(Board b : list){ %>
                    
                    
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="<%=request.getContextPath() %>/detail.bo">
                                
                                <input type="hidden" value="<%=b.getBoardNo()%>">
                                <div class="blog__item__pic set-bg" data-setbg="<%=contextPath %>/resources/board_upfiles/<%= b.getTitleImg() %>" >
				               <%-- <img src="<%=contextPath %>/resources/board_upfiles/<%= b.getTitleImg() %> --%>
				               
				               
                                </div>
                                </a>
                                <div class="blog__item__text">
                                   
                                    <h5><a href="<%=request.getContextPath() %>/detail.bo"><%= b.getBoardTitle() %></a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> <%= b.getCreateDate() %></li>
                                        <li><i class="fa fa-user"></i> <%= b.getBoardWriter() %></li>
                                        <li><i class="fa fa-heart"></i> <%= b.getCount() %></li>
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <%} %>
				<%} %>
                      
                        
                        
                    </div>
                    
                    

<!----------------------- 페이징바 만들기 -------------------------------->


		<div class="blog__pagination" >
			<!-- 맨 처음으로 (<<) -->
			<a href="<%=contextPath%>/list.bo?currentPage=1"> &lt;&lt; </a>
			
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<a class="noHover"> &lt; </a>
			<%}else{ %>
			<a href="<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>"> &lt; </a>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<a class="noHover"> <%= p %> </a>
				<%}else{ %>
				<a href="<%=contextPath %>/list.bo?currentPage=<%= p %>"> <%= p %> </a>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<a class="noHover"> &gt; </a>
			<%}else { %>
			<a href="<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>"> &gt; </a>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<a href="<%=contextPath%>/list.bo?currentPage=<%=maxPage%>"> &gt;&gt; </a>
		</div> 
                    
          <br><br><br>          
           <% if(loginUser != null){ %>
			<button  type="submit" class="site-btn" onclick="location.href='enroll.bo'">글쓰기</button>
		<% }else {%>         
                    
			<button type="submit" class="site-btn" onclick="pop();">글쓰기</button>
                    
            <% } %>        
                    
           
           
           <script type="text/javascript">
				function pop(){
					alert("로그인후 사용가능합니다.")
				}
	
	
				
			
				
				<%if(!list.isEmpty()){%>
				$(function(){
					$(".blog__item>a").click(function(){
						var bno = $(this).children().eq(0).text();
						location.href="<%= contextPath%>/detail.bo?bno="+bno;
						console.log(bno);
					})
				})
				<%}%>
			
				
		</script>
           
                    
                    
 
                    
                    
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Searching...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__recent">
                            <h5>Recent Post</h5>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-1.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                <span class="lanking">1</span>
                                    <h6>Tortoise grilled on salt</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-2.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span class="lanking">2</span>
                                    <h6>Shrimp floured and fried</h6>
                                    <p><i class="fa fa-clock-o"></i> 22th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-3.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span class="lanking">3</span>
                                    <h6>Sweet and sour pork ribs</h6>
                                    <p><i class="fa fa-clock-o"></i> 25th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-4.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <span class="lanking">4</span>
                                    <h6>Crab fried with tamarind</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                            <a href="#" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%= request.getContextPath() %>/resources/img/blog/recent-5.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                <span class="lanking">5</span>
                                    <h6>Tortoise grilled on salt</h6>
                                    <p><i class="fa fa-clock-o"></i> 19th March, 2019</p>
                                </div>
                            </a>
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

</section>

    
	
    
   
    <!-- Js Plugins -->
   
    
    <script src="<%= contextPath %>/resources/js/main.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    
     <%@ include file="../common/footer.jsp"%> 




</body>

</html>