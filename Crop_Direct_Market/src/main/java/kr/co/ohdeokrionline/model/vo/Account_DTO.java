package kr.co.ohdeokrionline.model.vo;

public class Account_DTO {
	private String accountnum;
	private String bank;
	private String user_id;
	
//	추가
	Account_DTO(){}
	
	public String getAccountnum() {
		return accountnum;
	}
	public void setAccountnum(String accountnum) {
		this.accountnum = accountnum;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
