<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, semiProject.com.kh.place.model.vo.*"
%>
<% 
	ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 일정관리(조회)</title>
<style>
	.outer{
		width:1000px;
		height:700px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
	}
	.listPlace{
		width:760px;
		height:550px;
		margin:auto;
	}
	.thumbnail{
		display:inline-block;
		width:220px;
		border:1px solid white;
		margin:10px;
	}
	.thumbnail:hover{
		opacity:0.7;
		cursor:pointer;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<br>
		
		<div class="listPlace">
			<%for(Place p : list){ %>
			<div class="thumbnail" align="center">
				<input type="hidden" value="<%=p.getPlaceNo()%>">
				<img src="<%=contextPath %>/resources/place_upfiles/<%= p.getPlaceImg() %>" width="200px" height="150px"> <br>
				<p>
					No.<%= p.getPlaceNo() %>  <%=p.getPlaceTitle() %> <br>
					조회수 : <%=p.getCount() %>
				</p>
			</div>
			<%} %>
		
			
			<br><br>
			<div align="center">
			
			<%-- <% if(loginUser != null){ %>
				<button onclick="location.href='<%=contextPath %>/insertForm.th'">작성하기</button>
			<% } %> --%>
			</div>
		</div>
		<script>
		
			$(function(){
				$(".thumbnail").click(function(){
					var bId = $(this).children().eq(0).val();
					location.href="<%=contextPath%>/detail.th?bId=" + bId;
				});
			});
		</script>
	</div>
</body>
</html>