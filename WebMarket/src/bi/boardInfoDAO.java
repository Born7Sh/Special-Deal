package bi;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class boardInfoDAO{
	private Connection conn;
	private ResultSet rs;

	public boardInfoDAO() {
		
	
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
		PreparedStatement pstmt=null;
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
	public int boardReWrite(Integer Category_num,String post_title,
			String post_content, String post_image,String sale_start,
			String sale_end,String post_link,Integer post_num) throws SQLException, IOException{
		String sql = "update Sale_Table set category_num = ?, post_title = ?, post_content = ?, post_image = ?, sale_start = ?, sale_end = ?, post_link = ? where post_num = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Category_num);
			pstmt.setString(2,post_title);
			pstmt.setString(3,post_content);
			if(post_image.equals("http://kpuweb.iptime.org:8080/image/null")){
				post_image = "http://kpuweb.iptime.org:8080/img/4.jpg";
			}
			pstmt.setString(4, post_image);
			pstmt.setString(5, sale_start);
			pstmt.setString(6, sale_end);
			pstmt.setString(7, post_link);
			pstmt.setInt(8, post_num);
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(SQLException ex){
			ex.printStackTrace();
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
	public int boardWrite(Integer table_num,Integer Category_num,String post_title,
			String post_content, String post_image,String sale_start,
			String sale_end,String post_member_id,String post_link) throws SQLException, IOException {
		String sql = "INSERT INTO Sale_Table (table_num, category_num,  post_title, post_content, post_image,post_date, sale_start, sale_end, post_member_id, post_read, post_recommend,post_link) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, table_num);
			pstmt.setInt(2, Category_num);
			pstmt.setString(3,post_title);
			pstmt.setString(4,post_content);
			if(post_image.equals("http://kpuweb.iptime.org:8080/image/null")){
				post_image = "http://kpuweb.iptime.org:8080/img/4.jpg";
			}
			pstmt.setString(5, post_image);
			pstmt.setString(6,getCurrentDate());
			pstmt.setString(7, sale_start);
			pstmt.setString(8, sale_end);
			pstmt.setString(9,post_member_id);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setString(12, post_link);
			int isSuccess = pstmt.executeUpdate();
			return isSuccess;
		}catch(SQLException ex){
			ex.printStackTrace();
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
	public boardInfo getBoard(Integer post_num) throws SQLException {
		String sql = "select * from Sale_Table where post_num = ?";
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boardInfo bi = new boardInfo();
				bi.setTable_num(rs.getInt(1));
				bi.setCategory_num(rs.getInt(2));
				bi.setPost_num(rs.getInt(3));
				bi.setPost_title(rs.getString(4));
				bi.setPost_content(rs.getString(5));
				bi.setPost_image(rs.getString(6));
				bi.setPost_date(rs.getString(7));
				bi.setSale_start(rs.getString(8));
				bi.setSale_end(rs.getString(9));
				bi.setPost_read(rs.getInt(10));
				bi.setPost_recommend(rs.getInt(11));
				bi.setPost_member_id(rs.getString(12));
				bi.setPost_link(rs.getString(13));
				return bi;
			}
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		return null;
	}
	public ArrayList<boardInfo> getRecoPost() throws SQLException{
		String sql = "select * from Sale_Table where sale_end>(select NOW()) order by post_recommend desc limit 0,3";
		ArrayList biList = new ArrayList<boardInfo>();
		PreparedStatement pstmt=null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boardInfo bi = new boardInfo();
				bi.setTable_num(rs.getInt(1));
				bi.setCategory_num(rs.getInt(2));
				bi.setPost_num(rs.getInt(3));
				bi.setPost_title(rs.getString(4));
				bi.setPost_content(rs.getString(5));
				bi.setPost_image(rs.getString(6));
				bi.setPost_date(rs.getString(7));
				bi.setSale_start(rs.getString(8));
				bi.setSale_end(rs.getString(9));
				bi.setPost_read(rs.getInt(10));
				bi.setPost_recommend(rs.getInt(11));
				bi.setPost_member_id(rs.getString(12));
				bi.setPost_link(rs.getString(13));
				biList.add(bi);
				
			}
			return biList;
		}catch(SQLException ex){
				
			}finally{
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			}
		return null;
	}

	public Integer findReco(Integer post_num,String comment_member_id) throws SQLException {
		String sql = "select * from User_History where member_id = ? and history_recommend = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment_member_id);
			pstmt.setInt(2, post_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return -1;
			}
			return 1;
		}catch(SQLException ex){
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		return 0;
		
	}
	public Integer setReco(Integer comment_post_num,String comment_member_id) throws SQLException {
		Integer isReco;
		isReco = findReco(comment_post_num,comment_member_id);
		if(isReco==1) {
			String sql = "update Sale_Table set post_recommend = post_recommend + 1  where post_num = ?";
			PreparedStatement pstmt=null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, comment_post_num);
				
				int isSuccess = pstmt.executeUpdate();
				
				return isSuccess;
			}catch(SQLException ex){
				
			}finally{
				if(pstmt != null){
					pstmt.close();
				}
				
			}
		}
		return -1;
	}
	
	public byte[] uploadImage(File img) throws IOException {
		try {
			byte[] returnValue = null;
			FileInputStream fins;
			ByteArrayOutputStream bos;
			
			bos = new ByteArrayOutputStream();
			fins = new FileInputStream(img);
			
			byte[] buf = new byte[1024];
			int read = 0;
			
			while((read=fins.read(buf,0,buf.length))!=-1) {
				bos.write(buf,0,read);
			}
			returnValue = bos.toByteArray();
			
			return returnValue;
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public int deletePost(Integer post_num) throws SQLException {
		String sql = "delete from Sale_Table where post_num = ?";
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
	public ArrayList<Integer> getRecoHistory(String member_id,Integer page_num)throws SQLException{
		String sql = "select history_recommend from User_History where member_id = ? order by history_id desc limit ?,?";
		PreparedStatement pstmt = null;
		ArrayList<Integer> recoList = new ArrayList<Integer>();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member_id);
			pstmt.setInt(2, (page_num-1)*12);
			pstmt.setInt(3, page_num*12);
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				recoList.add(rs.getInt(1));
			}
			return recoList;
		}catch(Exception e) {
			
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			
		}
		return null;
	}
	public ArrayList<Integer> getAPList(Integer page_num)throws SQLException{
		String sql = "select post_num from Admin_Post order by post_num desc limit ?,?";
		PreparedStatement pstmt = null;
		ArrayList<Integer> apList = new ArrayList<Integer>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page_num-1)*12);
			pstmt.setInt(2, page_num*12);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				apList.add(rs.getInt(1));
			}
			return apList;
		}catch(Exception e) {
			
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			
		}
		return null;
	}
}