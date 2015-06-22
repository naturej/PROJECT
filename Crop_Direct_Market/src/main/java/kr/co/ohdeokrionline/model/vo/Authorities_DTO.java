package kr.co.ohdeokrionline.model.vo;

public class Authorities_DTO {
	private String authority;
	private String user_id;
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "Authorities_DTO [authority=" + authority + ", user_id="
				+ user_id + "]";
	}
}
