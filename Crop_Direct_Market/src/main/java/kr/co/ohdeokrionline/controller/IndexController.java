package kr.co.ohdeokrionline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("index.five")
	public String index(){
		System.out.println("index");
		//Tiles 적용
		return "home.index";
		//Tiles 적용 전 코드
		//return "redirect:index.jsp";
	}
}
