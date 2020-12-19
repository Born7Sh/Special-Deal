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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
	<link href="assets/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
</head>
<style>
	table * {
		vertical-align: middle;
	}
</style>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<%@ include file="header.jsp" %>

	<section id = "main">
	<nav class = "navbor navbor-default">
		<div class ="container">
			<div class="row">
				<div class="col-12">
				<form method="post" action="user_table_write_process.jsp">
					<table class="board_view" style="text-align: center; border: 1px solid #dddddd">
						<colgroup>
        			<col width="15%" >
        			<col width="*" >
     				</colgroup>
 					 	<h3 style="text-align:center;">사용자 게시판 게시글 작성</h3>
 					 	
	      			<tbody>
	      			&nbsp;
          			<tr>
              			<th scope="row">제목</th>
              				
              			<td><input type="text"  id = "post_title" name="post_title" class="wdp_90" /></td>
          			</tr>
          			
          			<tr>
	          			<th scope="row">내용</th>
	          			<td><textarea cols="100" rows="20" id="post_content" name="post_content" title="내용"></textarea></td>
	          			
		      			</tr>
        			</tbody>
      			</table>
      			
							<button type="submit" class="btn btn-primary pull-left">글쓰기</button>
							<button style="float:right;"type = "button" onclick="location.href='list-userboard.jsp?page_num=1'" class="btn btn-primary pull-right">목록으로</button>
					</form>
      			</div>
				
				
				</div>
			</div>
		
		</div>
	</nav>
	</section>
	<!-- Scripts -->
		<script src="assets/js/jquery-3.5.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
    	<!-- Air datepicker css -->
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		
		
		
</body>

</html>