package kr.co.ohdeokrionline.model.vo;

import java.sql.Date;

public class ScheduleRecord2_DTO {
	private String user_id;
	private String start;
	private String end;
	private String title;
	private String content;
	private String pro_name;
	
	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getStart() {
		return start;
	}



	public void setStart(String start) {
		this.start = start;
	}



	public String getEnd() {
		return end;
	}



	public void setEnd(String end) {
		this.end = end;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getPro_name() {
		return pro_name;
	}



	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	

	@Override
	public String toString() {
		return "{user_id:'" + user_id + "', start:'"
				+ start +"', end:'" + end 
				+ "', title:'" + title + "', content:'" + content
				+ "', pro_name:'" + pro_name + "'}";
	}
}
