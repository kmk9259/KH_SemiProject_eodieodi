<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex, nofollow">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>어디어디 - 회원가입</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap" rel="stylesheet">

       
       
    <!-- login Section -->
    <!-- 첫 번째 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/myInfo.css" type="text/css">

    <!--JS-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    
    
    <!-- Bootstrap CSS / form -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.css"/>

    <!-- 자세히 보기 -->
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <!-- dropdown -->
    <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
        });
    </script>
    
    <style type="text/css">
	    .modal.fade.in {
	    		top: 31%;
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
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
        <section class="hero set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/ryoji-iwata-GkkYgVZT96A-unsplash.jpg" style="max-width: 100%;">
             <!-- <section class="hero set-bg" data-setbg="img/jaemin-don-DBaVQ2rALYU-unsplash.jpg" style="max-width: 100%;">-->
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


    <!-- login -->
    <!------ Include the above in your HEAD tag ---------->
    <section class="page-start">
        <section class="login">
            <div class="container">
                <div class="sidenav">
                    <div class="login-main-text">
                        <h2 style="color: #D34B32 !important">Eodi Eodi<br> SignUp Page</h2>
                        <p>SignUp from here to access.</p>
                    </div>
                </div>
                <!------ Include signupform ---------->
                <%-- <script src="<%= contextPath %>/directing-master/js/includeHTML.js"></script> --%>
                <div id="success">
                
                <body class="testbody">
    <div class="container">
        <!------------------------ step ----------------------------------------->
        <div class="cover">
          <div class="stepwizard">
              <div class="stepwizard-row setup-panel">
                  <div class="stepwizard-step">
                      <a href="#step-1" type="button" class="btn btn-info btn-circle">1</a>
                      <p>Step 1</p>
                  </div>
                  <div class="stepwizard-step">
                      <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                      <p>Step 2</p>
                  </div>
                  <div class="stepwizard-step">
                      <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                      <p>Step 3</p>
                  </div>
              </div>
          </div>
        </div>


        <!------------------------ step 1 ----------------------------------------->
        <form role="form" method="get" id="form1">
        
        
            <div class="row setup-content" id="step-1">
                <div class="col-xs-12">
                    <div class="col-md-12">
                        <h2 class="tt">어디어디 회원가입<br>서비스 약관 동의</h2>
                        <br><br>
                        <div class="container">
                            <div class="row" style="display: contents;">
                            <div class="checkbox_group">
                                <div class="col-md-4 mycustom" style="width: 80%;">
                                
   										
   										
                                      <div class="thumbnail">
                                          <div class="caption">
                                            <input type="checkbox" name="c1" id="c1" style="float: left;"/>
                                            <h5 class="tname">[필수] 어디어디 이용 약관</h5>
                                            <button type="button" class="btn btn-info more" data-toggle="modal" data-target="#no1">
                                              	자세히 보기
                                            </button>
                                          </div>
                                      </div>
                                      <div class="thumbnail">
                                          <div class="caption">                                            
                                            <input type="checkbox" name="c2" id="c2" style="float: left;"/>
                                            
                                            <h5 class="tname">[필수] 서비스 이용약관</h5>
                                            <button type="button" class="btn btn-info more" data-toggle="modal" data-target="#no2">
                                              	자세히 보기
                                            </button>
                                          </div>
                                      </div>
                                      <div class="thumbnail">
                                          <div class="caption">                                             
                                            <input type="checkbox" name="c3" id="c3" style="float: left;"/>
                                            
                                            <h5 class="tname">[필수] 개인정보 수집 및 이용 동의</h5>
                                            <button type="button" class="btn btn-info more" data-toggle="modal" data-target="#no3">
                                              	자세히 보기
                                            </button>
                                          </div>
                                      </div>
                                      <hr/>
   										<input type="checkbox" name="all" id="all" style="margin-left: 5%; margin-right:2%; float: left;">
                                		<h5>[필수] 어디어디 이용 약관, 서비스 이용 약관, 개인정보 수집 및 이용에 모두 동의합니다.</h5>
 										<br>
                                  </div>
                              </div>
                            </div>
                        </div>
                        <div class="modal fade product_view" id="no1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title">어디어디 이용 약관</h3>
                                        <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row" style="display: contents;">
                                            <div class="col-md-6 product_content">
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                                <div class="space-ten"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade product_view" id="no2">
                          <div class="modal-dialog">
                              <div class="modal-content">
                                  <div class="modal-header">
                                      <h3 class="modal-title">서비스 이용 약관</h3>
                                      <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                                  </div>
                                  <div class="modal-body">
                                      <div class="row" style="display: contents;">
                                          <div class="col-md-6 product_content">
                                              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                              <div class="space-ten"></div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                        </div>
                      <div class="modal fade product_view" id="no3">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title">개인정보 수집 및 이용 동의</h3>
                                    <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="display: contents;">
                                        <div class="col-md-6 product_content">
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                            <div class="space-ten"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>

                    <br><br><br><br>
                        <div style="margin-right:37%; margin-top:35%;">
                        	<button id="btnNext" disabled="disabled" class="nextBtn btn-ms pull-right" type="button" style="height: 50px; width: 300px;"><h4 style="color: #fff;">다음</h4></button>
                        <br><br>
                        <br><br>
                        </div>
                  </div>
            </div>
        </form>
        
        <script type="text/javascript">
        var doc = document; 
        var form1 = doc.getElementById('form1'); 
        var inputs = form1.getElementsByTagName('INPUT'); 
        var form1_data = {
         "c1": false,  //전체 선택
         "c2": false,  //필수 선택 1
         "c3": false   //필수 선택 2
        }; 
       
        var c1 = doc.getElementById('c1'); 
        var c2 = doc.getElementById('c2'); 
        var c3 = doc.getElementById('c3'); 
       
        function checkboxListener() {
         form1_data[this.name] = this.checked; //각각 자신의 checkBox를 Checked 상태로 바꿈 
        }
       
       
         c1.onclick = c2.onclick = c3.onclick = checkboxListener;   //c1, C2, C3를 checkBoxListenner를 호출하여
                                                                         //Checked로 바꿈
         var all = doc.getElementById('all');  //전체 체크를 위한 체크박스 선언
       
         all.onclick = function() {  //전체 체크를 누를 시
          if (this.checked) {
           setCheckbox(form1_data, true);   //form1_data(c1,c2,c3)의 값을 모두 Checked로 바꿈
			$("#btnNext").prop("disabled", false);	//활성화
          } else {
           setCheckbox(form1_data, false);  ////form1_data(c1,c2,c3)의 값을 모두 no checked로 바꿈
				$("#btnNext").prop("disabled", true);	//활성화
          }
         }; 
       
         function setCheckbox(obj, state) { //checkbox상태 변경하는 함수
          for (var x in obj) {
           obj[x] = state; 
       
           for(var i = 0; i < inputs.length; i++) {
            if(inputs[i].type == "checkbox") {
             inputs[i].checked = state; 
            }
           }
       
          }
         }

        </script>

        <!------------------------ step 2 ----------------------------------------->
        <div class="row setup-content" id="step-2">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h2 style="text-align: center;">정보 입력</h2>
                    <br><br>
                    <form id="enrollForm" action="<%=request.getContextPath() %>/insert.me" method="post" onsubmit="return joinValidate();">
                      <div class="form-group">
                              <label class="control-label">아이디</label><br>
                              <input style=" width: 80%; float: left;" maxlength="100"
                              	 type="text" required="required" name="userId" class="form-control" placeholder="아이디를 입력하세요"  />
							  <button style="display: inline-block; background-color: #D958A0; color:#fff; border:none; width:200px; height:48px; border-radius: 5px;" type="button" name="idCheckBtn" id="idCheckBtn" onclick="checkId();">중복확인</button>
                          <!-- </div>
                          <div class="form-group"> -->
                          <br><br>
                            <label class="control-label">비밀번호</label>
                            <input maxlength="100" type="password" required="required" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요" />
                            <label class="control-label">비밀번호 확인</label>
                            <input maxlength="100" type="password" required="required" name="checkPwd" class="form-control" placeholder="비밀번호를 입력해주세요" />

                            
                            <label class="control-label">이름</label>
                            <input maxlength="100" type="text" required="required" name="userName" class="form-control" placeholder="이름을 입력해주세요" />
                            
                            <label class="control-label">전화번호</label>
                            <input maxlength="100" type="tel" required="required" name="phone" class="form-control" placeholder="전화번호를 입력해주세요(010-XXXX-XXXX)" />
                            
                            <label class="control-label">이메일</label>
                            <input maxlength="100" type="email" required="required" name="email" class="form-control" placeholder="이메일을 입력해주세요(hongil@naver.com)" />
                            
                            <label class="control-label">성별</label><br>
                            <input type="radio" id="gender" name="gender" value="F" checked="checked" style="margin-left:5%;" /> <span class="up" style="margin-right: 10%;">여자</span>
                            <input type="radio" id="gender" name="gender" value="M" /> <span class="up">남자</span>
                            <br><br>
                      </div>
                      <div style="margin-bottom:10%;">
                      	<button class="prevBtn btn-ms pull-left" type="button" style="height: 50px; width: 300px;"><h5 style="color: #fff;">이전</h5></button>
                      	<button class="nextBtn btn-ms pull-right" type="submit" id="joinBtn" style="height: 50px; width: 300px;"><h5 style="color: #fff;">다음</h5></button>
                      </div>
                    </form>
                </div>
            </div>
        </div>
        <!------------------------ step 3 ----------------------------------------->
        <div class="row setup-content" id="step-3">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h2 style="text-align: center;">회원가입 완료!</h2><br>
                    <h4 style="text-align: center;">로그인 화면으로 이동합니다</h4>
                    <br><br><br><br><br><br><br><br>
                      <div style="margin-bottom:30%;">
                    	<center><button class="btn-success finish btn-lg" type="button" style="width: 300px;">확인</button></center>
                      </div>
                </div>
            </div>
        </div>
    </div>
                
                
                </div>
            </div>
        </section>
    </section>


<script>
	   function main(){
		   location.href = "<%= request.getContextPath()%>";
	   }
	function joinValidate(){
		
		if(!(/^[a-z][a-z\d]{3,11}$/i.test($("#enrollForm input[name=userId]").val()))){
			$("#enrollForm input[name=userId]").focus();
	        return false;
		}
		
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;			
		}
		
		 if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
			 $("#enrollForm input[name=userName]").focus();
	        return false;
		 }
		 
		 return true;
		
		
	}
	
	function checkId(){
		var userId = $("#enrollForm input[name=userId]");
		if(userId.val()==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url : "idCheck.me",
			type : "post",
			data : {userId : userId.val()},
			success : function(result){
				if(result == "fail"){
					alert("사용할 수 없는 아이디 입니다.");
					userId.focus();
				}else{
					if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
						userId.attr("readonly", "true");
						$("#joinBtn").removeAttr("disabled");
					}else{
						userId.focus();
					}
				}
			},
			error:function(){
				console.log("서버통신실패");
			}
		})
		
	}
	
	</script>


<!-- form js -->

<script type="text/javascript">
	$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');
            var allPrevBtn = $('.prevBtn');
            var allFinBtn = $('.finish');
            var allBody = $('.testbody');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-info').addClass('btn-default');
            $item.addClass('btn-info');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allFinBtn.click(function(){
        // allBody.empty();
        // if(allBody.empty()){
        parent.location.href = '<%= request.getContextPath() %>/views/member/login.jsp';
        }
    );

    
    allPrevBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
        curStepBtn = curStep.attr("id"),
        prevStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a");
        prevStepWizard.removeAttr('disabled').trigger('click');
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        
        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
        
    });

    $('div.setup-panel div a.btn-info').trigger('click');
    ;})
	</script>

    <%@ include file="../common/footer.jsp"%>
    
    <!-- Js Plugins -->
    <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>