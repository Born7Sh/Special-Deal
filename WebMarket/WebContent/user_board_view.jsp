<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ page import = "bi.userBoardInfo" %>
<%@ page import = "bi.userBoardDAO" %>
<%@ page import = "bi.comment" %>
<%@ page import = "bi.commentDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>

	<head>
		<title>SweetDeal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
			<%
				int post_num = 0;
				
				if(request.getParameter("post_num")!=null){
					post_num = Integer.parseInt(request.getParameter("post_num"));
				}
				if(post_num==0){
					
				}
				String sql;
				PreparedStatement pstmt;
				
				userBoardInfo ubi = new userBoardDAO().getBoard(post_num);
				
				userBoardDAO ubDAO = new userBoardDAO(); 
				
				

			%>
				<section id="main">
					<div class="container">
						<div class="col-12">
							<table>
								<thead>
									<h2 style="float:left;"><%=ubi.getPost_title() %></h2>
								</thead>
								
								<tbody>
									<h2 style="text-align:right;"><%=ubi.getPost_member_id() %></h2>
								
									<hr>
									<tr>
										<%=ubi.getPost_content() %>
									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								<%
								if(is_Logined==1){
										out.println("<button type='button' onclick='location.href=\"request_write.jsp\"'>신고</button>");
								}
									else{}
								%>
							</div>
							<div style="text-align: right;">
								
									<form action = "user_rewrite.jsp" method = "post" style = "display:inline-block;">
								<input type = "hidden" id = "member_id" name = "member_id" value = <%=ubi.getPost_member_id()%>>
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=ubi.getPost_num() %>>
							
			
								<input type = "hidden" id = "post_content" name = "post_content" value = <%=ubi.getPost_content() %>/>
								<input type = "hidden" id = "post_title" name = "post_title" value = <%=ubi.getPost_title() %>/>
								<%
								if(ubi.getPost_member_id().equals((String)session.getAttribute("id")) || is_Admin ==1){
									out.println("<input type = 'submit' id = 'buttonrewrite' value = '수정'>");
								}
								else{
								}
									%>
								</form>
									<form action = "delete_post.jsp" method = "post" style = "display:inline-block;">
								<input type = "hidden" id = "table_num" name = "table_num" value = <%=ubi.getTable_num()%>>
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=ubi.getPost_num() %>>
								<%
									if(ubi.getPost_member_id().equals((String)session.getAttribute("id")) || is_Admin==1){
										out.println("<input type = 'submit' id = 'buttondel' value = '삭제'>");
									}
									else{}
								%>
								</form>
								<button onclick='location.href="list-userboard.jsp?page_num=1"'>목록</button>
							</div>
							
						</div>
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