package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

public class Message_DTO {
	private int me_num;
	private String me_subject;
	private String me_content;
	private Date me_date;
	private String send_userid;
	private String rec_userid;
	private int me_count;
	
	public int getMe_num() {
		return me_num;
	}
	public void setMe_num(int me_num) {
		this.me_num = me_num;
	}
	public String getMe_subject() {
		return me_subject;
	}
	public void setMe_subject(String me_subject) {
		this.me_subject = me_subject;
	}
	public String getMe_content() {
		return me_content;
	}
	public void setMe_content(String me_content) {
		this.me_content = me_content;
	}
	public Date getMe_date() {
		return me_date;
	}
	public void setMe_date(Date me_date) {
		this.me_date = me_date;
	}
	public String getSend_userid() {
		return send_userid;
	}
	public void setSend_userid(String send_userid) {
		this.send_userid = send_userid;
	}
	public String getRec_userid() {
		return rec_userid;
	}
	public void setRec_userid(String rec_userid) {
		this.rec_userid = rec_userid;
	}
	public int getMe_count() {
		return me_count;
	}
	public void setMe_count(int me_count) {
		this.me_count = me_count;
	}

}
