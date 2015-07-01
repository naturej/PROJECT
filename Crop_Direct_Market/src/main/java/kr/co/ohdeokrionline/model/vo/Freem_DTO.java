package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Freem_DTO {
	private int fm_id;
	private String fm_subject;
	private String fm_content;
	private String fm_location;
	private String fm_time;
	private Date fm_date;
	private Date writedate;
	private String fm_photo;
	private String farminfo;
	private String pro_name;
	private CommonsMultipartFile file;
	private String editor1;
	
	public int getFm_id() {
		return fm_id;
	}
	public void setFm_id(int fm_id) {
		this.fm_id = fm_id;
	}
	public String getFm_subject() {
		return fm_subject;
	}
	public void setFm_subject(String fm_subject) {
		this.fm_subject = fm_subject;
	}
	public String getFm_content() {
		return fm_content;
	}
	public void setFm_content(String fm_content) {
		this.fm_content = fm_content;
	}
	public String getFm_location() {
		return fm_location;
	}
	public void setFm_location(String fm_location) {
		this.fm_location = fm_location;
	}
	public String getFm_time() {
		return fm_time;
	}
	public void setFm_time(String fm_time) {
		this.fm_time = fm_time;
	}
	public Date getFm_date() {
		return fm_date;
	}
	public void setFm_date(Date fm_date) {
		this.fm_date = fm_date;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getFm_photo() {
		return fm_photo;
	}
	public void setFm_photo(String fm_photo) {
		this.fm_photo = fm_photo;
	}
	public String getFarminfo() {
		return farminfo;
	}
	public void setFarminfo(String farminfo) {
		this.farminfo = farminfo;
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
	public String getEditor1() {
		return editor1;
	}
	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}
}
