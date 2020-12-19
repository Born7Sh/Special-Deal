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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<script language="javascript">
   function validate() {
       var re = /^[a-zA-Z0-9]{6,12}$/; 
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

       
       var id = document.getElementById("id");
       var pw = document.getElementById("password");
       var pw1 = document.getElementById("passwordcheck");
       var email = document.getElementById("email");
       var name = document.getElementById("name");
       

       if(pw.value != pw1.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.passwordcheck.value = "";
           join.passwordcheck.focus();
           return false;
       }


       if(!check(re,id,"아이디는 6~12자의 영문 대소문자와 숫자로만 입력")){
           return false;
       }

       if(!check(re,pw,"패스워드는 6~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(email=="") {
           alert("이메일을 입력해 주세요");
           email.focus();
           return false;
       }

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }

       if(name=="") {
           alert("이름을 입력해 주세요");
           name.focus();
           return false;
       }
	
     alert("회원가입이 완료되었습니다.");
   }
   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }

</script>
	<body class="homepage is-preload">
		<div id="page-wrapper">
			<%@ include file="header.jsp" %>
			<%@ include file="dbconn.jsp" %>
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-8 off-2">
								<h2>회원가입</h2>
								<br>
								<form onsubmit="return validate();" action="register_process.jsp" method="post">
									<table>
										<tr>
											<th>아이디</th>
											<td><input type="text" id="id" placeholder="아이디를 입력하세요." name="id"></td>

											<td><input type=button value="id 중복확인" onclick="CheckForm()"></td>
											<script type="text/javascript">
												function CheckForm(){
													<%
														ResultSet rs = null;
														PreparedStatement pstmt = null;
														
														try{
															String sql = "select id from Member";
															pstmt = conn.prepareStatement(sql);
															rs=pstmt.executeQuery();
													%>
															var flag=0;
													<%
															while(rs.next()){
																String id=rs.getString("id");
																
													%>
																var val = $('#id').val();
																var str = "<%=id%>";
																var bool = "<%=rs.isLast()%>";
															
																if(str==val){
																	alert("이미있는 id입니다.");
																	flag=1;
																}
																if(str!=val&&bool=="true"&&flag==0){
																	alert("사용가능한 id입니다.");
																}
													<%
															}
														}catch(SQLException ex){
															out.println("Member 테이블 호출이 실패했습니다.<br>");
														}finally{
															if(rs!=null)
																rs.close();
															if(pstmt != null)
																pstmt.close();
															if(conn != null)
																conn.close();
														}
													%>
												
												}
											</script>

										</tr>
										<tr>
											<th>이름</th>
											<td><input type="text" id="name" placeholder="이름을 입력하세요." name="name"></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><input type="password" id="password" placeholder="비밀번호를 입력하세요." name="password"></td>
										</tr>
										<tr>
											<th>비밀번호 확인</th>
											<td><input type="password" id="passwordcheck" placeholder="비밀번호를 다시 입력해주세요." name="passwordcheck"></td>
										</tr>		
										<tr>
											<th>Email</th>
											<td><input type="text" id="email" placeholder="이메일을 입력해주세요." name="email"></td>
										</tr>								
									</table>
										<button class="btn btn btn-lg btn-success btn-block" type="submit">회원가입</button>
									
									
								</form>
							</div>
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