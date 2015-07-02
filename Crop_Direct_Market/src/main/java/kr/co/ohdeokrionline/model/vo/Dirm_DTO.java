package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

public class Dirm_DTO {	/*직거래 쪽지 테이블*/
	private int dirmno;	/*직거래 쪽지 번호*/
	private String user_send; /*보내는 사람*/
	private String user_rec; /*받는 사람*/
	private String dirm_sub; /*쪽지 제목*/
	private String dirm_content; /*쪽지 내용*/
	private String pro_id; /*직거래 품종*/
	private Date dirm_startdate; /*직거래 시작날짜*/
	private Date dirm_enddate; /*직거래 종료날짜*/
	private String dirm_confirm; /*직거래 승인여부*/
	
	public int getDirmno() {
		return dirmno;
	}
	public void setDirmno(int dirmno) {
		this.dirmno = dirmno;
	}
	public String getUser_send() {
		return user_send;
	}
	public void setUser_send(String user_send) {
		this.user_send = user_send;
	}
	public String getUser_rec() {
		return user_rec;
	}
	public void setUser_rec(String user_rec) {
		this.user_rec = user_rec;
	}
	public String getDirm_sub() {
		return dirm_sub;
	}
	public void setDirm_sub(String dirm_sub) {
		this.dirm_sub = dirm_sub;
	}
	public String getDirm_content() {
		return dirm_content;
	}
	public void setDirm_content(String dirm_content) {
		this.dirm_content = dirm_content;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public Date getDirm_startdate() {
		return dirm_startdate;
	}
	public void setDirm_startdate(Date dirm_startdate) {
		this.dirm_startdate = dirm_startdate;
	}
	public Date getDirm_enddate() {
		return dirm_enddate;
	}
	public void setDirm_enddate(Date dirm_enddate) {
		this.dirm_enddate = dirm_enddate;
	}
	public String getDirm_confirm() {
		return dirm_confirm;
	}
	public void setDirm_confirm(String dirm_confirm) {
		this.dirm_confirm = dirm_confirm;
	}

}
