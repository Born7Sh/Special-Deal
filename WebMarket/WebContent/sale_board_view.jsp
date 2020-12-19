<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ page import = "bi.boardInfo" %>
<%@ page import = "bi.boardInfoDAO" %>
<%@ page import = "bi.comment" %>
<%@ page import = "bi.commentDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.*" %>
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
				boardInfo bi = new boardInfoDAO().getBoard(post_num);
				
				boardInfoDAO biDAO = new boardInfoDAO(); 
				
				sql = "update Sale_Table set post_read = post_read + 1  where post_num = ?";
				pstmt=null;
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, bi.getPost_num());
					
					pstmt.executeUpdate();
					
				}catch(SQLException ex){
					
				}finally{
					if(pstmt != null){
						pstmt.close();
					}
					
				}
				

			%>
				<section id="main">
					<div class="container">
						<div class="col-12">
							<table>
								<thead>
									<h2 style="float:left;"><%=bi.getPost_title() %></h2>
									<h2 style="text-align:right;"><%=bi.getSale_start() %>~<%=bi.getSale_end() %></h2>
								</thead>
								&nbsp;
								<tbody>
									<h3 style="text-align:right;"><%=bi.getPost_member_id() %></h2>
									<hr>
									<tr>
										<div style="width: 100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
											<a href="javascript:void(window.open('<%=bi.getPost_link() %>'))">
												링크 : <%=bi.getPost_link() %></a>
										</div>
									</tr>
									<hr>
									<tr>
										<img src=<%=bi.getPost_image() %>  />
									</tr>
									<br>
									<tr>
										<%=bi.getPost_content() %>
									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								
								<form action = "recommend_process.jsp" method = "post" style = "display:inline-block;">
								<input type = "hidden" id = "member_id" name = "member_id" value = <%=(String)session.getAttribute("name")%>>
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=bi.getPost_num() %>>
								<%
									if(is_Logined==1){
										out.println("<input type = 'submit' id = 'buttonreco' value ='추천'>");
									}
								%>
								</form>
								<button><%=bi.getPost_recommend() %></button>
								<%	
									if(is_Logined==1){
										out.println("<button type='button' onclick='location.href=\"request_write.jsp\"'>신고</button>");
									}
									else{}
								%>
							</div>
							<div style="text-align: right;">
								<form action = "admin_post_process.jsp" method = "post" >
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=bi.getPost_num() %>>
								<input type = "hidden" id = "table_num" name = "table_num" value = <%=bi.getTable_num()%>/>
								<%
									if(is_Admin==1){
									out.println("<input type = 'submit' id = 'buttonAdmin' value = '관리자지정'>");
									}
									else{
										
									}
								%>
								</form>
								
								<form action = "rewrite_sale.jsp" method = "post" style = "display:inline-block;">
								<input type = "hidden" id = "member_id" name = "member_id" value = <%=bi.getPost_member_id()%>>
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=bi.getPost_num() %>>
								<input type = "hidden" id = "category_num" name = "category_num" value =<%=bi.getCategory_num() %>/>
								<input type = "hidden" id = "sale_start" name = "sale_start" value =<%=bi.getSale_start() %>/>
								<input type = "hidden" id = "sale_end" name = "sale_end" value =<%=bi.getSale_end() %>/>
								<input type = "hidden" id = "post_content" name = "post_content" value = <%=bi.getPost_content() %>/>
								<input type = "hidden" id = "post_title" name = "post_title" value = <%=bi.getPost_title() %>/>
								<input type = "hidden" id = "post_link" name = "post_link" value = <%=bi.getPost_link() %>/>
								<%
								if(bi.getPost_member_id().equals((String)session.getAttribute("id")) || is_Admin==1){
									out.println("<input type = 'submit' id = 'buttonrewrite' value = '수정'>");
								}
								else{
								}
									%>
								</form>				
												
									<form action = "delete_post.jsp" method = "post" style = "display:inline-block;">
								<input type = "hidden" id = "table_num" name = "table_num" value = <%=bi.getTable_num()%>>
								<input type = "hidden" id = "post_num" name = "post_num" value = <%=bi.getPost_num() %>>
								<%
									if(bi.getPost_member_id().equals((String)session.getAttribute("id")) || is_Admin==1){
										out.println("<input type = 'submit' id = 'buttondel' value = '삭제'>");
									}
									else{}
								%>
								</form>
								<button onclick='location.href="sale_board.jsp?cate=0&page_num=1"'>목록</button>
								<hr>
							</div>
							<form action="comment_write_process.jsp" method="post">
								<input type="hidden" id="comment_post_num" name = "comment_post_num" value = <%=bi.getPost_num() %>>
								<input type="hidden" id ="comment_table_num" name = "comment_table_num" value = <%=bi.getTable_num() %>>

								<table>
									<tr>
										<td><input type="text" id="comment_content" name="comment_content" placeholder="댓글을 입력하세요."></td>
										<%
											if(is_Logined==1){
												out.println("<td><button type = 'submit'>댓글 달기</button></td>");
											}
											else{}
										%>
									</tr>
	</thead>								
										<tbody>
											
											<%
										commentDAO coDAO = new commentDAO();
										ArrayList<comment> coList = coDAO.getComment(bi.getPost_num());
										if(coList!=null){
											for(int i=0;i<coList.size();i++){
												%>
												<tr>
												<td>
													<h3 style="float:left;"><%=coList.get(i).getComment_member_id()%></h3>
													<h3 style="text-align:right;"><%=coList.get(i).getComment_date()%></h3>
													<%=coList.get(i).getComment_content()%>
												</td>
											</tr>
													<% 
												}
										}
									%>
										</tbody>
								</table>
							</form>
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