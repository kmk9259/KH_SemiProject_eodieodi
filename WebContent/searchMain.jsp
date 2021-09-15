<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, semiProject.com.kh.place.model.vo.*"%>
<%
	ArrayList<Place> searchPlace = (ArrayList<Place>) request.getAttribute("searchPlace");
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디</title>

   
</head>

<body>
    <!-- Page Preloder -->
	<div id="preloder">
        <div class="loader"></div>
    </div>

    <%@ include file="views/common/menubar.jsp"%>

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
   $(function()
	{
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
    	<section class="most-search spad">
        	<div class="container">
	            <div class="row">	                
	                <div class="container" id="move" style="height: 400px"><center><img src="resources/img/map_1.png"></center></div>
		                <div class="col-lg-12">
		                    <div class="section-title">
		                        <h2>검색된 장소</h2>
		                        <h3 align="center"><%= message %></h3>
		                    </div>
		                </div>
	            </div>
          
				<div class="tab-content">
				    <div class="tab-pane active" id="tabs-1" role="tabpanel">
				        <div class="row nice-scroll">
				        <%if (searchPlace != null && !searchPlace.isEmpty()) {%>
                      	<%for(Place p : searchPlace) {%>
                        	<div class="col-lg-4 col-md-6" >
								<div class="listing__item">
									<input type="hidden" id="placeNo" value="<%=p.getPlaceNo() %>">
					    			<div class="listing__item__pic set-bg" data-setbg="<%=contextPath %>/resources/place_upFiles/<%=p.getTitleImg()%>">
					        		<img src="resources/img/listing/list_icon-1.png" alt="">
					        			<div class="listing__item__pic__tag">NO. <%=p.getPlaceNo() %></div>
					        			<div class="listing__item__pic__btns">
					        			</div>
					    			</div>
									<div class="listing__item__text">
									    <div class="listing__item__text__inside">
									        <h5><%=p.getPlaceTitle() %></h5>
									        <p><%=p.getDescription() %></p>
									        <div class="listing__item__text__rating">
									            <div class="listing__item__rating__star">
									                <span class="icon_star"></span>
									                <span class="icon_star"></span>
									                <span class="icon_star"></span>
									                <span class="icon_star"></span>
									                <span class="icon_star-half_alt"></span>
									            </div>
									            <h6><%=p.getPrice()%> 원</h6>
									        </div>
									        <ul>
									            <li><span class="icon_pin_alt"></span> <%=p.getAddress() %></li>
									            <li><span class="icon_phone"></span> <%=p.getPlacePhone() %></li>
									        </ul>
									    </div>
									    <div class="listing__item__text__info">
									        <div class="listing__item__text__info__left">
									            <img src="resources/img/listing/list_small_icon-1.png" alt="">
									            <span>
									            <%
									            	String categoryName="";
													if(p.getCategoryNo()==1)
														categoryName="먹기";
													if(p.getCategoryNo()==2)
														categoryName="마시기";
													if(p.getCategoryNo()==3)
														categoryName="놀기";											
												%>
												<%= categoryName %>
									            </span>
									        </div>
									        <div class="listing__item__text__info__right">Open Now</div>
									    </div>
									</div>
								</div>
							</div><!--<div class="col-lg-4 col-md-6">  -->
							<%} %>
						<%} %>
						</div>
					</div>
				</div>
			</div>
			<script>
			$(function(){
				$(".listing__item__pic").click(function(){
					
					var parent = $(this).parent(); 
					var pNo = parent.children("#placeNo").val();
					location.href='<%=contextPath%>/detail.pl?pNo='+pNo;
				});
			});
			</script>
		</section>            
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