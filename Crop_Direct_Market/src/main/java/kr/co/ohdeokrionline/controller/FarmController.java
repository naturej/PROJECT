package kr.co.ohdeokrionline.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

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
	
//	판매자 판매 상황 
	@RequestMapping("daecha.five")
	public String sellmanagepage(Principal principal, Model model){
//		결제 상태가 '확인'인 값만 불러오기 table에 쏴주기
//		
		BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		model.addAttribute("totalsell", dao.totalsell(principal.getName()));
        return "mypage.daecha";
	}
	
//	입금상태 변경
	@RequestMapping("daechaStatics.five")
	public String orderchange(String order_num,HttpServletResponse response) throws IOException{
		
//		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
//		response.getWriter().write(dao.orderstatechange(order_num));
		return "mypage.daechaStats";
	}
}
