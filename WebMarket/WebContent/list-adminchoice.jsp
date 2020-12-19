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
								<th scope="col">조회 수</th>
								<th scope="col">추천 수</th>
							</tr>
						</thead>
						<tbody>
							<tr class="bg2">			
								<td>
									<span>10</span>
								</td>
								<td>
									<a href="#" class="thumbnail" style="width: 80px">
									<img src="images/img01.jpg" alt=""></a>
								</td>
								<td class="td-subject">
									<a href="#" class="subject">제목</a>
								</td>																																																								
								<td>
									<a href="#popup_menu_area" class="member_4" onclick="return false">작성자</a>
								</td>																																																			
								<td>2016.11.24</td>			
								<td>274</td>	
								<td>3</td>																																	
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<ul class="boardPagination">
				<li class="prevEnd">
					<a href="#"><i class="ti-angle-left"></i> PREV</a>
				</li>
				<li>
					<strong class="page_on">1</strong>
				</li>
				<li class="nextEnd">
					<a href="#">NEXT <i class="ti-angle-right"></i></a>
				</li>
			</ul>
			<div class="boardSearch">
				<form action="/" method="get" onsubmit="return procFilter(this, search)" id="fo_search" class="boardSearchForm"><input type="hidden" name="act" value="">
					<div class="">
						<span class="search-target">
							<select name="search_target">
								<option value="title">제목</option>
							</select>
						</span>					
						<input type="text" name="search_keyword" value="" title="검색" class="inputText" accesskey="S" placeholder="">		
						<span class="search-btn">
							<button type="submit" onclick="jQuery(this).parents('form#fo_search').submit();return false;" class="">
								<i class="ti-search"></i>
								<span class="hidden-xs"> 검색</span>
							</button>
						</span>		
					</div>
				</form>
			</div>
		</div>
	</nav>
	</section>
	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>

</html>