package kr.co.ohdeokrionline.model.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Member_DTO {
	// NOT NULL
	private String user_id;
	private String user_name;
	private String password;
	private String email;
	private String addr;
	private String addd;
	private String cell_phone;
	private String add_code;
	
	// NULL
	private String enabled;
	private String photo;
	
	//단일 파일 처리 upload => MultipartFile 인터페이스 사용을 위해서//
	private CommonsMultipartFile file;
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
			
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddd() {
		return addd;
	}
	public void setAddd(String addd) {
		this.addd = addd;
	}
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	public String getAdd_code() {
		return add_code;
	}
	public void setAdd_code(String add_code) {
		this.add_code = add_code;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "Member_DTO [user_id=" + user_id + ", user_name=" + user_name
				+ ", password=" + password + ", email=" + email + ", addr="
				+ addr + ", addd=" + addd + ", cell_phone=" + cell_phone
				+ ", add_code=" + add_code + ", enabled=" + enabled
				+ ", photo=" + photo + ", file=" + file + "]";
	}
}
