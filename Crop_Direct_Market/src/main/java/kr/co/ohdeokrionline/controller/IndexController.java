package kr.co.ohdeokrionline.controller;


import java.security.Principal;

import kr.co.ohdeokrionline.model.dao.Message_Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("index.five")
	public String index(){
		System.out.println("index");
		//Tiles 적용
		
		return "home.index";
		//Tiles 적용 전 코드
		//return "redirect:index.jsp";
	}
}
