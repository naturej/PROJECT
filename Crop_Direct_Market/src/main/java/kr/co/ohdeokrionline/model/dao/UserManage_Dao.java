package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.UserManage_DTO;

public interface UserManage_Dao {
	List<UserManage_DTO> user() throws SQLException;
}
