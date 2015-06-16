package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message/")
public class SalesBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("list")
	public String messageList(Model model){
		
		Message_Dao dao =  sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.ListRec());
		
		return "list";
	}
	
	@RequestMapping("send")
	public void insert() {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
	}
}
