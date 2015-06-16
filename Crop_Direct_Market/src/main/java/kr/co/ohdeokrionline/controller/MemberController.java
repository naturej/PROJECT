package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;


	@RequestMapping(value="login.five",method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="login.five",method=RequestMethod.POST)
	public String loginProcess() {
		return "index";
	}
	
	@RequestMapping("test.message")
	public void insert() {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
	}
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder",method={RequestMethod.GET,RequestMethod.POST})
	String passwordEncoder(@RequestParam(value="targetStr",required=false,defaultValue="")String targetStr, Model model){
		if(StringUtils.hasText(targetStr)){
			// 암호화 작업
			String bCryptString = passwordEncoder.encode(targetStr);
			model.addAttribute("targetStr",targetStr);
			model.addAttribute("bCryptString", bCryptString);
		}
		return "";
	}
}
