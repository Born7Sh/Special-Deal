<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;
		try {
			String url = "jdbc:mysql://kpuweb.iptime.org:3306/wsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=utf-8";
			String user = "root";
			String password = "wspdb159159!";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			out.println("데이터베이스 연결이 성공했습니다.");
		} catch (SQLException ex) {
			out.println("데이터베이스 연결이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>