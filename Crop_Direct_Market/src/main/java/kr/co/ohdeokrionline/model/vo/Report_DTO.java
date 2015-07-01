package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

// 신고 테이블
public class Report_DTO {
	
	private String user_send;	// 신고자
	private int bo_num;			// 게시글 번호
	private String user_rec;	// 피신고자
	private String rep_content;	// 신고내용
	private Date rep_date;		// 신고날짜

	public String getUser_send() {
		return user_send;
	}
	public void setUser_send(String user_send) {
		this.user_send = user_send;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getUser_rec() {
		return user_rec;
	}
	public void setUser_rec(String user_rec) {
		this.user_rec = user_rec;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public Date getRep_date() {
		return rep_date;
	}
	public void setRep_date(Date rep_date) {
		this.rep_date = rep_date;
	}

}
