package bi;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;


public class requestBoardDAO{
	private Connection conn;
	private ResultSet rs;
	
	public requestBoardDAO() {
		
	
		try {
		String url = "jdbc:mysql://kpuweb.iptime.org:3306/wsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=utf-8";
		String user = "root";
		String password = "wspdb159159!";
	
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			
		}
	}
	

	public String getCurrentDate() throws SQLException {
		String sql = "select NOW()";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			
		}
		return " ";
	}
	public int requestBoardReWrite(String post_title,String post_content,Integer post_num) throws SQLException{
		String sql = "update Request_Table set post_title = ?, post_content = ? where post_num = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, post_title);
			pstmt.setString(2, post_content);
			pstmt.setInt(3, post_num);
			
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			
		}
		return -1;
	}
	public int userBoardWrite(String member_id,String post_title,String post_content) throws SQLException {
		String sql = "INSERT INTO Request_Table(member_id,table_num,post_title,post_content,post_date,post_isSolved) VALUES(?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,member_id);
			pstmt.setInt(2, 3);
			pstmt.setString(3, post_title);
			pstmt.setString(4, post_content);
			pstmt.setString(5,getCurrentDate());
			pstmt.setInt(6, 0);
			
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			
		}
		return -1;
	}
	public requestBoardInfo getBoard(Integer post_num) throws SQLException {
		String sql = "select * from Request_Table where post_num = ?";
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				requestBoardInfo rbi = new requestBoardInfo();
				rbi.setPost_member_id(rs.getString(1));
				rbi.setTable_num(rs.getInt(2));
				rbi.setPost_num(rs.getInt(3));
				rbi.setPost_title(rs.getString(4));
				rbi.setPost_content(rs.getString(5));
				rbi.setPost_date(rs.getString(6));
				rbi.setPost_isSolved(rs.getInt(7));
				return rbi;
			}
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			
		}
		return null;
	}
	public int deletePost(Integer post_num) throws SQLException {
		String sql = "delete from Request_Table where post_num = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, post_num);
			
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(Exception e) {
			
		}finally {
			if(pstmt !=null) {
				pstmt.close();
			}
		}
		return -1;
	}

	public int updateSolve(Integer post_num) throws SQLException{
		String sql = "update Request_Table set post_isSolved = ? where post_num = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, post_num);
			
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(Exception e) {
			
		}finally {
			if(pstmt != null) {
				pstmt.close();
			}
		}
		return -1;
	}
}