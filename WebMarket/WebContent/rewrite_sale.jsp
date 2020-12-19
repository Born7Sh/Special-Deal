<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id = "bi" class = "bi.boardInfo"/>
<jsp:setProperty name = "bi" property = "post_title"/>
<jsp:setProperty name = "bi" property = "post_content"/>
<jsp:setProperty name = "bi" property = "post_content"/>
<jsp:setProperty name = "bi" property = "sale_start"/>
<jsp:setProperty name = "bi" property = "sale_end"/>
<jsp:setProperty name = "bi" property = "post_link"/>
<jsp:setProperty name = "bi" property = "post_num"/>
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
				<form method="post" action="sale_table_rewrite_process.jsp" enctype="multipart/form-data">
					<table class="board_view" style="text-align: center; border: 1px solid #dddddd">
						<colgroup>
        			<col width="15%" >
        			<col width="*" >
     				</colgroup>
 					 	<h2 style="text-align:center;">게시글 작성</caption>
	      			<tbody>
	      			&nbsp;
	      			<tr>
	      				<th scope="row">카테고리</th>
	      				<td>
	      					<select id ="category" name = "category" style="width:50%;float:left;">	
              					<option value="1">패션의류</option>
              					<option value="2">뷰티</option>
              					<option value="3">출산/유아동</option>
              					<option value="4">식품</option>
              					<option value="5">주방용품</option>
              					<option value="6">생활용품</option>
              					<option value="7">홈인테리어</option>
              					<option value="8">가전디지털</option>
              					<option value="9">스포츠레저</option>
              					<option value="10">자동차용품</option>
              					<option value="11">도서/음반/DVD</option>
              					<option value="12">완구/취미</option>
              					<option value="13">마일리지</option>
              				</select>
              			</td>
	      			</tr>
	      			<tr>
	      				<input type = "hidden" name = "post_num" id = "post_num" value = <%=bi.getPost_num() %>/>
              			<th scope="row">제목</th>
              			<td><input type="text"  name="post_title" class="wdp_90"  value = <%=bi.getPost_title()%>/></td>
          			</tr>
          			<tr>
          				<th scope ="row">기간 설정</th>
          				<td>
  							<input type='text' class="datepicker-min" name="sale_start" style="width:49%;float:left;" value = <%=bi.getSale_start() %>/>
  							<input type='text' class="datepicker-max" name="sale_end" style="width:49%;float:right;" value = <%=bi.getSale_end() %>/>
						</td>
          			</tr>
          			<tr>
          				<th scope ="row">링크</th>
          				<td><input type = "text" name="post_link" class = "wdp_90" value = <%=bi.getPost_link() %>/></td>
          			</tr>
          			<tr>
	          			<th scope="row">내용</th>
	          			<td><textarea cols="100" rows="20" id="post_content" name="post_content" title="내용" value = <%=bi.getPost_content() %>></textarea></td>
	          			
		      			</tr>
        			</tbody>
      			</table>
      			
      			<div id="fileDiv">
        			<p>
            			<input type="file" name="post_image"/>
            			<a href="#this" name="delete" class="btn">삭제하기</a>
        			</p>
        			<button type="submit" onclick="location.href='sale_board.jsp?cate=0&page_num=1'" class="btn btn-primary pull-right">목록으로</button>
							<button type="submit" class="btn btn-primary pull-right">수정완료</button>
      			</div>
				</form>
				</div>
			</div>
		</div>
	</nav>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- Scripts -->
		<script src="assets/js/jquery-3.5.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
    	<!-- Air datepicker css -->
    	<script src="assets/js/datepicker.js"></script> <!-- Air datepicker js -->
    	<script src="assets/js/i18n/datepicker.ko.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		
		<script>		
			datePickerSet($(".datepicker-min"), $(".datepicker-max"), true);
			
			function datePickerSet(sDate, eDate, flag) {

			    //시작 ~ 종료 2개 짜리 달력 datepicker	
			    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
			        var sDay = sDate.val();
			        var eDay = eDate.val();

			        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
			            var sdp = sDate.datepicker().data("datepicker");
			            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

			            var edp = eDate.datepicker().data("datepicker");
			            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			        }

			        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			        if (!isValidStr(eDay)) {
			            sDate.datepicker({
			                maxDate: new Date(eDay.replace(/-/g, "/"))
			            });
			        }
			        sDate.datepicker({
			            language: 'ko',
			            autoClose: true,
			            onSelect: function () {
			                datePickerSet(sDate, eDate);
			            }
			        });

			        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			        if (!isValidStr(sDay)) {
			            eDate.datepicker({
			                minDate: new Date(sDay.replace(/-/g, "/"))
			            });
			        }
			        eDate.datepicker({
			            language: 'ko',
			            autoClose: true,
			            onSelect: function () {
			                datePickerSet(sDate, eDate);
			            }
			        });

			        //한개짜리 달력 datepicker
			    } else if (!isValidStr(sDate)) {
			        var sDay = sDate.val();
			        if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
			            var sdp = sDate.datepicker().data("datepicker");
			            sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			        }

			        sDate.datepicker({
			            language: 'ko',
			            autoClose: true
			        });
			    }


			    function isValidStr(str) {
			        if (str == null || str == undefined || str == "")
			            return true;
			        else
			            return false;
			    }
			}
		</script>
		
</body>

</html>