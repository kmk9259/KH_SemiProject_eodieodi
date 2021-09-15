package semiProject.com.kh.planMy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.com.kh.member.model.vo.Member;
import semiProject.com.kh.place.model.vo.Place;
import semiProject.com.kh.planMy.model.service.PlanMyService;
import semiProject.com.kh.planMy.model.vo.PlanMy;

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/sendEmail.pl")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자,일정번호, 사용자이메일 
		Member mem = (Member)request.getSession().getAttribute("loginUser");
		int planNo = Integer.parseInt(request.getParameter("planNo"));
        String userEmail = request.getParameter("userEmail");
        
        //일정, 일정장소 
        PlanMy pm = new PlanMyService().selectPlanMy(planNo);
        ArrayList<Place> pList = new PlanMyService().selectPlace_planMy(planNo);
        
        //메일 서버 생성
		String host = "smtp.naver.com";
		String user = ""; // 자신의 네이버 계정('@naver.com'은 적지 말 것)
		String password = "";// 자신의 네이버 패스워드
		int port = 465;

		//아래 메일내용구성
		String content = "해당 일정을 찾지 못했습니다. \n관리자에게 문의 부탁드립니다. 이용에 불편을 드려 죄송합니다.\n더 나은 어디어디가 되도록 노력하겠습니다.";
		String detail = "";
		int index = 1;
		int price = 0;
		
		//관리자에 의해 일정이 지워진 경우 -> 일정이 하나도 없을 때를 대비
		if(pList.size() != 0) {
			for(Place p : pList) {
				detail += "\n(" + (index++) + ") " + p.getPlaceTitle() + " |  " + p.getAddress(); 
				price += p.getPrice();
			}
		}
		
		// 메일 받을 주소, 제목, 내용
		String recipient = userEmail;
		String subject = "[EodiEodi] "+mem.getUserName()+"님의 일정입니다.";
		if(pm != null) { //pm이 null인 경우는 존재하지 않겠지만 그래도 언제나 null대비!
			content = "안녕하세요 어디어디입니다."+mem.getUserName()+"님께서 요청하신 일정을 아래와 같이 보내드립니다.\n"
				       + "\n📌제목 : " + pm.getPlanTitle() 
				       + "\n📌일정 일자 : " + pm.getPlanDate() 
				       + "\n📌상세 일정 : " + detail
				       + "\n📌1인 예상금액 : " + price + "원\n\n\n"
				       + "어디어디를 이용해주셔서 감사합니다. 좋은 하루 보내세요:)";
		}
		
		// SMTP 서버 정보를 설정
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.debug", "true");
        
		Session e_session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);	//아이디, 비번
			}
		});
		
		boolean result = false;
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(e_session);
			msg.setFrom(new InternetAddress(user+"@naver.com", "EodiEodi"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

			// 메일 제목
			msg.setSubject(subject);
			// 메일 내용
			msg.setText(content);

			Transport.send(msg);
			System.out.println("이메일 전송 완료");
			
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
