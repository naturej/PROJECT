package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.Authorities_DTO;

public interface Authorities_Dao {
	void insertAuth(Authorities_DTO authority) throws SQLException;
	List<Authorities_DTO> getAuthAll() throws SQLException;
}
