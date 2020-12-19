<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Dopetrope by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>5조 팀 프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
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
				<section id="main">
					<div class="container">
						<ul class="tab">
							<li class="current" data-tab="tab1"><a href="#">회원정보 관리</a></li>
							<li data-tab="tab2"><a href="#">신고 글 보기</a></li>
						</ul>
						<div id="tab1" class="tabcontent current">
							회원 정보 리스트 -> 클릭시 페이지로 연결
						</div>
						<div id="tab2" class="tabcontent">
							신고가 들어온 글
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