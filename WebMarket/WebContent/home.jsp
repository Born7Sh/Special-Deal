<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.boardInfo" %>
<%@ page import = "bi.boardInfoDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.io.*" %>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@ page import = "java.awt.image.*" %>
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="images/logo1.png" rel="shortcut icon" type="image/x-icon">
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
								<!-- Portfolio -->
									<section>
										<header class="major">
											<h2>사이트 특별 할인가(광고배너)</h2>
										</header>
										<div class="row">

										<% 
												ResultSet rs = null;
												PreparedStatement pstmt = null;
												String urls="";
												OutputStream o;
												
											try{
												String sql = "select * from Sale_Table";
												pstmt = conn.prepareStatement(sql);
												rs = pstmt.executeQuery();
												Integer post_num;
												String product;
												String post_image;
												String start_day;
												String end_day;
												Blob imgs;
												
												while(rs.next()){
													post_num = rs.getInt("post_num");
													product=rs.getString("post_title");
													start_day = rs.getString("sale_start");
													end_day = rs.getString("sale_end");
													post_image = rs.getString("post_image");
													
													
												
											%>
											<div class="col-3 col-6-medium col-12-small">
												<section class="box">
													<a href="sale_board_view.jsp?post_num=<%=post_num %>" class="image featured">
													<img src =<%=post_image %>></a>
													<header>
														<a href = "sale_board_view.jsp?post_num=<%=post_num %>"><h3><%=product %></h3></a>
													</header>
													<p><%=start_day %> ~ <%=end_day %></p>
												</section>
											</div>
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
										</div>
										
									</section>
							</div>
							<div class="col-12">

								<!-- Portfolio -->
									<section>
										<header class="major">
											<h2>추천하는 할인(추천을 많이 받은 것)</h2>
										</header>
										<%
											boardInfoDAO biDAO = new boardInfoDAO();
											ArrayList<boardInfo> biList = biDAO.getRecoPost();
											
										%>
										
										
										<div class="row">
											<%for(int i=0; i<biList.size(); i++){
											
											%>
										
						
										
										
											<div class="col-3 col-6-medium col-12-small">
												<section class="box">
													<a href="sale_board_view.jsp?post_num=<%=biList.get(i).getPost_num()%>" class="image featured"><img src=<%=biList.get(i).getPost_image() %> alt="" /></a>
													<header>
														<a href = "sale_board_view.jsp?post_num=<%=biList.get(i).getPost_num()%>"><h3><%=biList.get(i).getPost_title() %></h3></a>
													</header>
													<p><%=biList.get(i).getSale_start() %> ~ <%=biList.get(i).getSale_end() %></p>
												</section>
											</div>
											<%
											
										}
											%>
											
										</div>
									</section>
							</div>
						</div>
					</div>
				</section>

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