package kr.co.ohdeokrionline.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.BalanceSheet_Dao;
import kr.co.ohdeokrionline.model.dao.Order_Dao;
import kr.co.ohdeokrionline.model.vo.Order_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@RequestMapping("/farmmanage/")
@Controller
public class FarmController {
	
	@Autowired
	private SqlSession sqlsession;
	
//	대차대조표 입력 창 
	@RequestMapping("daecha.five")
	public String sellmanagepage(Principal principal, Model model){
//		
		BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		System.out.println("1단계");
		System.out.println(dao.totalsell(principal.getName()));
		model.addAttribute("totalsell", dao.totalsell(principal.getName()));
        return "mypage.daecha";
	}
	
//	통계 출력창
	@RequestMapping("daechaStatics.five")
	public String orderchange(Principal principal, Model model) throws IOException{
		
		BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		Map<String, Integer> map = dao.sellpercent(principal.getName());
		System.out.println(map);
		
		model.addAttribute("dir", map.get("DIR"));
		model.addAttribute("indir", map.get("INDIR"));
		return "mypage.daechaStats";
	}
}
