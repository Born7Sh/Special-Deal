<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import = "bi.userBoardDAO" %>
<%@page import = "bi.requestBoardDAO" %>
<%@page import = "bi.boardInfoDAO" %>


<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8");

%>


<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>5조 팀 프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
		<section id="main">
	
			<%
				Integer isSuccess;
				Integer table_num = Integer.parseInt(request.getParameter("table_num"));
				Integer post_num = Integer.parseInt(request.getParameter("post_num"));
				
				if(table_num==1){
					boardInfoDAO biDAO = new boardInfoDAO();
					isSuccess=biDAO.deletePost(post_num);
				}
				else if(table_num==2){
					userBoardDAO ubDAO = new userBoardDAO();
					isSuccess=ubDAO.deletePost(post_num);
					
				}
				else{
					requestBoardDAO rbDAO = new requestBoardDAO();
					isSuccess = rbDAO.deletePost(post_num);
				}
			
			%>
			
			<script type = "text/javascript">
		if(<%=isSuccess %>==1){
			alert("글 삭제 성공");
			location.href="home.jsp";
			
		}
		if(<%=isSuccess %>==0){
			alert("글 삭제 실패");
			location.href="home.jsp";
		}
		
		</script>
	
		</section>
	
	<%@ include file="footer.jsp" %>
	</div>	
	

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
	