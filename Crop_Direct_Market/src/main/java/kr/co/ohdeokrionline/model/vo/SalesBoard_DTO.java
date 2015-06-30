package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class SalesBoard_DTO {

	private int bo_num;
	private String bo_subject;
	private String bo_content;
	
	private String editor1;
	private String bo_photo;
	private int bo_price;
	private Date bo_date;
	private String user_id;
	private String unit;
	private String pro_name;
	private String sep;
	private int bo_salnum;
	
	//판매자 정보(FarmRecord_DTO)
	private String farm_add;
	private String farminfo;
	
	public int getBo_salnum() {
		return bo_salnum;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
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
	public String getEditor1() {
		return editor1;
	}
	public void setEditor1(String editor1) {
		this.editor1 = editor1;
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
	public String getSep() {
		return sep;
	}
	public void setSep(String sep) {
		this.sep = sep;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	private CommonsMultipartFile file;

	// 판매자 정보

	public String getFarm_add() {
		return farm_add;
	}
	public void setFarm_add(String farm_add) {
		this.farm_add = farm_add;
	}
	public String getFarminfo() {
		return farminfo;
	}
	public void setFarminfo(String farminfo) {
		this.farminfo = farminfo;
	}
}
