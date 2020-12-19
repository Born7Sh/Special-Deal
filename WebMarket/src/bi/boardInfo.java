package bi;

import java.io.File;
import java.io.Serializable;

public class boardInfo implements Serializable {


	private Integer table_num;
	private Integer category_num;
	private Integer post_num;
	private String post_title;
	private String post_content;
	private String post_image;
	private String post_date;
	private String sale_start;
	private String sale_end;
	private String post_member_id;
	private Integer post_read;
	private Integer post_recommend;
	private String post_link;
	
	public boardInfo() {
		super();
	}

	public void setTable_num(Integer table_num) {
		this.table_num=table_num;
	}
	public Integer getTable_num() {
		return this.table_num;
	}
	public void setCategory_num(Integer category_num) {
		this.category_num = category_num;
	}
	public Integer getCategory_num() {
		return this.category_num;
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
	public void setPost_image(String post_image) {
		this.post_image = post_image;
	}
	public String getPost_image() {
		return this.post_image;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_date() {
		return this.post_date;
	}
	public void setSale_start(String sale_start) {
		this.sale_start = sale_start;
	}
	public String getSale_start() {
		return this.sale_start;
	}
	public void setSale_end(String sale_end) {
		this.sale_end = sale_end;
	}
	public String getSale_end() {
		return this.sale_end;
	}
	public void setPost_member_id(String post_member_id) {
		this.post_member_id = post_member_id;
	}
	public String getPost_member_id() {
		return this.post_member_id;
	}
	public void setPost_read(Integer post_read) {
		this.post_read = post_read;
	}
	public Integer getPost_read() {
		return this.post_read;
	}
	public void setPost_recommend(Integer post_recommend) {
		this.post_recommend = post_recommend;
	}
	public Integer getPost_recommend() {
		return this.post_recommend;
	}
	public void setPost_link(String post_link) {
		this.post_link = post_link;
	}
	public String getPost_link() {
		return this.post_link;
	}
}