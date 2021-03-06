<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import = "bi.requestBoardDAO" %>


<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8");

%>

<jsp:useBean id = "rbi" class = "bi.requestBoardInfo"/>
<jsp:setProperty name = "rbi" property = "post_title"/>
<jsp:setProperty name = "rbi" property = "post_content"/>


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
				
		
				
				 
				requestBoardDAO rbDAO = new requestBoardDAO();
				int isSuccess;
				isSuccess = rbDAO.userBoardWrite((String)session.getAttribute("id"),rbi.getPost_title(),rbi.getPost_content());

			%>
			
	
		</section>
	<script>
	if(<%=isSuccess %>==1){
			alert("글 작성 성공");
			location.href="list-inquiry.jsp?cate=0&page_num=1";
			
		}
		if(<%=isSuccess %>==0){
			alert("글 작성 실패");
			location.href="list-inquiry.jsp?cate=0&page_num=1";
		}
		</script>
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
	