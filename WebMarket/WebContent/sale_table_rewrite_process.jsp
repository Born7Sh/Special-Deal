<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bi.boardInfoDAO" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import= "bi.boardInfo" %>

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8");

%>


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
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
		<section id="main">
	
			<%
			    String path = request.getSession().getServletContext().getRealPath("/pic");
				
			    int size = 1024 * 1024 * 10; 
			    String file = ""; 
			    String originalFile = ""; 
				boardInfo bi = new boardInfo();
			    int isSuccess = 0;
			    String post_num;
				 try{
				        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

				        Enumeration files = multi.getFileNames();
				        String str = (String)files.nextElement(); 

				        file = multi.getFilesystemName(str); //서버 업로드 파일 이름
				        out.println(file);
				        originalFile = multi.getOriginalFileName(str); 
				        
				    	bi.setPost_title(multi.getParameter("post_title"));
						bi.setPost_content(multi.getParameter("post_content"));
						bi.setSale_start(multi.getParameter("sale_start"));
						bi.setSale_end(multi.getParameter("sale_end"));
						bi.setCategory_num(Integer.parseInt(multi.getParameter("category")));
						bi.setPost_member_id((String)session.getAttribute("id"));
						bi.setPost_link(multi.getParameter("post_link"));
						post_num = multi.getParameter("post_num");
						post_num = post_num.substring(0, post_num.length()-1);
						bi.setPost_num(Integer.parseInt(post_num));
						
						out.println(bi.getPost_image());
						boardInfoDAO biDAO = new boardInfoDAO();
						isSuccess = biDAO.boardReWrite(bi.getCategory_num(),bi.getPost_title(),bi.getPost_content(), "http://kpuweb.iptime.org:8080/image/"+file,
								bi.getSale_start(),bi.getSale_end(),bi.getPost_link(),bi.getPost_num());

				    } catch (Exception e) {
				        e.printStackTrace();
				    }
			
				

				
				
				
				
			%>
			<script type = "text/javascript">
		if(<%=isSuccess %>==1){
			alert("글 작성 성공");
			location.href="sale_board.jsp?cate=0&page_num=1";
			
		}
		if(<%=isSuccess %>==0){
			alert("글 작성 실패");
			location.href="sale_board.jsp?cate=0&page_num=1";
		}
		
		</script>
	
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
	