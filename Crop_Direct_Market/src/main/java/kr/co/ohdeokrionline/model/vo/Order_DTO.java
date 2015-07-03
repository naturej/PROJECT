package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

public class Order_DTO {

	// ORDERLIST TABLE
	String or_id;
	String OR_ID;
	int bo_num;
	int or_quan;
	Date or_date;
	String buy_userid;
	int or_cost;
	String or_state;
	String sell_userid;
	String or_addd;
	String or_addr;
	String or_how;
	String add_code;

	
public String getOR_ID() {
		return OR_ID;
	}

	public void setOR_ID(String oR_ID) {
		OR_ID = oR_ID;
	}

	public String getOr_id() {
		return or_id;
	}

	public void setOr_id(String or_id) {
		this.or_id = or_id;
	}

	// join문 이용을 위한 salboard_DTO
	private String bo_content;
	private String bo_subject;
	private String BO_SUBJECT;
	private String bo_photo;
	private int bo_price;
	private Date bo_date;
	private String user_id;
	private String unit;
	private String PRO_NAME;
	private String pro_name;
	int OR_QUAN;
	String BUY_USERID;
	int OR_COST;
	String OR_STATE;

	public String getBUY_USERID() {
		return BUY_USERID;
	}

	public void setBUY_USERID(String bUY_USERID) {
		BUY_USERID = bUY_USERID;
	}

	public int getOR_COST() {
		return OR_COST;
	}

	public void setOR_COST(int oR_COST) {
		OR_COST = oR_COST;
	}

	public String getOR_STATE() {
		return OR_STATE;
	}

	public void setOR_STATE(String oR_STATE) {
		OR_STATE = oR_STATE;
	}

	public int getOR_QUAN() {
		return OR_QUAN;
	}

	public void setOR_QUAN(int oR_QUAN) {
		OR_QUAN = oR_QUAN;
	}

	public String getPRO_NAME() {
		return PRO_NAME;
	}

	public void setPRO_NAME(String pRO_NAME) {
		PRO_NAME = pRO_NAME;
	}

	public String getBO_SUBJECT() {
		return BO_SUBJECT;
	}

	public void setBO_SUBJECT(String bO_SUBJECT) {
		BO_SUBJECT = bO_SUBJECT;
	}

	public String getAdd_code() {
		return add_code;
	}

	public void setAdd_code(String add_code) {
		this.add_code = add_code;
	}

	public String getOr_how() {
		return or_how;
	}

	public void setOr_how(String or_how) {
		this.or_how = or_how;
	}

	public String getOr_addd() {
		return or_addd;
	}

	public void setOr_addd(String or_addd) {
		this.or_addd = or_addd;
	}

	public String getOr_addr() {
		return or_addr;
	}

	public void setOr_addr(String or_addr) {
		this.or_addr = or_addr;
	}

	/*
	 * public String getOr_id() { return or_id; } public void setOr_id(String
	 * or_id) { this.or_id = or_id; }
	 */
	public int getBo_num() {
		return bo_num;
	}

	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}

	public int getOr_quan() {
		return or_quan;
	}

	public void setOr_quan(int or_quan) {
		this.or_quan = or_quan;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getBuy_userid() {
		return buy_userid;
	}

	public void setBuy_userid(String buy_userid) {
		this.buy_userid = buy_userid;
	}

	public int getOr_cost() {
		return or_cost;
	}

	public void setOr_cost(int or_cost) {
		this.or_cost = or_cost;
	}

	public String getOr_state() {
		return or_state;
	}

	public void setOr_state(String or_state) {
		this.or_state = or_state;
	}

	public String getSell_userid() {
		return sell_userid;
	}

	public void setSell_userid(String sell_userid) {
		this.sell_userid = sell_userid;
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

	@Override
	public String toString() {
		return "Order_DTO [or_id=" + ", bo_num=" + bo_num + ", or_quan="
				+ or_quan + ", or_date=" + or_date + ", buy_userid="
				+ buy_userid + ", or_cost=" + or_cost + ", or_state="
				+ or_state + ", sell_userid=" + sell_userid + ", or_addd="
				+ or_addd + ", or_addr=" + or_addr + ", bo_content="
				+ bo_content + ", bo_subject=" + bo_subject + ", bo_photo="
				+ bo_photo + ", bo_price=" + bo_price + ", bo_date=" + bo_date
				+ ", user_id=" + user_id + ", unit=" + unit + ", pro_name="
				+ pro_name + "]";
	}

}
