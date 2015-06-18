package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Market_DTO {
	private int mar_id;
	private String mar_subject;
	private String mar_content;
	private String mar_location;
	private Date mar_date;
	private String mar_time;
	private String mar_photo;
	private String writedate;
	
	private int mar_maxshop;
	private CommonsMultipartFile file;
	
	public int getMar_id() {
		return mar_id;
	}
	public void setMar_id(int mar_id) {
		this.mar_id = mar_id;
	}
	
	public String getMar_subject() {
		return mar_subject;
	}
	public void setMar_subject(String mar_subject) {
		this.mar_subject = mar_subject;
	}
	
	public String getMar_content() {
		return mar_content;
	}
	public void setMar_content(String mar_content) {
		this.mar_content = mar_content;
	}
	
	public String getMar_location() {
		return mar_location;
	}
	public void setMar_location(String mar_location) {
		this.mar_location = mar_location;
	}
	
	public Date getMar_date() {
		return mar_date;
	}
	public void setMar_date(Date mar_date) {
		this.mar_date = mar_date;
	}
	
	public String getMar_time() {
		return mar_time;
	}
	public void setMar_time(String mar_time) {
		this.mar_time = mar_time;
	}
	
	public String getMar_photo() {
		return mar_photo;
	}
	public void setMar_photo(String mar_photo) {
		this.mar_photo = mar_photo;
	}
	
	public int getMar_maxshop() {
		return mar_maxshop;
	}
	public void setMar_maxshop(int mar_maxshop) {
		this.mar_maxshop = mar_maxshop;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
}
