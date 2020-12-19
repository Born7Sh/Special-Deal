<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.commentDAO" %>

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8");

%>
<jsp:useBean id="co" class="bi.comment" scope = "page"/>
<jsp:setProperty name = "co" property="comment_post_num"/>
<jsp:setProperty name = "co" property = "comment_table_num"/>
<jsp:setProperty name = "co" property = "comment_content"/>
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
				
				commentDAO coDAO = new commentDAO();
				co.setComment_member_id((String)session.getAttribute("id"));
				int isSuccess = coDAO.commentWrite(co.getComment_post_num(),co.getComment_table_num(),co.getComment_member_id(),co.getComment_content());
				
			%>
			<script type = "text/javascript">
				if(<%=isSuccess %>==1){
					alert("댓글 달기 성공");
					location.href="sale_board_view.jsp?post_num=<%=co.getComment_post_num()%>";
					
				}
				if(<%=isSuccess %>==0){
					alert("댓글 달기에 실패했습니다.");
					location.href="sale_board_view.jsp?post_num=<%=co.getComment_post_num()%>";
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
	