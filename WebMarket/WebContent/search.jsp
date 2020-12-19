<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<h2><%=search %>검색결과</h2>
						</header>	
						<div class="row">
					<%
						ResultSet rs=null;
						PreparedStatement pstmt = null;
						String post_image;
						String product;
						String start_day;
						String end_day;
						Integer post_num;
						try{
							String sql = "select * from Sale_Table where post_title like \"%" +search+ "%\" order by post_num desc limit ?,?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1,(page_num-1)*10);
							pstmt.setInt(2,(page_num)*10);
							rs = pstmt.executeQuery();

							while(rs.next()){
								post_image=rs.getString("post_image");
								product=rs.getString("post_title");
								start_day = rs.getString("sale_start");
								end_day = rs.getString("sale_end");
								post_num = rs.getInt("post_num");
					%>
						
							<div class="col-3 col-6-medium col-12-small">
								<section class="box">
										<a href="sale_board_view.jsp?post_num=<%=post_num %>" class="image featured"><img src=<%=post_image %> alt="<%=product%>" /></a>
										<header>
											<a href="sale_board_view.jsp?post_num=<%=post_num %>"><h3><%=product%></h3></a>
										</header>
									<p><%=start_day%> ~ <%=end_day%></p>
								</section>
							</div>
					<%
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

					
	
							</div>
						</div>
					</div>
					<div id = "xet-boardWrp">
					<ul class="boardPagination">
				<li class="prevEnd">
					<a href="search.jsp?page_num=<%=page_num-1%>&search=<%=search%>"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on"><%=page_num %></strong>
				</li>
				<li class="nextEnd">
					<a href="search.jsp?page_num=<%=page_num+1%>&search=<%=search%>">NEXT <i class="ti-angle-right"></i></a>
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