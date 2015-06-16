package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;

import kr.co.ohdeokrionline.model.vo.Member_DTO;

public interface Member_Dao {
	int joinInsert(Member_DTO member) throws ClassNotFoundException, SQLException;
}
