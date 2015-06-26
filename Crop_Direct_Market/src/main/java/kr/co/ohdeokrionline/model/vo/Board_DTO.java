package kr.co.ohdeokrionline.model.vo;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Board_DTO {
	private int idx;
	private String subject;
	private int count;
	private String content;
	private Date writedate;
	private String filename;
	private int filesize;
	private String user_id;
	private CommonsMultipartFile file;
	private String editor1;
	
	public String getEditor1() {
		return editor1;
	}
	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	
}
