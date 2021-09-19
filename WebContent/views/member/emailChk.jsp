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
		<title>어디어디 이메일 인증번호</title>
	</head>
	<body style="background-color: #FFF3E7;">
		<% 
			String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
			boolean result = false;
		%>
		<script type="text/javascript">
		alert("인증번호가 발송되었습니다.")
			function chk() {
				if(document.getElementsByName("email_chk")[0].value == document.getElementsByName("AuthenticationKey")[0].value) {
					document.getElementsByName("email_chk_result")[0].value = "인증번호가 일치합니다.";
					opener.document.getElementsByName("email")[0].title = "y";
					<% result = true; %>
				} else {
					document.getElementsByName("email_chk_result")[0].value = "인증번호가 일치하지 않습니다.";
					opener.document.getElementsByName("email")[0].title = "n";
				}
			}
			
			function confirm(bool) {
				if(bool) {
					//인증번호가 일치한다면
					opener.document.getElementsByName("email")[0].focus();
				} else {
					//인증번호가 일치하지 않는다면
					alert("인증번호가 일치하지 않습니다.");
					opener.document.getElementsByName("email")[0].focus();
					opener.document.getElementsByName("email")[0].val('');
				}
				//사용이 완료된 팝업창 닫기
				self.close();
			}
		</script>
		
		
		<table style="width: 80%; margin-left: 10%; margin-top: 15%; height: 300px; border: none;">
				<caption style="margin-top: -7%;"><h2>인증번호를 입력하세요.</h2></caption>
			<tr>
				<td style="border: none;">
					<input type="text" name="email_chk" style="text-align:center; width: 98%; height: 100%; font-size: 20px;">
					<input type="hidden" name="AuthenticationKey" value="<%=AuthenticationKey%>">
				</td>
				<td rowspan="2" style="border: none;"><input type="button" name="chk" value="인증번호 확인" onclick="chk();" style="border: none; background-color: #D958A0; color: #ffffff; width: 100%; height: 103%; font-size: 20px;"/></td>
			</tr>
			<tr>
				<td style="border: none;"><input type="text" name="email_chk_result" readonly="readonly" style="color: #D34B32; text-align:center; width: 98%; height: 104%; font-size: 19px;"></td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px; border: none;"><input type="button" value="닫기" onclick="confirm(<%=result%>);" style="border: none; background-color: #545554; color: #ffffff; width: 100%; height: 100%; font-size: 20px;"></td>
			</tr>
		</table>
	</body>
</html>