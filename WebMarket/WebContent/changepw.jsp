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
			String p1 = request.getParameter("ppassword");
			String p2 = request.getParameter("password");
			if(!p1.equals(p2)){
				
		%>
			<div id = "center">
				<center>
					<img src="images/system.png" width="224px;" height="224px;" alt="system" />
					<br>
					<h3>서로 다른 비밀번호를 입력하셨습니다.</h3>
				</center>
			</div>
			<a href="mypage.jsp" class="failed">돌아가기</a>
		<%	
			}
			else if(p1.equals(p2)){
				ResultSet rs=null;
				PreparedStatement pstmt = null;
				try{
					
					String cid =(String)session.getAttribute("id");
					String sql = "select id, passwd from Member where id = '"+cid+"'";
					pstmt = conn.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					if(rs.next()){
						String sql1 = "update Member set passwd = '"+p1+"' where id = '"+cid+"'";
						pstmt = conn.prepareStatement(sql1);
						pstmt.executeUpdate();
					}
		%>
				
				<div id = "center">
					<center>
						<img src="images/password2.png" width="224px;" height="224px;" alt="password"></img>
						<br>
						<h3>비밀번호를 변경이 완료되었습니다.</h3>
					</center>
				</div>
				<a href="mypage.jsp" class="failed">돌아가기</a>
		<%
					
				}catch(SQLException ex){
					out.println("테이블 쿼리 실패했습니다.<br>");
					out.println("SQLException: " + ex.getMessage());
				}finally{
					if(pstmt != null){
						pstmt.close();
					}
					if(conn != null){
						conn.close();
					}
				}
			}
			
		%>
		
		
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
		