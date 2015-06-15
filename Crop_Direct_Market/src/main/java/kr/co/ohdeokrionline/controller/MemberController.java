package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping("login.five")
	public String login() {

		return "login/login";
	}
	
	@RequestMapping("test.message")
	public void insert() {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
	}
}
