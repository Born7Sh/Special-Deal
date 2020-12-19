<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.requestBoardDAO" %>
<%@ page import = "bi.requestBoardInfo" %>
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
		request.setCharacterEncoding("utf-8");
		Integer post_num = Integer.parseInt(request.getParameter("post_num"));
		
		requestBoardDAO rbDAO = new requestBoardDAO();
		
		Integer isSuccess = rbDAO.updateSolve(post_num);
		
		
		%>
		
		
		<script type = "text/javascript">
		if(<%=isSuccess %>==1){
			alert("해결 완료 처리 성공");
			location.href="request_board_view.jsp?post_num=<%=post_num%>";
			
		}
		if(<%=isSuccess %>==0){
			alert("해결 완료 처리 실패");
			location.href="request_board_view.jsp?post_num=<%=post_num%>";
		}
		
		</script>
	<br><br><br><br><br><br><br><br><br>
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
