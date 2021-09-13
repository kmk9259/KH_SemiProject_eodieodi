<%@page import="semiProject.com.kh.member.model.service.MemberService"%>
<%@page import="semiProject.com.kh.member.model.dao.MemberDao"%>
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
<%@ page import = "semiProject.com.kh.member.model.vo.Member" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이메일 인증 컨트롤러</title>
	</head>
	<body>
		<%   

		//Member findPwd = (Member)session.getAttribute("findPwd");
		/* //Member findId = (Member)request.getAttribute("findId"); */
		    
			//String userId = findId.getUserId();
			//String userName = findId.getUserName();
			//String email = findId.getEmail();
			
		   //String contextPath = request.getContextPath();
	   
		   
			String command = request.getParameter("command");
			System.out.println("[command: " + command + "]");
			
		   			// 메일 받을 주소ㅜ
				String email = request.getParameter("email");
				String userId = request.getParameter("userId");
				System.out.println("email: " + email);
				
				//이메일, 이름을 가지고 특정 유저의 아이디 찾기
				MemberService biz = new MemberService();
				Member findPwd = biz.findUserPwd(email, userId);

				System.out.println("~~~~~~~findPwd: " + findPwd);
				
			   
					/* /* String myPwd = request.getParameter("userPwd");
					System.out.println("[myPwd: " + myPwd + "]"); */
			
			if(findPwd != null){
			if(command.equals("findEmailChk")) {
				//메일 서버 생성
				String host = "smtp.naver.com";
				String user = ""; // 자신의 네이버 계정('@naver.com'은 적지 말 것)
				String password = "";// 자신의 네이버 패스워드
				int port = 465;
				// 메일 받을 주소ㅜ
				//Strin/* g email = request.getParameter("email"); */
				//System.out.println("email: " + email);
				

				/* System.out.println("userId: " + userId);
				System.out.println("email: " + email); */
				
				// SMTP 서버 정보를 설정
				Properties props = System.getProperties();
				props.put("mail.smtp.host", "smtp.naver.com");
				props.put("mail.smtp.port", 465);
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.naver.com");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.debug", "true");
				
				Session e_session = Session.getInstance(props, new Authenticator() {
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
					msg.setSubject("안녕하세요  EodiEodi 비밀번호 찾기 메일입니다.");
					// 메일 내용
					msg.setText("회원님의 비밀번호는 " + findPwd.getUserPwd() + "입니다. \n 소중한 개인정보 보호를 위해 로그인 후 비밀번호를 꼭 바꿔주세요!");

					Transport.send(msg);
					System.out.println("이메일 전송 완료");

				} catch (Exception e) {
					e.printStackTrace();
				}
				HttpSession saveKey = request.getSession();
				//response.sendRedirect("../views/member/login.jsp");
				response.sendRedirect("findIdEmailChk.jsp");
			}
			}else{
				System.out.println("이메일 전송 실패");
				request.setAttribute("msg", "비밀번호 찾기에 실패했습니다."); 
	            RequestDispatcher view = request.getRequestDispatcher("findFail.jsp");
	            view.forward(request, response);
			}
		%>
	</body>
</html>