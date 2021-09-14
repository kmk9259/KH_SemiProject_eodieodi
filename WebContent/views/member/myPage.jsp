<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.board.model.vo.*"%>
    
<%
	Member m = (Member)request.getAttribute("loginUser");

	String userId = m.getUserId();
	String userPwd = m.getUserPwd();
	String userName = m.getUserName();
	String originPwd = (String)session.getAttribute("originPwd");
	
	String phone = m.getPhone() != null? m.getPhone() : "";
	String email = m.getEmail() != null? m.getEmail() : "";

	ArrayList<Board> list  = (ArrayList<Board>)request.getAttribute("list");

   	Board bo = (Board)request.getAttribute("bo");
   	//String writer = b.getBoardWriter();

   	Board bp = (Board)request.getAttribute("b");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디 - 마이페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"> -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/myInfo.css" type="text/css">
       

    <!-- login Section -->
    <!-- 첫 번째 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    <!-- mypageSIDEBAR -->
    <!-- <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->

    <!------ pwUp ---------->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet"
        id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <!------ myPost ---------->
    <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"
        id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

<%@ include file="../common/menubar.jsp"%>
   

    <!-- Hero Section Begin -->
    <section class="hero set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/pascal-riben-YfZZvPaR9hY-unsplash.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title">
                            <h2>어디어디?!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->


    <!-- mypage -->
    <section class="page-start">
        <section class="login">
            <div class="container">
                <div class="sidenav">
                    <div class="login-main-text">
                        <h2 style="color: #D34B32 !important">Eodi Eodi<br> My Page</h2>
                        <p>Welcome To MyPage</p>
                    </div>
                </div>	
                <!------ MENUSIDE BAR ---------->
                <div class="container menuBar">
                    <div class="col-sm-2">
                        <nav class="nav-sidebar">
                            <ul class="nav tabs">
                                <li class="active menuB parent"><a href="#mInfo" data-toggle="tab">내 정보</a></li>
                                <li class="menuB "><a href="#mInfoUp" data-toggle="tab">내 정보 수정</a></li>
                                <li class="menuB"><a href="#pwUp" data-toggle="tab">비밀번호 변경</a></li>
                                <li class="menuB parent"><a href="<%=contextPath %>/list.bo">커뮤니티</a></li>
                                <li class="menuB"><a href="#myPost" data-toggle="tab">내가 쓴 글</a></li>
                                <li class="menuB parent"><a href="<%=contextPath %>/list.ps">일정 보관함</a></li>
                                <li class="menuB parent"><a href="#wd" data-toggle="tab">회원 탈퇴</a></li>
                            </ul>
                        </nav>
                    </div>

                </div>
                
                
                <!-- 화면단 -->
                <div class="container-showpage">
                    <!-- tab content -->
                    <div class="tab-content">
                    
                        <!-- 내 정보 -->
                        <div class="tab-pane active text-style" id="mInfo">
                            <h2 class="tInfo">내 정보</h2>
                            <br><br>
                            <br><br>
                            
                            	<label style="width: 80px; margin-left: 10%;"><h5>아이디</h5></label>
                            	<input class="conInfo" value="<%= userId %>" readonly="readonly"
                            	 style=" height: 50px; width: 400px; text-align: center; background-color: #fff;"><br><br><br>
                            	 
                            	<label style="width: 80px; margin-left: 10%;"><h5>이름</h5></label>
                            	<input class="conInfo" value="<%= userName %>" readonly="readonly"
                            	 style=" height: 50px; width: 400px; text-align: center; background-color: #fff;"><br><br><br>
                            	 
                            	<label style="width: 80px; margin-left: 10%;"><h5>전화번호</h5></label>
                            	<input class="conInfo" value="<%= phone %>" readonly="readonly"
                            	 style=" height: 50px; width: 400px; text-align: center; background-color: #fff;"><br><br><br>
                            	 
                            	<label style="width: 80px; margin-left: 10%;"><h5>이메일</h5></label>
                            	<input class="conInfo" value="<%= email %>" readonly="readonly"
                            	 style=" height: 50px; width: 400px; text-align: center; background-color: #fff;"><br><br><br>
                        </div>

                        <!-- 내 정보 수정 -->
                        <div class="tab-pane text-style" id="mInfoUp">
                            <h2 class="tInfo">정보 수정</h2>
                            <br>
                            <form id="updateForm" action="<%=request.getContextPath() %>/update.me" method="post">
                                <div class="form-group infoUp">
                                	<label hidden="hidden" class="control-label">아이디</label>
                                    <input hidden="hidden" maxlength="30" type="text" required="required" class="form-control"
                                    	name="userId"
                                        value="<%= userId %>" readonly />
                                
                                
                                    <label class="control-label">변경할 이름을 입력해주세요</label>
                                    <input maxlength="7" type="text" required="required" class="form-control"
                                    	name="userName"
                                        value="<%= userName %>" />
                                        
                                    <label class="control-label">변경할 전화번호를 입력해주세요(010-XXXX-XXXX)</label>
                                    <input maxlength="100" type="text" required="required"
                                     	id="phone" name="phone"class="form-control"
                                        value="<%= phone %>" /><br>
                                        
                                    <label hidden="hidden" class="control-label">이메일</label><br>
                                    <input hidden="hidden" maxlength="100" type="text" required="required" class="form-control"
                                    	name="email" readonly="readonly"
                                        value="<%= email %>" /><br>
                                        <br><br>
								   <!-- <input style="float: right; background-color: #D958A0; color:#fff;
								   border:none; width:110px; height:48px; border-radius: 5px; margin-top : -21px; color:#fff;"
								    type="button" id="emailCheckBtn" onclick="emailChk();" value="이메일인증"/><br><br>
								    
								   </button>
                                   <label class="control-label">인증확인</label><br>
                                    <input maxlength="100" type="text" required="required" class="form-control"
                                    	name = "email_chk_result"
                                        placeholder="인증번호를 입력해주세요 "style=" width: 80%; float: left;" disabled="disabled"/>
                                        <br>
                                        
                                         <button style="float: right; background-color: #D958A0; color:#fff;
										   border:none; width:100px; height:48px; border-radius: 5px; margin-top : -21px;"
										   name = "email_chk"
								    		type="button" id="checkMail" onclick="checkMail();" disabled="disabled"><h6 style="color:#fff;">인증하기</h6></button><br><br>
								     -->
								    
                                    <center><button type="submit" style=" background-color: #D958A0; color:#fff;
							   				border:none; width:100px; height:48px; border-radius: 5px; "
                                    		 id="updateBtn" onclick="saveMyInfo();">저장하기</button></center>
                                    <br><br>
                                    
                                </div>
                            </form>
                        </div>

						<script>
							function saveMyInfo(){
									var userName = $("input[name='userName']");
									var userNameV = userName.val();
									var expUserName = /^[가-힣]{2,}$/
									var phone = $("input[name='phone']");
									var email = $("input[name='email']");
									//var emailV = email.val();
									//var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

											if(userName.val() == ""){
												if(confirm("이름을 입력해주세요.") == true){
													userName.val('');
													userName.focus();
													return false;
												}
												//alert("이름을 입력해주세요.");
											}else if(expUserName.test(userNameV)==false){
												if(confirm("한글로 2자 이상의 이름을 입력해주세요.") == true){
													userName.val('');
													userName.focus();
													return false;
												}
											}else if(phone.val() == ""){
												if(confirm("전화번호를 입력해주세요.") == true){
													phone.val('');
													phone.focus();
													return false;
												}
												//alert("전화번호를 입력해주세요.");
											}else if(phone.val().length != 13 || phone.val().length < 13 || phone.val().length >= 14 ){
												if(confirm("올바른 형식의 전화번호를 입력해주세요. \n ex) 010-XXXX-XXXX") == true){
													phone.val('');
													phone.focus();
													return false;
												}
											}else if(userName.val() == "" || phone.val() == "" || email.val() == ""){
												return false;
											}
											
											$("#updateForm").submit();
											
							}
						

						$('#phone').keydown(function(event) {
						    var key = event.charCode || event.keyCode || 0;
						    $text = $(this);
						    if (key !== 8 && key !== 9) {
						        if ($text.val().length === 3) {
						            $text.val($text.val() + '-');
						        }
						        if ($text.val().length === 8) {
						            $text.val($text.val() + '-');
						        }
						    }
						 
						    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
						});
						</script>



						<!-- 비밀번호 변경 -->
                        <div class="tab-pane text-style" id="pwUp">
                            <h2 class="tInfo">비밀번호 변경</h2>
                                		 <input type="hidden" id="nowPwd" name="nowPwd" value="<%= userPwd %>">
                            <br><br>
                            <div class="col-sm-6 col-sm-offset-3">
                                <form  id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwd.me" method="post">
                                		<label>현재 비밀번호</label>
											<input maxlength="100" type="password" class="input-lg form-control" name="userPwd" id="userPwd" placeholder = "현재 비밀번호를 입력하세요" required><br>
				                                    <span id="chUserPw" class="glyphicon glyphicon-remove" style="float: right;"> 현재 비밀번호와 일치</span><br>
                                
                                    	<label>변경할 비밀번호 </label>
                                    		<input maxlength="100" type="password" class="input-lg form-control" name="newPwd" id="newPwd"
                                        				placeholder="변경할 비밀번호를 입력하세요" autocomplete="off" required>
				                                    <span id="6char" class="glyphicon glyphicon-remove" style="float: right;"> 6자리 이상</span><br>
				                                   
                                    
                                    
                                    <div class="row">
                                        <div class="col-sm-12">
                                        	<label>변경할 비밀번호 확인</label>
                                        	<input maxlength="100" type="password" class="input-lg form-control" name="checkPwd" id="checkPwd"
                                        		placeholder="한 번 더 입력하세요" autocomplete="off" required>
                                            <span span id="pwmatch" class="glyphicon glyphicon-remove" style="float: right;">비밀번호 일치</span>
                                        </div>
                                    </div>
                                    
                                    <br><br>
                                    
                                    <input type="submit" class="col-xs-12 btn-lg"
                                    style="background-color: #D958A0; color:#fff; border:none; margin-left: 25%;"
                                        data-loading-text="비밀번호 변경하기" value="비밀번호 변경하기 " onclick="fnCheckPwd()">
                                </form>
                            </div>
                        </div>

						<!-- 내가 쓴 글 -->
                        <div class="tab-pane text-style nice-scroll" id="myPost">
                            <h2 class="tInfo">내가 쓴 글</h2>
							<br><br>
                            <div id="listArea" class="span5" style="padding-left: 5%; width: 90%; height: 510px;">
                                <table class="table table-striped table-condensed" style="text-align: center; table-layout: fixed;">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">제목</th>
                                            <th style="text-align: center;">내용</th>
                                            <th style="text-align: center;">조회수</th>
                                            <th style="text-align: center;">수정</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   
                                    <!--위에서 받아온 리스트가 비어있으면 이걸 띄워주고   -->
                                        <% if(list.isEmpty()){ %>
                                        <tr>
											<td colspan="7"><center>존재하는 게시글이 없습니다.</center></td>
										</tr>
															
										<!--  아니면 엘스로 해서 하나씩 띄워준다 -->
											<% }else{  %>
												 <%for(int i = 0; i < list.size(); i++){ %>
												 <% } %>
												
												<% for(Board b : list){ 
												%>
			                                       <tr onmouseover="this.style.background='#e4a6c8'" onmouseout="this.style.background='none'">
			                                          <td hidden="hidden"><a style="color: #545554;"><%= b.getBoardNo() %></a></td>
			                                          <td class="showPost" style="background: none !important; text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="<%= b.getBoardTitle() %>" name = "myPost"><a style="color: #545554;"><%= b.getBoardTitle() %></a></td>
			                                          <td class="showPost" style="background: none !important; text-align: center; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="<%= b.getBoardContent() %>"><a style="color: #545554;"><%= b.getBoardContent() %></a></td>
			                                          <td class="showPost" style="background: none !important; text-align: center;"><a style="color: #545554;"><%= b.getCount() %></a></td>
			                                          <td style="background: none !important; text-align: center;"><button type="button" id="updateBoard" class="site-btn" value="<%= b.getBoardNo() %>">수정</button></td>
			                                       </tr>
			                                       
												<% } %>  
						 					<% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        
                        <script>
                        var button = $("#listArea>table>tbody>tr>td>button");
                        var ptr = $("#listArea>table>tbody>tr");
                        if(button.click){
                        	button.click(function(){
                        		$(ptr).off("click").on('click', function() {})
								var bno = $(this).eq(0).val();
						        var url2="<%=contextPath%>/updateForm.bo?bno="+bno; 
						        window.open(url2);
						        location.href="<%=contextPath%>/mypage.me";
							})
							
                        }
                        
                        if(ptr.click){
                        	ptr.click(function(){
                        		$(ptr).on('click', function() {
    						        var bno = $(this).children().eq(0).text();
    						        var url="<%=contextPath%>/detail.bo?bno="+bno;
    						        window.open(url);

    						        location.href="<%=contextPath%>/mypage.me";
                        		})
					        })
                        }
                        
                        <%-- 
                        $(function () {
							button.click(function(){
								var bno = $(this).eq(0).val();
						        var url2="<%=contextPath%>/updateForm.bo?bno="+bno; 
						        window.open(url2);
							})
						});
                        
                        $(function(){
					        ptr.click(function(){
						        var bno = $(this).children().eq(0).text();
						        var url="<%=contextPath%>/detail.bo?bno="+bno;
						        window.open(url);
					        })
				        })
					                            		
						$(function () {
							$("#tb").niceScroll();
						});
                        --%>		                  
					        
						</script>
                        
                        <!-- 회원탈퇴 -->
                        <div class="tab-pane text-style" id="wd">
                            <h2 class="tInfo">회원 탈퇴</h2>
                            <br><br><br><br>
                            <div class="col-sm-6 col-sm-offset-3">
                                <form method="post" id="deleteForm" action="<%= request.getContextPath() %>/delete.me">
                                		 <input type="hidden" id="userId" name="userId" value="<%= userId %>">
                                		 
                                		  <br><br>
                                    <input type="password" class="input-lg form-control" name="deleteUser" id="deleteUser"
                                        placeholder="현재 비밀번호를 입력하세요" autocomplete="off" required="required">
                                        <br><br>
                                    <button type="submit" class="btn-load btn-lg" style="background-color: #D958A0; color:#fff; border:none; margin-left: 30%;" onclick="deleteMember()">탈퇴하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

    </section>
    
    <!-- Footer Section Begin -->
    <%@ include file="../common/footer.jsp"%>
    <!-- Footer Section End -->


    <!-- Header -->
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



    <!-- pwUp -->
    <script>
    function fnCheckPwd(){
		var nowPwd = $("input[name='nowPwd']");
		var userPwd = $("input[name='userPwd']");
		var expPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
		var newPwd = $("input[name='newPwd']");
		var newPwdV = newPwd.val();
		var checkPwd = $("input[name='checkPwd']");
		
		
		if(userPwd.val().trim() == "" || newPwd.val().trim() == "" || checkPwd.val().trim() == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}

		if(nowPwd.val() != userPwd.val()){
			alert("현재 비밀번호가 다릅니다");
			userPwd.val('');
			userPwd.focus();
			return false;
		}else if(expPwd.test(newPwdV)==false){
			if(confirm("영문자, 숫자, 특수문자(@$!%*#?&)를 모두 포함하는 \n 6자리 이상의 비밀번호를 적어주세요.") == true){
				newPwd.val('');
				newPwd.focus();
				return false;
			}
		}else if(newPwd.val() == userPwd.val()){
			alert("변경할 비밀번호는 현재 비밀번호와 일치하지 않아야 합니다.");
			newPwd.val('');
			checkPwd.val('');
			newPwd.focus();
			return false;
		}else if(newPwd.val().length < 6){
			alert("비밀번호는 6자 이상 입력해주세요.");
			newPwd.val('');
			newPwd.focus();
			return false;
		}else if(newPwd.val() != checkPwd.val()){
			alert("비밀번호가 다릅니다");
			checkPwd.val('');
			checkPwd.focus();
			return false;
		}
		
		$("#updatePwdForm").submit();
		alert("비밀번호가 성공적으로 변경되었습니다.");
	}
        $("input[type=password]").keyup(function () {

        	if ($("#nowPwd").val() == $("#userPwd").val()) {
                $("#chUserPw").removeClass("glyphicon-remove");
                $("#chUserPw").addClass("glyphicon-ok");
                $("#chUserPw").css("color", "#00A41E");
            } else {
                $("#chUserPw").removeClass("glyphicon-ok");
                $("#chUserPw").addClass("glyphicon-remove");
                $("#chUserPw").css("color", "#FF0004");
            }
        	
            if ($("#newPwd").val().length >= 6) {
                $("#6char").removeClass("glyphicon-remove");
                $("#6char").addClass("glyphicon-ok");
                $("#6char").css("color", "#00A41E");
            } else {
                $("#6char").removeClass("glyphicon-ok");
                $("#6char").addClass("glyphicon-remove");
                $("#6char").css("color", "#FF0004");
            }

            if ($("#newPwd").val() == $("#checkPwd").val()) {
                $("#pwmatch").removeClass("glyphicon-remove");
                $("#pwmatch").addClass("glyphicon-ok");
                $("#pwmatch").css("color", "#00A41E");
            } else {
                $("#pwmatch").removeClass("glyphicon-ok");
                $("#pwmatch").addClass("glyphicon-remove");
                $("#pwmatch").css("color", "#FF0004");
            }
        });
    </script>
    <script>

	
		function deleteMember(){
			var deleteU = $("#deleteUser");
			if("<%= userPwd %>" == deleteU.val()){
				var val = confirm("탈퇴를 진행하면 회원님과 관련된 모든 정보가 사라집니다. \n정말로 탈퇴하시겠습니까?");
				
				if(val){
					$("#updateForm").submit();
				}else if(!val){
					alert("취소하였습니다");
					deleteU.val('');
					deleteU.focus();
					return false;
				}
				
			}else if($("#deleteUser").val() == ""){
				alert("비밀번호를 입력해주세요.");
			}else{
				alert("비밀번호를 잘못입력하였습니다.");
				deleteU.val('');
				deleteU.focus();
				return false;
			}
			
		}

	</script>
    <!-- Js Plugins -->
    <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>

</html>