package kr.co.ohdeokrionline.controller;

import java.sql.SQLException;

import kr.co.ohdeokrionline.model.dao.Authorities_Dao;
import kr.co.ohdeokrionline.model.dao.Member_Dao;
import kr.co.ohdeokrionline.model.dao.Report_Dao;
import kr.co.ohdeokrionline.model.dao.UserManage_Dao;
import kr.co.ohdeokrionline.model.vo.UserManage_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/")
public class AdminController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("memberManage.five")
	String memberManage(Model model){
		UserManage_Dao dao = sqlSession.getMapper(UserManage_Dao.class);
		
		try {
			model.addAttribute("users",dao.user());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mypage.memberManage";
	}
}
