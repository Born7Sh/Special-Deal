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
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass_word = request.getParameter("password");
		String email = request.getParameter("email");
		
		PreparedStatement pstmt = null;

		try{
			String sql = "insert into Member(id, passwd, name, email) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass_word);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
		%>
		<div id = "center">
			<center>
				<img src="images/member_icon2.png" width="224px;" height="224px;" alt="" /> 
				<br>
				<h3><%=name%>님 축하합니다!!! 회원가입이 성공적으로 완료하였습니다.</h3>
			</center>
		</div>

		<%
		}catch(SQLException ex){
		%>
		<div id = "center">
			<center>
				<img src="images/system.png" width="224px;" height="224px;" alt="" /> 
				<br>
				<h3>회원가입에 실패했습니다. 관리자에게 문의하세요. 02-123-4567</h3>
			</center>
		</div>
		<%
			//out.println("Member 테이블 삽입이 실패했습니다.<br>");
			//out.println("SQLException: " + ex.getMessage());
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		
		%>
		
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
