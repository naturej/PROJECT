package kr.co.ohdeokrionline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// 로그인, 아이디 or 비밀번호 찾기, 회원가입, 회원정보조회 컨트롤
public class MemberController {
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
