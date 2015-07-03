package kr.co.ohdeokrionline.model.vo;

public class Account_DTO {
	private String accountnum;
	private String bank;
	private String user_id;
	
	private String ACCOUNTNUM;
	private String BANK;
	private String USER_ID;
	public String getACCOUNTNUM() {
		return ACCOUNTNUM;
	}
	public void setACCOUNTNUM(String aCCOUNTNUM) {
		ACCOUNTNUM = aCCOUNTNUM;
	}
	public String getBANK() {
		return BANK;
	}
	public void setBANK(String bANK) {
		BANK = bANK;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	@Override
	public String toString() {
		return "Account_DTO [ACCOUNTNUM=" + ACCOUNTNUM + ", BANK=" + BANK
				+ ", USER_ID=" + USER_ID + "]";
	}
	public Account_DTO(String aCCOUNTNUM, String bANK, String uSER_ID) {
		super();
		ACCOUNTNUM = aCCOUNTNUM;
		BANK = bANK;
		USER_ID = uSER_ID;
	}
	

	
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
