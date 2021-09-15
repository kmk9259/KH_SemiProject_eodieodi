<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList,
    semiProject.com.kh.notice.model.vo.*"%>
    
     <%
    Notice notice = ((Notice)request.getAttribute("notice")); 
    String contextPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="faq bg-color">
      <div class="container">
        <div class="faq-title">
          <h2>공지사항</h2>
          <p>어디어디 공지사항입니다!</p>
        </div>
        
 
				 
		<ul class="faq-list">
          <li data-aos="fade-up" data-aos-delay="100" class="aos-init aos-animate noticeView">
          <input type="hidden" name="nno" value="<%= notice.getNoticeNo() %>"> 
            <a data-toggle="collapse" class="collapsed" href="#faq1" aria-expanded="true" id="title"><%= notice.getNoticeTitle() %> <i class="fas fa-arrow-up"></i></a>
            <div id="faq1" class="collapse" data-parent=".faq-list" >
               <p>
                <%= notice.getNoticeContent() %>
              </p> 
            </div>
          </li>
          </ul>
				

      </div>

    </section>



</body>
</html>