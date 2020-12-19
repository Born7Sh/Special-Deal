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
		String member_id = request.getParameter("member_id");
		Integer post_num = Integer.parseInt(request.getParameter("post_num"));
		
		PreparedStatement pstmt = null;

		ResultSet rs;
	    String sql = "select * from User_History where member_id = ? and history_recommend = ?";
		Integer isSuccess = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,(String)session.getAttribute("id"));
			pstmt.setInt(2, post_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isSuccess=0;
			}
			else{
				isSuccess=1;
			}
		}catch(SQLException ex){
			out.println(ex);
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
		}
		if(isSuccess==1){
			
			sql = "insert into User_History(member_id,history_recommend) values(?,?)";
			pstmt = null;
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,(String)session.getAttribute("id"));
				pstmt.setInt(2,post_num);
				isSuccess = pstmt.executeUpdate();
				
				
			}catch(SQLException ex){
				out.println(ex);
			}finally{
				if(pstmt != null){
					pstmt.close();
				}
			}
			
		}
		
		if(isSuccess==1){
			
			sql = "update Sale_Table set post_recommend = post_recommend + 1  where post_num = ?";
			pstmt=null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,post_num);
				
				isSuccess = pstmt.executeUpdate();
				
			}catch(SQLException ex){
				out.println(ex);
			}finally{
				if(pstmt != null){
					pstmt.close();
				}
			
			}
		}	
	
		%>
		<script type = "text/javascript">
		if(<%=isSuccess %>==1){
			alert("추천 성공");
			location.href="sale_board_view.jsp?post_num=<%=post_num%>";
			
		}
		if(<%=isSuccess %>==0){
			alert("이미 추천한 글입니다");
			location.href="sale_board_view.jsp?post_num=<%=post_num%>";
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
