package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

public class SaleBoard_DTO {
	private int bo_num;
	private String bo_content;
	private String bo_subject;
	private String bo_photo;
	private int bo_price;
	private Date bo_date;
	private String user_id;
	private String unit;
	private String pro_name;

	public int getBo_num() {
		return bo_num;
	}

	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_subject() {
		return bo_subject;
	}

	public void setBo_subject(String bo_subject) {
		this.bo_subject = bo_subject;
	}

	public String getBo_photo() {
		return bo_photo;
	}

	public void setBo_photo(String bo_photo) {
		this.bo_photo = bo_photo;
	}

	public int getBo_price() {
		return bo_price;
	}

	public void setBo_price(int bo_price) {
		this.bo_price = bo_price;
	}

	public Date getBo_date() {
		return bo_date;
	}

	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public SaleBoard_DTO(int bo_num, String bo_content, String bo_subject,
			String bo_photo, int bo_price, Date bo_date, String user_id,
			String unit, String pro_name) {
		this.bo_num = bo_num;
		this.bo_content = bo_content;
		this.bo_subject = bo_subject;
		this.bo_photo = bo_photo;
		this.bo_price = bo_price;
		this.bo_date = bo_date;
		this.user_id = user_id;
		this.unit = unit;
		this.pro_name = pro_name;
	}

	// 사진 안 받는 생성자
	public SaleBoard_DTO(int bo_num, String bo_content, String bo_subject,
			int bo_price, Date bo_date, String user_id, String unit,
			String pro_name) {
		super();
		this.bo_num = bo_num;
		this.bo_content = bo_content;
		this.bo_subject = bo_subject;
		this.bo_price = bo_price;
		this.bo_date = bo_date;
		this.user_id = user_id;
		this.unit = unit;
		this.pro_name = pro_name;
	}

	public SaleBoard_DTO() {
	}

	@Override
	public String toString() {
		return "SaleBoard_DTO [bo_num=" + bo_num + ", bo_content=" + bo_content
				+ ", bo_subject=" + bo_subject + ", bo_photo=" + bo_photo
				+ ", bo_price=" + bo_price + ", bo_date=" + bo_date
				+ ", user_id=" + user_id + ", unit=" + unit + ", pro_name="
				+ pro_name + "]";
	}

}
