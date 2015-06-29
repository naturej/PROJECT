package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

public class Order_DTO {
	private String OR_ID;
	private int OR_QUAN;
	private int BO_NUM;
	private Date OR_DATE;
	private String BUY_USERID;
	private int OR_COST;
	private String OR_STATE;
	private String SELL_USERID;
	private String BO_CONTENT;
	private String BO_SUBJECT;
	private String BO_PHOTO;
	private int BO_PRICE;
	private Date BO_DATE;
	private String USER_ID;
	private String UNIT;
	private String PRO_NAME;
	
	public Order_DTO(){}

	public String getOR_ID() {
		return OR_ID;
	}

	public void setOR_ID(String oR_ID) {
		OR_ID = oR_ID;
	}

	public int getOR_QUAN() {
		return OR_QUAN;
	}

	public void setOR_QUAN(int oR_QUAN) {
		OR_QUAN = oR_QUAN;
	}

	public int getBO_NUM() {
		return BO_NUM;
	}

	public void setBO_NUM(int bO_NUM) {
		BO_NUM = bO_NUM;
	}

	public Date getOR_DATE() {
		return OR_DATE;
	}

	public void setOR_DATE(Date oR_DATE) {
		OR_DATE = oR_DATE;
	}

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

	public String getSELL_USERID() {
		return SELL_USERID;
	}

	public void setSELL_USERID(String sELL_USERID) {
		SELL_USERID = sELL_USERID;
	}

	public String getBO_CONTENT() {
		return BO_CONTENT;
	}

	public void setBO_CONTENT(String bO_CONTENT) {
		BO_CONTENT = bO_CONTENT;
	}

	public String getBO_SUBJECT() {
		return BO_SUBJECT;
	}

	public void setBO_SUBJECT(String bO_SUBJECT) {
		BO_SUBJECT = bO_SUBJECT;
	}

	public String getBO_PHOTO() {
		return BO_PHOTO;
	}

	public void setBO_PHOTO(String bO_PHOTO) {
		BO_PHOTO = bO_PHOTO;
	}

	public int getBO_PRICE() {
		return BO_PRICE;
	}

	public void setBO_PRICE(int bO_PRICE) {
		BO_PRICE = bO_PRICE;
	}

	public Date getBO_DATE() {
		return BO_DATE;
	}

	public void setBO_DATE(Date bO_DATE) {
		BO_DATE = bO_DATE;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getUNIT() {
		return UNIT;
	}

	public void setUNIT(String uNIT) {
		UNIT = uNIT;
	}

	public String getPRO_NAME() {
		return PRO_NAME;
	}

	public void setPRO_NAME(String pRO_NAME) {
		PRO_NAME = pRO_NAME;
	}

	public Order_DTO(String oR_ID, int oR_QUAN, int bO_NUM, Date oR_DATE,
			String bUY_USERID, int oR_COST, String oR_STATE,
			String sELL_USERID, String bO_CONTENT, String bO_SUBJECT,
			String bO_PHOTO, int bO_PRICE, Date bO_DATE, String uSER_ID,
			String uNIT, String pRO_NAME) {
		super();
		OR_ID = oR_ID;
		OR_QUAN = oR_QUAN;
		BO_NUM = bO_NUM;
		OR_DATE = oR_DATE;
		BUY_USERID = bUY_USERID;
		OR_COST = oR_COST;
		OR_STATE = oR_STATE;
		SELL_USERID = sELL_USERID;
		BO_CONTENT = bO_CONTENT;
		BO_SUBJECT = bO_SUBJECT;
		BO_PHOTO = bO_PHOTO;
		BO_PRICE = bO_PRICE;
		BO_DATE = bO_DATE;
		USER_ID = uSER_ID;
		UNIT = uNIT;
		PRO_NAME = pRO_NAME;
	}

	@Override
	public String toString() {
		return "Order_DTO [OR_ID=" + OR_ID + ", OR_QUAN=" + OR_QUAN
				+ ", BO_NUM=" + BO_NUM + ", OR_DATE=" + OR_DATE
				+ ", BUY_USERID=" + BUY_USERID + ", OR_COST=" + OR_COST
				+ ", OR_STATE=" + OR_STATE + ", SELL_USERID=" + SELL_USERID
				+ ", BO_CONTENT=" + BO_CONTENT + ", BO_SUBJECT=" + BO_SUBJECT
				+ ", BO_PHOTO=" + BO_PHOTO + ", BO_PRICE=" + BO_PRICE
				+ ", BO_DATE=" + BO_DATE + ", USER_ID=" + USER_ID + ", UNIT="
				+ UNIT + ", PRO_NAME=" + PRO_NAME + "]";
	};
	
	
	
}
