<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.boardInfoDAO" %>
<%@ page import = "bi.boardInfo" %>
<%@ page import = "java.util.*" %>
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
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
					<%
					int page_num = 1;
					
					if(request.getParameter("page_num")!=null){
						page_num = Integer.parseInt(request.getParameter("page_num"));
					}
					if(page_num==0){
						page_num = 1;
					}
					
						request.setCharacterEncoding("utf-8");
						String search = request.getParameter("search");
					%>
								<!-- Portfolio -->
					<section>
						<header class="major">
						<h2><%=(String)session.getAttribute("id") %>님의 추천한 글 목록</h2>
						</header>	
						<div class="row">
					<%
				
						try{
							boardInfoDAO biDAO = new boardInfoDAO();
							ArrayList<Integer> recoList = biDAO.getRecoHistory((String)session.getAttribute("id"),page_num);
							for(int i=0; i<recoList.size();i++){
								boardInfo bi = biDAO.getBoard(recoList.get(i));
								
					%>
						
							<div class="col-3 col-6-medium col-12-small">
								<section class="box">
										<a href="sale_board_view.jsp?post_num=<%=bi.getPost_num() %>" class="image featured"><img src=<%=bi.getPost_image() %> alt="<%=bi.getPost_title()%>" /></a>
										<header>
											<a href="sale_board_view.jsp?post_num=<%=bi.getPost_num() %>"><h3><%=bi.getPost_title()%></h3></a>
										</header>
									<p><%=bi.getSale_start()%> ~ <%=bi.getSale_end()%></p>
								</section>
							</div>
					<%
							}
						}catch(SQLException ex){
							out.println("Sale_Table 테이블 검색 실패했습니다.<br>");
							out.println("SQLException: " + ex.getMessage());
						}
					%>		
						</div>
					</section>

					
	
							</div>
						</div>
					</div>
					<div id = "xet-boardWrp">
					<ul class="boardPagination">
				<li class="prevEnd">
					<a href="reco_history.jsp?page_num=<%=page_num-1%>"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on"><%=page_num %></strong>
				</li>
				<li class="nextEnd">
					<a href="reco_history.jsp?page_num=<%=page_num+1%>">NEXT <i class="ti-angle-right"></i></a>
				</li>
					</ul>
					</div>
				</section>

				
			<br>
			<br>
			<br>
			<br>
			<!-- Footer -->
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