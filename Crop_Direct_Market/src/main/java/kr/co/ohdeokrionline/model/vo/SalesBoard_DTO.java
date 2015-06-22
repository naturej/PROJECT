package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class SalesBoard_DTO {

	private int bo_num;
	private String bo_subject;
	private String bo_content;
	private String bo_photo;
	private int bo_price;
	private Date bo_date;
	private String user_id;
	private String unit;
	private String pro_name;
	private int bo_salnum;
	
	public int getBo_salnum() {
		return bo_salnum;
	}
	public void setBo_salnum(int bo_salnum) {
		this.bo_salnum = bo_salnum;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_subject() {
		return bo_subject;
	}
	public void setBo_subject(String bo_subject) {
		this.bo_subject = bo_subject;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
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
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	private CommonsMultipartFile file;
	
	
	
}
