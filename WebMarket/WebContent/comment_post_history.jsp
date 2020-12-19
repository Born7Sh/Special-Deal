<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.comment" %>
<%@ page import = "bi.commentDAO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
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
	<link rel="stylesheet" href="assets/css/main.css" />
	<link rel="stylesheet" href="assets/css/_style_list.css" />
	<link rel="stylesheet" href="assets/css/board.css"/>
	<link rel="stylesheet" href="assets/themify-icons/themify-icons.css"/>	
</head>
<style>
	.search-btn * {
		color: grey;
	}
</style>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<%@ include file="header.jsp" %>
		<%@ include file = "dbconn.jsp" %>
		
	<section id = "main">
	<nav class = "navbor navbor-default">
		<div class = "container" id ="xet-boardWrp">
			<div class="xet-listWrp">
				<div class="xet-listTableWrp">
					<table cellspacing="0" border="0" cellpadding="0" summary="List of Articles" class="xet-listTable">
						<thead>
							<tr>							
								<th scope="col">번호</th>	
								<th scope="col" colspan="2">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>	
							</tr>
						</thead>
						<tbody>
							<tr class="bg2">			
									<% 
								int page_num = 1;
								
								if(request.getParameter("page_num")!=null){
									page_num = Integer.parseInt(request.getParameter("page_num"));
								}
								if(page_num==0){
									page_num = 1;
								}
								
					 			ResultSet rs = null;
								PreparedStatement pstmt = null;
								
								try{
									commentDAO coDAO = new commentDAO();
									ArrayList<comment> coList = coDAO.getCommentHistory((String)session.getAttribute("id"),page_num);
								%><%
									for(int i=0;i<coList.size();i++){
										
								
								%>
								<td>
									<span><%=coList.get(i).getComment_num() %></span>
								</td>
								<td>
									<a href="#" class="thumbnail" 
									style="width: 80px">
									<img src="images/img01.jpg" alt=""></a>
								</td>
								<td class="td-subject">
									<a href="sale_board_view.jsp?post_num=<%=coList.get(i).getComment_post_num() %>" ><%=coList.get(i).getComment_content()%></a>
								</td>																																																								
								<td>
									<a href="#popup_menu_area" class="member_4" onclick="return false"><%=coList.get(i).getComment_member_id()%></a>
								</td>																																																			
								<td><%=coList.get(i).getComment_date()%></td>			
								</tr>
								<%
									}
									
											}catch(SQLException ex){
												out.println("Member 테이블 삽입이 실패했습니다.<br>");
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
						</tbody>
					</table>
					
					<%
						if(is_Logined==1){
						out.println("<button type='submit' class='btn btn-primary pull-right'>글쓰기</button>");
						}
						else{
							
						}
					%>
				
					
				</div>
			</div>
			<ul class="boardPagination">
				<li class="prevEnd">
					<a href="comment_post_history.jsp?page_num=<%=page_num-1%>"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on">1</strong>
				</li>
				<li class="nextEnd">
					<a href="comment_post_history.jsp?page_num=<%=page_num+1%>">NEXT <i class="ti-angle-right"></i></a>
				</li>
			</ul>
		
			</div>
		</div>
	</nav>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>

</html>