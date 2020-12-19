<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>마이페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />	
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<style>
			#container {
				width:960px;
				margin:0 auto;
				text-align:center;
			}
			.tab {
				list-style: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
			}
			/* Float the list items side by side */
			.tab li {
				float: left;
			}
			/* Style the links inside the list items */
			.tab li a {
				display: inline-block;
				color: #000;
				text-align: left;
				text-decoration: none;
				padding: 10px 20px;
				font-size: 17px;
				transition:0.3s;
			}
			/* Style the tab content */
			.tabcontent {
				display: none;
				padding: 6px 12px;
				background-color: #fff;
			}
			ul.tab li.current{
				background-color: rgb(0,154,200);
				color: #fff;
			}
			.tabcontent.current {
				display: block;
			}
		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
				<section id="main">
					<div class="container">
						<ul class="tab">
							<li class="current" data-tab="tab1"><a href="#">회원정보 관리</a></li>
							<% out.println("<li data-tab='tab2'><a href='sale_history.jsp?page_num=1'>특가 정보 게시판 작성글 보기</a></li>");%>
							<% out.println("<li data-tab='tab3'><a href='user_board_history.jsp?page_num=1'>사용자 게시판 작성글 보기</a></li>");%>
							<% out.println("<li data-tab='tab4'><a href='request_board_history.jsp?page_num=1'>신고/문의 게시판 작성글 보기</a></li>");%>
							<% out.println("<li data-tab='tab5'><a href='comment_post_history.jsp?page_num=1'>쓴 댓글 보기</a></li>"); %>
							<% out.println("<li data-tab='tab6'><a href='reco_history.jsp?page_num=1'>추천한 글 보기</a>"); %>
						</ul>
						<div id="tab1" class="tabcontent current">
							<form action="changepw.jsp" method="post">
								<table>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" placeholder="비밀번호를 입력하세요." name="ppassword"></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" placeholder="비밀번호를 다시 입력해주세요." name="password"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" value="<%=(String)session.getAttribute("email") %>" name="passwordcheck"></td>
									</tr>
								</table>
									<button class="btn btn btn-lg btn-success btn-block" type="submit" onclick="CheckForm()">회원 정보 변경하기</button>
							</form>

						</div>
						<div id="tab2" class="tabcontent">
							글
						</div>
						<div id="tab3" class="tabcontent">
							댓글
						</div>
						<div id="tab4" class="tabcontent">
							추천
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
			<script>
				$(function() {
					$('ul.tab li').click(function() {
						var activeTab = $(this).attr('data-tab');
						$('ul.tab li').removeClass('current');
						$('.tabcontent').removeClass('current');
						$(this).addClass('current');
						$('#' + activeTab).addClass('current');
					})
				});
			</script>

	</body>
</html>