package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

public class ScheduleRecord_DTO {
	private String user_id;
	private String pl_date;
	private String pl_sub;
	private String pl_content;
	private String pro_name;
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPl_date() {
		return pl_date;
	}

	public void setPl_date(String pl_date) {
		this.pl_date = pl_date;
	}

	public String getPl_sub() {
		return pl_sub;
	}

	public void setPl_sub(String pl_sub) {
		this.pl_sub = pl_sub;
	}

	public String getPl_content() {
		return pl_content;
	}

	public void setPl_content(String pl_content) {
		this.pl_content = pl_content;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	@Override
	public String toString() {
		return "{user_id:'" + user_id + "', pl_date:'"
				+ pl_date + "', pl_sub:'" + pl_sub + "', pl_content:'" + pl_content
				+ "', pro_name:'" + pro_name + "'}";
	}
	
}
