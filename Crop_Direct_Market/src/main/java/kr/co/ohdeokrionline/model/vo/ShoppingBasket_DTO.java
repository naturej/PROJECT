package kr.co.ohdeokrionline.model.vo;

public class ShoppingBasket_DTO {
	private String user_id;
	private int bo_num;
	private int sh_quantity;
	private int sh_price;
	
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
}
