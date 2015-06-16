package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

public class SalesBoardController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("test.message")
	public void insert() {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
	}
}
