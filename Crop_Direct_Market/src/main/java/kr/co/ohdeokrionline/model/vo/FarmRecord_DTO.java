package kr.co.ohdeokrionline.model.vo;

/*
FARMINFO     NOT NULL VARCHAR2(20)  
PRO_NAME     NOT NULL VARCHAR2(20)  
FARM_NAME    NOT NULL VARCHAR2(30)  
FARM_PHON    NOT NULL VARCHAR2(20)  
FARM_COMMENT NOT NULL VARCHAR2(600) 
FARM_ADD     NOT NULL VARCHAR2(40)  
FARM_ADD_DE  NOT NULL VARCHAR2(40)  
FARM_PHOTO            VARCHAR2(30)  
USER_ID      NOT NULL VARCHAR2(20)
*/
public class FarmRecord_DTO {
	// null
	private String farminfo;
	private String pro_name;
	private String farm_phon;
	private String farm_comment;
	private String farm_add_code;
	private String farm_add;
	private String farm_add_de;
	private String user_id;
	
	// Not null
	private String farm_photo;

	public String getFarminfo() {
		return farminfo;
	}

	public void setFarminfo(String farminfo) {
		this.farminfo = farminfo;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getFarm_phon() {
		return farm_phon;
	}

	public void setFarm_phon(String farm_phon) {
		this.farm_phon = farm_phon;
	}

	public String getFarm_comment() {
		return farm_comment;
	}

	public void setFarm_comment(String farm_comment) {
		this.farm_comment = farm_comment;
	}

	public String getFarm_add() {
		return farm_add;
	}

	public void setFarm_add(String farm_add) {
		this.farm_add = farm_add;
	}

	public String getFarm_add_de() {
		return farm_add_de;
	}

	public void setFarm_add_de(String farm_add_de) {
		this.farm_add_de = farm_add_de;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFarm_photo() {
		return farm_photo;
	}

	public void setFarm_photo(String farm_photo) {
		this.farm_photo = farm_photo;
	}

	public String getFarm_add_code() {
		return farm_add_code;
	}

	public void setFarm_add_code(String farm_add_code) {
		this.farm_add_code = farm_add_code;
	}

	@Override
	public String toString() {
		return "FarmRecord_DTO [farminfo=" + farminfo + ", pro_name="
				+ pro_name + ", farm_phon=" + farm_phon + ", farm_comment="
				+ farm_comment + ", farm_add_code=" + farm_add_code
				+ ", farm_add=" + farm_add + ", farm_add_de=" + farm_add_de
				+ ", user_id=" + user_id + ", farm_photo=" + farm_photo + "]";
	}
	
}
