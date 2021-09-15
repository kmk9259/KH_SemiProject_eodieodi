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
    <title>어디어디</title>

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
                            <h6 style="color: white">원하는 장소를 검색해보세요</h6>       
                           
                        </div>
                        <div class="hero__search__form">
                            <form action="<%=contextPath %>/main">
                                <input type="text" id="search" name="search" style="width: 85%" placeholder="Search...">
                                
                                <button type="submit" class="search">검색하기</button>
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
           
           	$(function(){
				$(".search").click(function(){
					var search = document.getElementById('search').text();
                	console.log(search);
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
                        <h2>인기 TOP 어디어디?!</h2>
                        <p>어디어디에서 가장 인기있는 장소들을 한눈에 볼수 있어요.</p>
                    </div>
                </div>
            </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row toplist">
                                
							</div>
						</div>
					</div>
					<script>
					$(function(){
						selectTopList();
						setInterval(selectTopList, 2000);  		//조회할 때마다 인기게시글이 바뀌므로 2초마다 조회하기
						$(".toplist").on("click",".listing__item__pic", function(){
							var bId = $(this).children().eq(0).val();
							console.log(bId);
							<%-- location.href = "<%=contextPath%>/detail.th?bId="+bId; --%>
						})
					})
					function selectTopList(){
						$.ajax({
							url:"topList",
							type:"post",
							success:function(list){
								var value = "";
								
								for(var i in list){
									var src = '<%=contextPath%>/resources/place_upFiles/'+list[i].titleImg;
								
									value += '<div class="col-lg-4 col-md-6">'+
		                                    			'<div class="listing__item">'+
		                                    '<input type="hidden" id="placeNo" value="'+list[i].placeNo+'">'+
		                                    '<div class="listing__item__pic set-bg" style="background-image: url(' + src + '); ">'+
		                                    
		                                       ' <div class="listing__item__pic__tag">Popular</div>'+
		                                        
		                                   ' </div>'+
		                                  '  <div class="listing__item__text">'+
		                                      ' <div class="listing__item__text__inside">'+
		                                           ' <h5>'+list[i].placeTitle+'</h5>'+
		                                           ' <p>'+list[i].description+'</p>'+
		                                            '<div class="listing__item__text__rating">'+
		                                               ' <div class="listing__item__rating__star">'+
		                                                '    <span class="icon_star"></span>'+
		                                              '      <span class="icon_star"></span>'+
		                                            '       <span class="icon_star"></span>'+
		                                            '<span class="icon_star"></span>'+
		                                             '       <span class="icon_star-half_alt"></span>'+
		                                           '    </div>'+
		                                          '      <h6>'+list[i].price+'</h6>'+
		                                         '   </div>'+
		                                        '    <ul>'+
		                                        '       <li><span class="icon_pin_alt"></span> '+list[i].address+'</li>'+
		                                    '<li><span class="icon_phone"></span> '+list[i].placePhone+'</li>'+
		                                     '       </ul>'+
		                                      '  </div>'+
		                                        '<div class="listing__item__text__info">'+
		                                         '<div class="listing__item__text__info__left">'+
		                                                '조회수'+
		                                            '</div>'+
		                                          '  <div class="listing__item__text__info__right">'+list[i].count+'</div>'+
		                                        '</div>'+
		                                    '</div>'+
		                                '</div>'+
		                            '</div>'
								}
								$(".toplist").html(value).trigger("create");
								$(function(){
									$(".listing__item__pic").click(function(){
										
										var parent = $(this).parent(); 
										var pNo = parent.children("#placeNo").val();
										location.href='<%=contextPath%>/detail.pl?pNo='+pNo;
									});
								});
							},
							error:function(){
								console.log("ajax통신실패");
							}
						})
					}
					</script>
                               
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