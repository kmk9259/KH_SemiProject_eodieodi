<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이메일 인증번호</title>
	</head>
	<body>
		<% 
			String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
			boolean result = false;
		%>
		<script type="text/javascript">
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
					window.close();
				}
				//사용이 완료된 팝업창 닫기
				//self.close();
			}
		</script>
		<table border="1">
			<tr>
				<td>인증번호를 입력하세요.</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="email_chk">
					<input type="hidden" name="AuthenticationKey" value="<%=AuthenticationKey%>">
				</td>
				<td><input type="button" name="chk" value="인증번호 확인" onclick="chk();"></td>
			</tr>
			<tr>
				<td><input type="text" name="email_chk_result" readonly="readonly" style="color: red;"></td>
			</tr>
			<tr>
				<td><input type="button" value="확인" onclick="confirm(<%=result%>);"></td>
			</tr>
		</table>
	</body>
</html>