package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

public class B_reply_DTO {
	private int re_idx;
	private String re_content;
	private Date re_writedate;
	private String user_id;
	private int idx;
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_writedate() {
		return re_writedate;
	}
	public void setRe_writedate(Date re_writedate) {
		this.re_writedate = re_writedate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
