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
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<%@ include file="header.jsp" %>
		
	<section id = "main">
	<nav class = "navbor navbor-default">
		<div class ="container">
			<div class="row">
				<div class="col-12">
				<form method="post" action="writeAction.jsp">
					<table class = "table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
				<tr>
					<th colspan="3" style="background-color: #aaaaaa; text-align:center;">게시판 글 보기</th>
				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style = "width: 20%;">글 제목</td>
					<td>테스트</td>	<%--보이기 --%>
					<%-- ex) javadao.getuserTitle() --%>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td>홍길동</td> <%--보이기 --%>
					<%-- ex) javadao.getuserId() --%>
				</tr>			
				
				<tr>
					<td>작성일자</td>
					<td>2020-11-20</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td>테스트</td>
				</tr>								

			</tbody>
			
			
			
			<!-- 글쓰기 버튼 => 실제로 데이터를 액션페이지로 보냄 -->
			</table>
			
			<input type ="submit" class ="btn btn-primary pull-right" value="글 목록">
			<!--<a href="list.jsp" "btn btn-primary pull-right" value="글 목록">  -->
			
		
			
			
		
			
		</div>
	</div>

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