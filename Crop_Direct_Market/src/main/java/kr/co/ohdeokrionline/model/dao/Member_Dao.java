package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;

import kr.co.ohdeokrionline.model.vo.Member_DTO;

public interface Member_Dao {
	void joinInsert(Member_DTO member) throws ClassNotFoundException, SQLException;
	Member_DTO login(String user_id) throws SQLException;
}
