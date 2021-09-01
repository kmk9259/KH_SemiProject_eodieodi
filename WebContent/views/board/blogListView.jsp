<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Directing | Template</title>


 



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




    <!-- 폴라로이드 -->




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
                            <p>One of my favourite things I like to watch is the bloopers and outtakes that are shown of
                                mistakes made during the making of a movie.</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-1.jpg"></div>
                                </a>
                                <div class="blog__item__text">
                                   
                                    <h5><a href="#">Florida for 20 YEARS swims in the Gulf for the FIRST</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-2.jpg"></div>
                                </a>
  
                                <div class="blog__item__text">
                                   
                                    <h5><a href="#">Florida Bar Removes Famous Dollar Bill Decor</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-3.jpg"></div>
                                </a>
                                <div class="blog__item__text">
                                    
                                    <h5><a href="#">'Junior detectives' help Roseville, Calif police</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-4.jpg">
                                   
                                </div>
                                </a>
                                <div class="blog__item__text">
                                    
                                    <h5><a href="#">Dog Rescues Florida Woman After Her iPad Catches</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-5.jpg"></div>
                                </a>
                                <div class="blog__item__text">
                                   
                                    <h5><a href="#">Citrus Heights Snack Man Helps Feed The Homeless</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="blog__item">
                                <a href="blog-details.html">
                                <div class="blog__item__pic set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/blog/bp-6.jpg"></div>
                                </a>
                                <div class="blog__item__text">
                                   
                                    <h5><a href="#">Homeless woman’s viral subway opera performance</a></h5>
                                    <ul class="blog__item__widget">
                                        <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                        <li><i class="fa fa-user"></i> John Smith</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="blog__pagination">
                        <a href="#"><i class="fa fa-long-arrow-left"></i> Pre</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                     <br><br><br>
                    <button type="submit" class="site-btn" onclick="location.href='blogInsertPage.jsp'">글쓰기</button>
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

    
     <%@ include file="../common/footer.jsp"%> 




</body>

</html>