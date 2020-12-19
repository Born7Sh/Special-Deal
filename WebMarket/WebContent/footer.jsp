<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="footer">
	<div class="container">
		<div class="row">
			<div class="col-6 col-6-medium col-12-small">
				<section>
					<header>
						<h2>링크 모아보기</h2>
					</header>
					<ul class="divided">
						<li><a href="home.jsp">홈</a></li>
						<li><a href="list-userboard.jsp?page_num=1">자유 게시판</a></li>
						<li><a href="sale_board.jsp?cate=0&page_num=1">특가 할인 게시판</a></li>
						<%
							if((String)session.getAttribute("id")!=null){
								out.println("<li><a href='mypage.jsp'>마이 페이지</a></li>");
							}
						%>
						<%
							if((String)session.getAttribute("id")!=null){
								out.println("<li><a href='logout.jsp'>로그아웃</a></li>");
							}
						%>
						<%
							if((String)session.getAttribute("id")==null){
								
								out.println("<li><a href = 'login.jsp'>로그인</a></li>");
						}
						%>
						<li><a href="register.jsp">회원가입</a></li>
					</ul>
				</section>
			</div>
			<div class="col-4 col-12-medium">
				<section>
					<header>
						<h2>팀원</h2>
					</header>
					<ul class="divided">
						<li>
							<dd>김원백</dd>
						</li>
						<li>
							<dd>이현성</dd>
						</li>
						<li>
							<dd>최인호</dd>
						</li>
						<li>
							<dd>황석주</dd>
						</li>
					</ul>
				</section>
			</div>
			<div class="col-12">
				<!-- Copyright -->
				<div id="copyright">
					<ul class="links">
						<li>&copy; KPU 2020-2 WSP Team 5</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>