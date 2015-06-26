package kr.co.ohdeokrionline.model.vo;

public class ShoppingBasket_DTO {
	private String user_id;
	private int bo_num;
	private int sh_quantity;
	private int sh_price;
	
	// 판매게시판 컬럼
	private String sell_id;
	private String bo_subject;
	private String bo_photo;
	private int bo_price;
	
	// 에누리 컬럼
	private int enu_quan;
	private int enu_price;
	
	
	// 장바구니
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public int getSh_quantity() {
		return sh_quantity;
	}
	public void setSh_quantity(int sh_quantity) {
		this.sh_quantity = sh_quantity;
	}
	public int getSh_price() {
		return sh_price;
	}
	public void setSh_price(int sh_price) {
		this.sh_price = sh_price;
	}
	
	// 판매게시판
	public String getSell_id() {
		return sell_id;
	}
	public void setSell_id(String sell_id) {
		this.sell_id = sell_id;
	}
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
	public String getBo_photo() {
		return bo_photo;
	}
	public void setBo_photo(String bo_photo) {
		this.bo_photo = bo_photo;
	}
		
	// 에누리
	public int getEnu_quan() {
		return enu_quan;
	}
	public void setEnu_quan(int enu_quan) {
		this.enu_quan = enu_quan;
	}
	public int getEnu_price() {
		return enu_price;
	}
	public void setEnu_price(int enu_price) {
		this.enu_price = enu_price;
	}
}
