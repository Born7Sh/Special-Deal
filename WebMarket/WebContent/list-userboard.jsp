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
									int post_num;
									String post_title;
									String post_date;
									String member_id;
									
									String sql = "select post_num, post_title, post_date,member_id from User_Table order by post_num desc limit ?,? ";
									
									pstmt = conn.prepareStatement(sql);
									pstmt.setInt(1,(page_num-1)*10);
									pstmt.setInt(2,(page_num)*10);
									rs = pstmt.executeQuery();
									
									while(rs.next()){
							
										post_num = rs.getInt("post_num");
										post_title = rs.getString("post_title");
										post_date = rs.getString("post_date");
										member_id = rs.getString("member_id");
									
								%>
								<td>
									<span><%=Integer.toString(post_num) %></span>
								</td>
								<td>
									<a href="#" class="thumbnail" 
									style="width: 80px">
									<img src="images/img01.jpg" alt=""></a>
								</td>
								<td class="td-subject">
									<a href="user_board_view.jsp?post_num=<%=post_num %>" ><%=post_title%></a>
								</td>																																																								
								<td>
									<a href="#popup_menu_area" class="member_4" onclick="return false"><%=member_id%></a>
								</td>																																																			
								<td><%=post_date%></td>			
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
						out.println("<button type='submit' onclick='location.href=\"user_write.jsp\"' class='btn btn-primary pull-right'>글쓰기</button>");
						}
						else{
							
						}
					%>
				
					
				</div>
			</div>
			<ul class="boardPagination">
				<li class="prevEnd">
					<a href="list-userboard.jsp?page_num=<%=page_num-1%>"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on"><%=page_num %></strong>
				</li>
				<li class="nextEnd">
					<a href="list-userboard.jsp?page_num=<%=page_num+1%>">NEXT <i class="ti-angle-right"></i></a>
				</li>
			</ul>
			<div class="boardSearch">
				<form action="user_board_search.jsp?page_num=1" method="get" onsubmit="return procFilter(this, search)" id="fo_search" class="boardSearchForm"><input type="hidden" name="act" value="">
					<div class="">
						<span class="search-target">
							<select name="search_target">
								<option value="title">제목</option>
							</select>
						</span>					
						<input type="text" name="search" id = "search" title="검색" class="inputText" accesskey="S" placeholder="">		
						<span class="search-btn">
							<button type="submit" class="">
								<i class="ti-search"></i>
								<span class="hidden-xs"> 검색</span>
							</button>
						</span>		
					</div>
				</form>
					<
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