<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
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
					<% result = true; %>
				} else {
					document.getElementsByName("email_chk_result")[0].value = "인증번호가 일치하지 않습니다.";
				}
			}
			
			function confirm(bool) {
				if(bool) {
					//인증번호가 일치한다면
					opener.document.getElementsByName("email")[0].focus();
					opener.document.getElementsByName("email")[0].title = "y";
					window.close();
					//opener.document.getElementsByName("user_email")[0].setAttribute("style", "border-color: #0dcaf0");
				} else {
					//인증번호가 일치하지 않는다면
					alert("인증번호가 일치하지 않습니다.");
					document.getElementsByName("email_chk")[0].focus();
				}
				//사용이 완료된 팝업창 닫기
				//self.close();
			}
		</script>
		<table border="1" style="border: #D34B32; width: 80%; margin-left: 10%; margin-top: 15%; height: 300px;">
				<caption><h2>인증번호를 입력하세요.</h2></caption>
			<tr>
				<td>
					<input type="text" name="email_chk" style="text-align:center; width: 99%; height: 100%; font-size: 20px;">
					<input type="hidden" name="AuthenticationKey" value="<%=AuthenticationKey%>">
				</td>
				<td rowspan="2"><input type="button" name="chk" value="인증번호 확인" onclick="chk();" style="background-color: #D958A0; color: #ffffff; width: 100%; height: 100%; font-size: 20px;"></td>
			</tr>
			<tr>
				<td><input type="text" name="email_chk_result" readonly="readonly" style="color: #D34B32; text-align:center; width: 99%; height: 100%; font-size: 19px;"></td>
			</tr>
			<tr>
				<td colspan="2" style="height:70px"><input type="button" value="닫기" onclick="confirm(<%=result%>);" style="background-color: #545554; color: #ffffff; width: 100%; height: 100%; font-size: 20px;"></td>
			</tr>
		</table>
	</body>
</html>