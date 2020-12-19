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
		<style>
			.category a:link { color: #fff; text-decoration: none;}
			.category a:visited { color: #fff; text-decoration: none;}
			.category a:hover { color: #fff; text-decoration: none;}
			.category a:active { color: #fff; text-decoration: none;}
			.category button { width: 16%; display: inline-block;}
			.category { line-height: 1em; }
`		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12 category">
								<button onclick="location.href='admin_post_board.jsp?cate=0&page_num=1'">전체</button>
								<button onclick="location.href='admin_post_board.jsp?cate=1&page_num=1'">패션의류</button>
								<button onclick="location.href='admin_post_board.jsp?cate=2&page_num=1'">뷰티</button>
								<button onclick="location.href='admin_post_board.jsp?cate=3&page_num=1'" style="width:20%;">출산/유아동</button>
								<button onclick="location.href='admin_post_board.jsp?cate=4&page_num=1'">식품</button>
								<button onclick="location.href='admin_post_board.jsp?cate=5&page_num=1'">주방용품</button>
								<button onclick="location.href='admin_post_board.jsp?cate=6&page_num=1'">생활용품</button>
								<button onclick="location.href='admin_post_board.jsp?cate=7&page_num=1'">홈인테리어</button>
								<button onclick="location.href='admin_post_board.jsp?cate=8&page_num=1'">가전디지털</button>
								<button onclick="location.href='admin_post_board.jsp?cate=9&page_num=1'">스포츠레저</button>
								<button onclick="location.href='admin_post_board.jsp?cate=10&page_num=1'">자동차용품</button>
								<button onclick="location.href='admin_post_board.jsp?cate=11&page_num=1'" style="width:20%;">도서/음반/DVD</button>
								<button onclick="location.href='admin_post_board.jsp?cate=12&page_num=1'">완구/취미</button>
								<button onclick="location.href='admin_post_board.jsp?cate=13&page_num=1'">마일리지</button>
							</div>
							<% 
							Integer category;
							
							int page_num = 1;
							
							if(request.getParameter("page_num")!=null){
								page_num = Integer.parseInt(request.getParameter("page_num"));
							}
							if(page_num==0){
								page_num = 1;
							}
							
							if(request.getParameter("cate")==null){
								category = 0;
							}
							category = Integer.parseInt(request.getParameter("cate")); %>
								<!-- Portfolio -->
									<% 
										ResultSet rs = null;
										PreparedStatement pstmt = null;
										String sql = null;
										if(category!=0){
											try{
												sql = "select * from Category where category_num = ?";
												pstmt = conn.prepareStatement(sql);
												pstmt.setInt(1, category);
												
												rs = pstmt.executeQuery();
												String cate;
												while(rs.next()){
													cate = rs.getString("category_name");
										%>
										<section>
											<header class="major">
												<h2><%= cate %></h2>
											</header>
										<%
												}
											}catch(SQLException ex){
												out.println("Category 테이블 조회에 실패하였습니다.");
												out.println("SQLException: " + ex.getMessage());
											}finally{
												if(rs !=null){
													rs.close();
												}
												if(pstmt != null){
													pstmt.close();
												}
												
											}
										
										}
										else{
											String cate = "전체";
											%>
											<section>
												<header class="major">
													<h2><%= cate %></h2>
												</header>
											<%
										}
									%>
										<div class="row">

										<% 
											rs=null;
											boardInfoDAO biDAO = new boardInfoDAO();
											ArrayList<Integer> apList = biDAO.getAPList(page_num);
											String post_title;
											String sale_start;
											String sale_end;
											Integer post_num;
											String post_image;
											try{
												for(int i=0;i<apList.size(); i++){
												if(pstmt!=null){
													pstmt = null;
												}
												if(category==0){
													sql = "select * from Sale_Table where post_num = ?";
													pstmt = conn.prepareStatement(sql);
													pstmt.setInt(1,apList.get(i));
												}
												else{
													sql = "select * from Sale_Table where category_num = ? && post_num = ?";
													pstmt = conn.prepareStatement(sql);
													pstmt.setInt(1, category);
													pstmt.setInt(2,apList.get(i));
												}
												
												
												rs = pstmt.executeQuery();
												if(rs.next()){
												post_num = rs.getInt("post_num");
												post_image = rs.getString("post_image");
												post_title = rs.getString("post_title");
												sale_start = rs.getString("sale_start");
												sale_end = rs.getString("sale_end");
												
										%>
										
											<div class="col-3 col-6-medium col-12-small">
												<section class="box">
													<a href="sale_board_view.jsp?post_num=<%=post_num %>" class="image featured"><img src=<%=post_image %> alt="" /></a>
													<header>
														<a href="sale_board_view.jsp?post_num=<%=post_num %>"><h3><%=post_title%></h3></a>
													</header>
													<p><%=sale_start%> ~ <%=sale_end%></p>
												</section>
											</div>

										<%
												
													}
												}
											}catch(SQLException ex){
												out.println("Sale_Table 테이블 조회에 실패했습니다.<br>");
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

						<div id = "xet-boardWrp">
						<ul class="boardPagination">
				<li class="prevEnd">
					<a href="admin_post_board.jsp?cate=<%=category %>page_num=<%=page_num-1%>"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on"><%=page_num%></strong>
				</li>
				<li class="nextEnd">
					<a href="admin_post_board.jsp?cate=<%=category %>&page_num=<%=page_num+1%>">NEXT <i class="ti-angle-right"></i></a>
				</li>
						</ul>
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