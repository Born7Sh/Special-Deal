<%@ page import="java.sql.*"%> 
<%
	Connection conn = null;

	String url = "jdbc:mysql://kpuweb.iptime.org:3306/wsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=utf-8";
	String user = "root";
	String password = "wspdb159159!";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
%>