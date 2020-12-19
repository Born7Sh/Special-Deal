package bi;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;


public class commentDAO{
	private Connection conn;
	private ResultSet rs;
	
	public commentDAO() {
		
	
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
	public int commentWrite(Integer comment_post_num,Integer comment_table_num,String comment_member_id,String comment_content) throws SQLException {
		String sql = "INSERT INTO Comment (comment_post_num,comment_table_num,comment_member_id,comment_date,comment_content) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comment_post_num);
			pstmt.setInt(2, comment_table_num);
			pstmt.setString(3,comment_member_id);
			pstmt.setString(4,getCurrentDate());
			pstmt.setString(5, comment_content);
			
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		return -1;
	}
	
	public ArrayList<comment> getComment(Integer comment_post_num) throws SQLException{
		String sql = "select * from Comment where comment_post_num = ?";
		ArrayList coList = new ArrayList<comment>();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_post_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment co = new comment();
				co.setComment_post_num(rs.getInt(1));
				co.setComment_table_num(rs.getInt(2));
				co.setComment_member_id(rs.getString(3));
				co.setComment_num(rs.getInt(4));
				co.setComment_date(rs.getString(5));
				co.setComment_content(rs.getString(6));
				coList.add(co);
			}
			return coList; 
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
		}
		return null;
	}
	
	public ArrayList<comment> getCommentHistory(String comment_member_id,Integer page_num) throws SQLException{
		String sql = "select * from Comment where comment_member_id = ? order by comment_num desc limit ?,?";
		ArrayList coList = new ArrayList<comment>();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,comment_member_id);
			pstmt.setInt(2, (page_num-1)*10);
			pstmt.setInt(3, page_num*10);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				comment co = new comment();
				co.setComment_post_num(rs.getInt(1));
				co.setComment_table_num(rs.getInt(2));
				co.setComment_member_id(rs.getString(3));
				co.setComment_num(rs.getInt(4));
				co.setComment_date(rs.getString(5));
				co.setComment_content(rs.getString(6));
				coList.add(co);
			}
			return coList;
		}catch(Exception e) {
			
		}finally {
			if(pstmt !=null) {
				pstmt.close();
			}
		}
		return null;
	}

}