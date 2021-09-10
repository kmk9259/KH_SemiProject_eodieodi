<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@page import="java.util.Properties" %>
<%@page import="java.util.Random" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.PasswordAuthentication" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="javax.mail.Authenticator" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이메일 인증 컨트롤러</title>
	</head>
	<body>
		<%
			String command = request.getParameter("command");
			System.out.println("[command: " + command + "]");
			
			if(command.equals("emailChk")) {
				//메일 서버 생성
				String host = "smtp.naver.com";
				String user = ""; // 자신의 네이버 계정('@naver.com'은 적지 말 것)
				String password = "";// 자신의 네이버 패스워드
				int port = 465;
				// 메일 받을 주소ㅜ
				String email = request.getParameter("email");
				System.out.println("email: " + email);
				
				// SMTP 서버 정보를 설정
				Properties props = System.getProperties();
				props.put("mail.smtp.host", "smtp.naver.com");
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.naver.com");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.debug", "true");
				
				// 인증 번호 생성기
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();
				for (int i = 0; i < 10; i++) {
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				
				String AuthenticationKey = temp.toString();
				System.out.println(AuthenticationKey);
				//인증번호 생성기 끝
				
				Session e_session = Session.getDefaultInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("", "");	//아이디, 비번
					}
				});
				
				// email 전송
				try {
					MimeMessage msg = new MimeMessage(e_session);
					msg.setFrom(new InternetAddress(user+"@naver.com", "EodiEodi"));
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

					// 메일 제목
					msg.setSubject("안녕하세요  EodiEodi 인증 메일입니다.");
					// 메일 내용
					msg.setText("인증 번호는 " + temp + "입니다.");

					Transport.send(msg);
					System.out.println("이메일 전송 완료");

				} catch (Exception e) {
					e.printStackTrace();
				}
				HttpSession saveKey = request.getSession();
				saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
				
				response.sendRedirect("emailChk.jsp");
			}
		%>
	</body>
</html>