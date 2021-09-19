<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<!-- 폰트 3 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap" rel="stylesheet">
	<style>
	h1, h2, h3, h4, h5, h6, p, a, input, button, li, div {
	    font-family: 'Gowun Batang'!important;
	  }
	</style>
	
		<meta charset="UTF-8">
		<title>어디어디 이메일 발송 안내</title>
	</head>
	<body style="background-color: #FFF3E7;">

		<script type="text/javascript">
			alert("이메일이 발송되었습니다.")
			
			function mailChk() {
				window.close();
			}

		</script>
		<br>
		<br>
		<br>
		<br><br>
		<br><br>
		<h2 style="text-align: center;">이메일을 확인해주세요.</h2>
		<br>
		<br>
		<br>
		<input type="button" value="창 닫기" onclick="mailChk();" style="background-color: #D958A0; color: #ffffff; width: 80%; height: 50px; font-size: 20px; border: none; margin: 0% 10%;
		border-radius: 15px;">
	</body>
</html>