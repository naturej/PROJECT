package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.Member_DTO;
import kr.co.ohdeokrionline.model.vo.UserManage_DTO;

public interface Member_Dao {
	int joinInsert(Member_DTO member) throws ClassNotFoundException, SQLException;
	Member_DTO login(String user_id) throws SQLException;
	String getUser_idByEmail(String email) throws SQLException;
	String getPwdByUser_idAndEmail(String user_id,String email) throws SQLException;
	String check_user_id(String user_id) throws SQLException;
	String check_email(String email) throws SQLException;
	int userInfoUpdate(Member_DTO member) throws ClassNotFoundException, SQLException;
	List<Member_DTO> getUserAll() throws SQLException;
	int enabledUpdate(UserManage_DTO user) throws SQLException;
}
