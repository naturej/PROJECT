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
	
	//리뷰(ReviewWrite_DTO)
	private int re_id;
	private String re_content;
	private Date re_date;
	private float re_score;
	private String review_id;
	
	//판매자 정보(FarmRecord_DTO)
	private String farm_add;
	private String farminfo;
	
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
	
	// 리뷰
	
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public float getRe_score() {
		return re_score;
	}
	public void setRe_score(float re_score) {
		this.re_score = re_score;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

}
