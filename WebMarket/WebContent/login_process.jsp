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
				String rid;
				rid = request.getParameter("id");
				String pass_word = request.getParameter("password");
				
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				try{
					//모든 id와 passwd를 가져오면 네트워크와 데이터베이스에 부하가능성.   
					String sql = "select id, passwd, email, name,is_Admin from Member where id = '"+rid+"'";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

						if(rs.next()){
							if(rid.equals(rs.getString("id"))){
								if(pass_word.equals(rs.getString("passwd"))){	
									String email = rs.getString("email");
									String name=rs.getString("name");
									session.setAttribute("id",rid);
									session.setAttribute("pw",pass_word);
									session.setAttribute("email",email);
									session.setAttribute("name",name);
									session.setAttribute("is_Admin",rs.getInt(5));
									out.println(rs.getString("name")+"님 환영합니다.<br>");
								}else
									out.println("로그인에 실패하였습니다. ID혹은 비밀번호를 다시 확인해주세요.<br>");
							}
						}
						else{	//내용이 아무것도 없으면 그런 아이디는 없다는거.
							out.println("로그인에 실패하였습니다. ID혹은 비밀번호를 다시 확인해주세요.<br>");
						}				
			%>
						<a href="login.jsp" class="failed">로그인페이지로 이동</a>
			<% 
				}catch(SQLException ex){
					out.println("로그인에 실패하였습니다.ID혹은 비밀번호를 다시 확인해주세요.<br>");
					out.println("SQLException: " + ex.getMessage());
			%>
					<a href="login.jsp" class="failed">로그인페이지로 이동</a>
			<%
					
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
	