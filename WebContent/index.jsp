<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Directing | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
    
    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<body>
    <!-- Page Preloder -->
	<div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="views/common/menubar.jsp"%>


    <!-- Hero Section Begin -->
    <section class="hero set-bg" data-setbg="resources/img/hero/hero-bg.gif">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title">
                            <h2>어디어디?!</h2>
                           
                        </div>
                        <div class="hero__search__form">
                            <form action="main.html">
                                <input type="text" placeholder="Search...">
                                <div class="select__option">
                                    <select>
                                        <option value="">카테고리</option>
                                        <option value="">먹기</option>
                                        <option value="">마시기</option>
                                        <option value="">놀기</option>
                                    </select>
                                </div>
                                <div class="select__option">
                                    <select>
                                        <option value="">장소 선택</option>
                                        <option value="">홍대</option>
                                        <option value="">강남</option>
                                    </select>
                                </div>
                                <button type="submit">검색하기</button>
                            </form>
                        </div>

                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

   <script>
            $(function(){
            var $header = $('header'); //헤더를 변수에 넣기
            var $page = $('.page-start'); //색상이 변할 부분
            var $window = $(window);
            var pageOffsetTop = $page.offset().top;//색상 변할 부분의 top값 구하기
            
            $window.resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
                pageOffsetTop = $page.offset().top;
            });
            
            $window.on('scroll', function(){ //스크롤시
                var scrolled = $window.scrollTop() >= pageOffsetTop; //스크롤된 상태; true or false
                $header.toggleClass('down', scrolled); //클래스 토글
            });
            });
        
        </script>

	<section class="page-start">
    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                
                <div class="container"><center><img src="resources/img/map_1.png"></center></div>
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>가장 많이 찾은  장소</h2>
                        <p>어디어디에서 가장 인기있는 장소들을 한눈에 볼수 있어요.</p>
                    </div>
                </div>
            </div>
           
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-1.jpg">
                                            <img src="resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>깔리</h5>
                                                <p>인도에서 직접 초빙한 현지인 요리사들이 선사하는 맛있는 인도 요리</p>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>18000- 36000</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 서울 종로구 명륜4가 170-3 2층</li>
                                                    <li><span class="icon_phone"></span> (02) 747-5050</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-2.jpg">
                                            <img src="resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="resources/img/listing/list-3.jpg">
                                            <img src="resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <img src="resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
    <!-- Most Search Section End -->

   
   

   

 

    <!-- Blog Section Begin -->
    <section class="news-post spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>커뮤니티</h2>
                        <p>어디어디 사용자 간의 후기 게시판</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="resources/img/blog/blog-1.jpg">
                            <a href="https://www.youtube.com/watch?v=8EJ3zbKTWQ8" class="play-btn video-popup"><i class="fa fa-play"></i></a>
                        </div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Videos</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="resources/img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Restaurant</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="resources/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> Travel</li>
                                <li>Restaurant</li>
                            </ul>
                            <h5><a href="#">Internet Banner Advertising Most Reliable</a></h5>
                            <ul class="blog__item__widget">
                                <li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
                                <li><i class="fa fa-user"></i> John Smith</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
</section>
   

    <%@ include file="views/common/footer.jsp"%>

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.nicescroll.min.js"></script>
    <script src="resources/js/jquery.barfiller.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>