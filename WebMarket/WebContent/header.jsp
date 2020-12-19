<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="header">
	<div style="position: absolute; top: 1em; right: 1em; font-size: 14px; color: #858585; z-index: 1000000;">
		<style>
			a:link { color: #858585; text-decoration: none;}
			a:visited { color: #858585; text-decoration: none;}
			a:hover { color: #858585; text-decoration: none;}
			a:active { color: #858585; text-decoration: none;}
`		</style>
		<% request.setCharacterEncoding("UTF-8"); %>
		<%!
			Integer is_Logined;
			Integer is_Admin;
		%>
		<% 
			String h_name = (String)session.getAttribute("name");
			is_Admin = (Integer)session.getAttribute("is_Admin");
			if(h_name==null){	
		%>		
		<%
			is_Admin = 0;
			is_Logined = 0;
		%>
			<a href="login.jsp">로그인</a>
			<a href="register.jsp">회원가입</a>
			
		<%
			}
			if(h_name!=null){
		%>
		<%
			is_Logined = 1;
		%>
			
			<a href="mypage.jsp"><br><%=h_name %>님 안녕하세요</a>
			<a href="logout.jsp">로그아웃</a>			
		<%		
			}
		%>

		
	</div>
	<!-- Logo -->
	
	<div class="major">
		<form action="search.jsp?page_num=1" method="post">
		<table style="width:1000px; margin:auto">
			<tr>
				<td align="right">
				<a href="home.jsp">
				<img width=100px height=70px src="images/logo1.png"></a>
				</td>
			<td>
			<input type="text" id="search" name="search" placeholder="검색어를 입력하세요." ></td>
			<td align="left"><button type="submit">검색</button></td>
			</tr>
		</table>
		</form>	
	</div>
	
	<!-- Nav -->
	
	<nav id="nav">
		<ul>
			<li class="current"><a href="sale_board.jsp?cate=0&page_num=1">카테고리</a>
				<ul>
					<li><a href="sale_board.jsp?cate=1&page_num=1">패션의류</a></li>				
					<li><a href="sale_board.jsp?cate=2&page_num=1">뷰티</a></li>
					<li><a href="sale_board.jsp?cate=3&page_num=1">출산/유아동</a></li>
					<li><a href="sale_board.jsp?cate=4&page_num=1">식품</a></li>
					<li><a href="sale_board.jsp?cate=5&page_num=1">주방용품</a></li>
					<li><a href="sale_board.jsp?cate=6&page_num=1">생활용품</a></li>
					<li><a href="sale_board.jsp?cate=7&page_num=1">홈인테리어</a></li>
					<li><a href="sale_board.jsp?cate=8&page_num=1">가전디지털</a></li>
					<li><a href="sale_board.jsp?cate=9&page_num=1">스포츠레저</a></li>
					<li><a href="sale_board.jsp?cate=10&page_num=1">자동차용품</a></li>
					<li><a href="sale_board.jsp?cate=11&page_num=1">도서/음반/DVD</a></li>
					<li><a href="sale_board.jsp?cate=12&page_num=1">완구/취미</a></li>
					<li><a href="sale_board.jsp?cate=13&page_num=1">마일리지</a></li>
				</ul>
			</li>
			<li><a href="list-userboard.jsp?page_num=1">사용자 게시판</a></li>
			<li><a href="list-inquiry.jsp?page_num=1">신고/문의 게시판</a></li>
			<li><a href="sale_board.jsp?cate=0&page_num=1">특가 할인 게시판</a></li>
			<li><a href="admin_post_board.jsp?cate=0&page_num=1">관리자 인증 글</a></li>
		</ul>
	</nav>
</section>