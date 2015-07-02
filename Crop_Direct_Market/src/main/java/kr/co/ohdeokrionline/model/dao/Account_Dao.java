package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;

import kr.co.ohdeokrionline.model.vo.Account_DTO;

public interface Account_Dao {
	int insertAccount(Account_DTO account) throws SQLException;
	Account_DTO getAccountByUser_id(String user_id) throws SQLException;
	int updateAccount(Account_DTO account) throws SQLException;
}
