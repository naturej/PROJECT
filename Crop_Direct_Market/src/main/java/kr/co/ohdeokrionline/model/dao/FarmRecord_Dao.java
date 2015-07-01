package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;

import kr.co.ohdeokrionline.model.vo.FarmRecord_DTO;

public interface FarmRecord_Dao {
	void insertFarminfo(FarmRecord_DTO farm) throws SQLException;
	FarmRecord_DTO farmInfo(String user_id) throws SQLException;
	int farmInfoUpdate(FarmRecord_DTO farm) throws SQLException;
}
