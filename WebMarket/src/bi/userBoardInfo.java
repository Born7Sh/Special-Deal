package bi;

import java.io.Serializable;

public class userBoardInfo implements Serializable {


	private Integer table_num;

	private Integer post_num;
	private String post_title;
	private String post_content;
	private String post_date;
	private String member_id;


	public userBoardInfo() {
		super();
	}

	public void setTable_num(Integer table_num) {
		this.table_num=table_num;
	}
	public Integer getTable_num() {
		return this.table_num;
	}
	
	public void setPost_num(Integer post_num) {
		this.post_num= post_num;
	}
	public Integer getPost_num() {
		return this.post_num;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_title(){
		return this.post_title;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_content() {
		return this.post_content;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_date() {
		return this.post_date;
	}
	
	public void setPost_member_id(String post_member_id) {
		this.member_id = post_member_id;
	}
	public String getPost_member_id() {
		return this.member_id;
	}
	
}