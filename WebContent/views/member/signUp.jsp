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
                
               <!-- <body class="testbody">-->
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
                                                            <p>
									                                                   제1조(목적)<br>
									                                                   본 회원약관은 어디어디(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.<br><br>
									                                                   
									                                                   제2조 (약관의 효력)<br>
									                                                   1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.<br>
									                                                   2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br>
									                                                   3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.<br><br>
									                                                   
									                                                   제3조 (약관 이외의 준칙)<br>
									                                                   이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.<br><br>
									                                                   
									                                                   제4조 (이용계약의 체결)<br>
									                                                   회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.
                                                            
                                                            </p>
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
                                                          <p>
								                                                   제1조 (회원가입)<br>
								            
								                                                   ① 이용자는 "어디어디"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
								                                                   
								                                                   ② "어디어디"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<br>
								                                                   - 타인 명의의 신청<br>
								                                                   - 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
								                                                   - 기타 회원으로 등록하는 것이 "어디어디"의 기술상 현저히 지장이 있다고 판단되는 경우<br>
								                                                   - 이용 신청 고객의 귀책사유로 이용승낙이 곤란한 경우<br>
								                                                   ③ 회원가입계약의 성립시기는 "어디어디"의 승낙이 회원에게 도달한 시점으로 합니다.<br>
								                                                   
								                                                   ④ 회원은 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "어디어디"에 대하여 그 변경사항을 알려야 합니다.<br><br>
								                                                   
								                                                   
								                                                   제2조 (회원 탈퇴 및 자격 상실 등)<br>
								                                                   
								                                                   ① 회원은 "어디어디"에 언제든지 탈퇴를 요청할 수 있으며 "어디어디"는 즉시 회원탈퇴를 처리합니다.<br>
								                                                   
								                                                   ② 회원이 다음 각호의 사유에 해당하는 경우, "어디어디"는 회원자격을 제한 및 정지시킬 수 있습니다.<br>
								                                                   - 가입 신청 시에 허위 내용을 등록한 경우<br>
								                                                   - "어디어디"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>
								                                                   ③ "어디어디"가 회원자격을 상실시키는 경우에는 7일간의 소명 기회를 드립니다. 본인의 의도와 상관없이 회원 정보가 삭제되는 것을 방지하기 위한 조치 이므로 해당 기간 안에 관련 사항에 대한 의견을 "어디어디"에 개진하고 소명의지가 없거나 소명 기회를 무시하였을 경우에는 회원등록을 말소합니다.<br><br>                                       
								                                                   제3조 (회원에 대한 통지)<br>
								                                                   
								                                                   ① "어디어디"가 회원에 대한 통지를 하는 경우, 회원이 "어디어디"와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
								                                                            
                                                            </p>
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
                                                        <p>
		                                                                                         제1조 (개인정보보호)<br>
		            
		                                                   1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다. <br>
		                                                   
		                                                   2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나  제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로 합니다. <br>
		                                                    ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우  <br>
		                                                    ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우<br>
		                                                    ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우<br>
		                                                    ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br>
		                                                   
		                                                   3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.
		            
		                                                            
                                                            </p>
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
                     $("#btnNext").prop("disabled", false);   //비활성화
                      } else {
                       setCheckbox(form1_data, false);  ////form1_data(c1,c2,c3)의 값을 모두 no checked로 바꿈
                        $("#btnNext").prop("disabled", true);   //활성화
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
                                <form id="enrollForm" action="<%=request.getContextPath() %>/insert.me" method="post">
                                  <div class="form-group">
                                          <label class="control-label">아이디</label><br>
                                          <input style=" width: 80%; float: left;" maxlength="30"
                                              type="text" required="required" name="userId" class="form-control" placeholder="아이디를 입력하세요"  />
                                   <button style="display: inline-block; background-color: #D958A0; color:#fff; border:none; width:200px; height:48px; border-radius: 5px;"
                                    type="button" name="idCheckBtn" id="idCheckBtn" onclick="checkId();">중복확인</button>
                                      <!-- </div>
                                      <div class="form-group"> -->
                                      <br><br>
                                        <label class="control-label">비밀번호 (영문, 숫자, 특수문자(@$!%*#?&)를 모두 포함하는 6자 이상의 비밀번호)</label>
                                        <input maxlength="100" type="password" required="required" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요" />
                                        <label class="control-label">비밀번호 확인</label><label id = "pwdResult"></label>
                                        <input maxlength="100" type="password" required="required" name="checkPwd" class="form-control" placeholder="비밀번호를 입력해주세요" />
            
                                        
                                        <label class="control-label">이름</label>
                                        <input maxlength="7" type="text" required="required" name="userName" class="form-control" placeholder="이름을 입력해주세요" />
                                        
                                        <label class="control-label">전화번호</label>
                                        <input maxlength="100" type="text" required="required" id="phone" name="phone" class="form-control" placeholder="전화번호를 입력해주세요(010-XXXX-XXXX)" /><br>
                                        
                                        <label class="control-label">이메일</label><br>
                                        <input maxlength="100" style=" width: 80%; float: left;" type="text" required="required" name="email" class="form-control" placeholder="이메일을 입력해주세요(hongil@naver.com)" />
                                        <input style="float: right; background-color: #D958A0; color:#fff; border:none; width:200px; height:48px; border-radius: 5px; color:#fff;"
                                     type="button" id="emailCheckBtn" onclick="emailChk();" value="이메일인증"/><br><br><br>
                            
                                        
                                        <label class="control-label">성별</label><br>
                                        <input type="radio" id="gender1" name="gender" value="F" checked="checked" style="margin-left:5%;" /> <span class="up" style="margin-right: 10%;">여자</span>
                                        <input type="radio" id="gender2" name="gender" value="M" /> <span class="up">남자</span>
                                        <br><br>
                                  </div>
                                  <div style="margin-bottom:10%;">
                                     <button class="prevBtn btn-ms pull-left" type="button" style="height: 50px; width: 300px;"><h5 style="color: #fff;">이전</h5></button>
                                     <button class="nextBtn btn-ms pull-right" type="submit" id="joinBtn" style="height: 50px; width: 300px;" onclick="joinValidate();"><h5 style="color: #fff;">다음</h5></button>
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



var count = 0;
var emailcount = 0;
   function joinValidate(){
         var userId = $("input[name='userId']");
         var userIdV = userId.val();
         var expId = /^[0-9a-z]+$/;
         var userPwd = $("input[name='userPwd']");
         var userPwdV = userPwd.val();
         var expPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
         var checkPwd = $("input[name='checkPwd']");
         var userName = $("input[name='userName']");
         var userNameV = userName.val();
         var expUserName = /^[가-힣]{2,}$/
         var phone = $("input[name='phone']");
         var email = $("input[name='email']");
         var emailV = email.val();
         var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
         
               if(userId.val() == ""){
                  if(confirm("아이디를 입력해주세요.") == true){
                     userId.val('');
                     userId.focus();
                     return false;
                  }
               }else if(expId.test(userIdV)==false){
                  if(confirm("아이디에는 숫자, 영문만 입력 가능합니다.") == true){
                     userId.val('');
                     userId.focus();
                     return false;
                  }
               }else if( count <= 0 ) {
                  if(confirm("아이디 중복 체크를 해주세요") == true){
                     userId.val('');
                     userId.focus();
                     return false;
                  }
               }else if(userPwd.val() == ""){
                  if(confirm("비밀번호를 입력해주세요.") == true){
                     userPwd.val('');
                     userPwd.focus();
                     return false;
                  }
               }else if(expPwd.test(userPwdV)==false){
                  if(confirm("영문자, 숫자, 특수문자(@$!%*#?&)를 모두 포함하는 \n 6자리 이상 15자리 이하의 비밀번호를 적어주세요.") == true){
                     userPwd.val('');
                     userPwd.focus();
                     return false;
                  }
               }else if(userPwd.val().length < 6){
                  if(confirm("비밀번호는 6자 이상 입력해주세요.") == true){
                     userPwd.val('');
                     userPwd.focus();
                     return false;
                  }
               }else if(checkPwd.val() == ""){
                  if(confirm("비밀번호 확인을 입력해주세요.") == true){
                     checkPwd.val('');
                     checkPwd.focus();
                     return false;
                  }
               }else if(checkPwd.val() != userPwd.val()){
                  if(confirm("비밀번호가 다릅니다") == true){
                     checkPwd.val('');
                     checkPwd.focus();
                     return false;
                  }
               }else if(userName.val() == ""){
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
               }else if(email.val() == ""){
                  if(confirm("이메일을 입력해주세요.") == true){
                     email.val('');
                     email.focus();
                     return false;
                  }
               }else if(exptext.test(emailV)==false){
                  if(confirm("이메일 형식에 맞추어 입력해주세요.") == true){
                     email.val('');
                     email.focus();
                     return false;
                  }
               }else if( emailcount <= 0 ) {
                  if(confirm("이메일 인증을 해주세요.") == true){
                     email.val('');
                     email.focus();
                     return false;
                  }
               }else if( count <= 0 ) {
                  if(confirm("아이디 중복 체크를 해주세요") == true){
                     userId.val('');
                     userId.focus();
                     return false;
                  }
               }else if( emailcount <= 0 ) {
                  if(confirm("이메일 인증을 해주세요.") == true){
                     email.val('');
                     email.focus();
                     return false;
                  }
               }else if(userId.val() == "" || userPwd.val() == "" || userPwd.val().length < 6 || checkPwd.val() == "" || checkPwd.val() != userPwd.val() || userName.val() == "" || phone.val() == "" || email.val() == "" || exptext.test(emailV)==false || emailcount <= 0 || count <= 0){
                  return false;
               }
               
               $("#enrollForm").submit();
               
   }
   
   function checkId(){
      var userId = $("#enrollForm input[name=userId]");
      console.log(userId.val());
      if(userId.val()==""){
         alert("아이디를 입력해주세요.");
         return false;
      }
      
      $.ajax({
         url : "<%=request.getContextPath() %>/idCheck.me",
         type : "post",
         data : {userId : userId.val()},
         success : function(result){
            if(result == "fail"){
               confirm("사용할 수 없는 아이디 입니다.");
               userId.focus();
            }else{
               if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
                  userId.attr("readonly", "true");
                  count++;
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
   
   
   function emailChk() {
      
      var email = $("input[name='email']");
         if(email.val() == "" || email.val() == null) {
            confirm("이메일을 입력해주세요.");
            email.val('');
            email.focus();
            return false;
         } 
         
         $.ajax({
            url : "<%=request.getContextPath() %>/emailCheck.me",
            type : "post",
            data : {email : email.val()},
            success : function(result){
               if(result == "fail"){
                  confirm("사용할 수 없는 이메일 입니다.");
                  email.focus();
               }else{
                  var ask = confirm("사용가능한 이메일 입니다. 사용하시겠습니까?");
                  if(ask == true){
                     var url ="<%=request.getContextPath() %>/views/member/emailChkController.jsp?command=emailChk&email=" + email.val();
                        var name = "인증번호 입력";
                        var option = "width = 500, height = 500, top = 100, left = 200"
                        window.open(url, name, option);
                     email.attr("readonly", "true");
                        emailcount++;
                  }else{
                     email.focus();
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