package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

public class ReviewWrite_DTO {
	private int re_id;
	private String re_content;
	private Date re_date;
	private float re_score;
	private String user_id;
	private int bo_num;
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public float getRe_score() {
		return re_score;
	}
	public void setRe_score(float re_score) {
		this.re_score = re_score;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	
	public ReviewWrite_DTO(){}
	
	public ReviewWrite_DTO(int re_id, String re_content, Date re_date,
			float re_score, String user_id, int bo_num) {
		this.re_id = re_id;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_score = re_score;
		this.user_id = user_id;
		this.bo_num = bo_num;
	}
	@Override
	public String toString() {
		return "ReviewWrite_DTO [re_id=" + re_id + ", re_content=" + re_content
				+ ", re_date=" + re_date + ", re_score=" + re_score
				+ ", user_id=" + user_id + ", bo_num=" + bo_num + "]";
	}


}