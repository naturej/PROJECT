package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

public class Enuri_DTO {
	private int bo_num;
	private int enu_idx;
	private String user_id;
	private String enu_content;
	private Date enu_date;
	private int enu_quan;
	private String enu_confirm;
	private int enu_price;
	
	// 판매게시판
	private String bo_subject;
	private int bo_price;
	private String sell_id;
	
	public Enuri_DTO(){}
	
	public Enuri_DTO(int bo_num, String user_id, String enu_content,
			Date enu_date, int enu_quan, String enu_confirm, int enu_price,
			int enu_idx) {
		this.bo_num = bo_num;
		this.user_id = user_id;
		this.enu_content = enu_content;
		this.enu_date = enu_date;
		this.enu_quan = enu_quan;
		this.enu_confirm = enu_confirm;
		this.enu_price = enu_price;
		this.enu_idx = enu_idx;
	}
	
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public int getEnu_idx() {
		return enu_idx;
	}
	public void setEnu_idx(int enu_idx) {
		this.enu_idx = enu_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEnu_content() {
		return enu_content;
	}
	public void setEnu_content(String enu_content) {
		this.enu_content = enu_content;
	}
	public Date getEnu_date() {
		return enu_date;
	}
	public void setEnu_date(Date enu_date) {
		this.enu_date = enu_date;
	}
	public int getEnu_quan() {
		return enu_quan;
	}
	public void setEnu_quan(int enu_quan) {
		this.enu_quan = enu_quan;
	}
	public String getEnu_confirm() {
		return enu_confirm;
	}
	public void setEnu_confirm(String enu_confirm) {
		this.enu_confirm = enu_confirm;
	}
	public int getEnu_price() {
		return enu_price;
	}
	public void setEnu_price(int enu_price) {
		this.enu_price = enu_price;
	}
	
	//판매게시판
	public String getBo_subject() {
		return bo_subject;
	}

	public void setBo_subject(String bo_subject) {
		this.bo_subject = bo_subject;
	}

	public int getBo_price() {
		return bo_price;
	}

	public void setBo_price(int bo_price) {
		this.bo_price = bo_price;
	}

	public String getSell_id() {
		return sell_id;
	}

	public void setSell_id(String sell_id) {
		this.sell_id = sell_id;
	}

}
