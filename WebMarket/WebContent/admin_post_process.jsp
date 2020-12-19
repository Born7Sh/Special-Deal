<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		Integer table_num = 1;
		
		PreparedStatement pstmt = null;

		ResultSet rs;
	    String sql = "Insert into Admin_Post(table_num,post_num) values(?,?)";
		Integer isSuccess = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, table_num);
			pstmt.setInt(2, post_num);
			isSuccess = pstmt.executeUpdate();
			
		}catch(SQLException ex){
			out.println(ex);
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
		}
		
	
		%>
		
		
		
	<br><br><br><br><br><br><br><br><br>
	</section>
			<script type = "text/javascript">
		if(<%=isSuccess %>==1){
			alert("관리자 지정 게시글 성공");
			location.href="home.jsp";
			
		}
		if(<%=isSuccess %>==0){
			alert("관리자 지정 게시글 실패");
			location.href="home.jsp";
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
