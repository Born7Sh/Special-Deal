package bi;

import java.io.Serializable;

public class comment implements Serializable {


	private Integer comment_table_num;
	private Integer comment_post_num;
	private Integer comment_num;
	private String comment_content;
	private String comment_member_id;
	private String comment_date;

	public comment() {
		super();
	}

	public void setComment_table_num(Integer comment_table_num) {
		this.comment_table_num=comment_table_num;
	}
	public Integer getComment_table_num() {
		return this.comment_table_num;
	}
	public void setComment_post_num(Integer comment_post_num) {
		this.comment_post_num = comment_post_num;
	}
	public Integer getComment_post_num() {
		return this.comment_post_num;
	}
	public void setComment_num(Integer comment_num) {
		this.comment_num= comment_num;
	}
	public Integer getComment_num() {
		return this.comment_num;
	}
	
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_content() {
		return this.comment_content;
	}
	
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_date() {
		return this.comment_date;
	}
	
	public void setComment_member_id(String comment_member_id) {
		this.comment_member_id = comment_member_id;
	}
	public String getComment_member_id() {
		return this.comment_member_id;
	}
	
}