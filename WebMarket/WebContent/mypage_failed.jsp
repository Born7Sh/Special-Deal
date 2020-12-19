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
					<div class="container">
					
						<%
							request.setCharacterEncoding("utf-8");
							String pass_word = request.getParameter("password");
							
							ResultSet rs = null;
							PreparedStatement pstmt = null;
							String id = (String)session.getAttribute("id");
							try{
								String sql = "select passwd from Member where id='"+id+"'";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								rs.next();
								if(!pass_word.equals(rs.getString("passwd"))){
						%>
						
							<div id = "center">
								<center>
									<img src="images/system.png" width="224px;" height="224px;" alt="" /> 
									<br>
									<h3>잘못된 비밀번호를 입력하셨습니다.</h3>
								</center>
							</div>
						<%
								}
								else{
									response.sendRedirect("mypage.jsp");
								}
							}catch(SQLException ex){
								out.println("Sale_Table 테이블 검색 실패했습니다.<br>");
								out.println("SQLException: " + ex.getMessage());
							}finally{
								if(pstmt != null){
									pstmt.close();
								}
								if(conn != null){
									conn.close();
								}
							}
						%>
					
					</div>
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