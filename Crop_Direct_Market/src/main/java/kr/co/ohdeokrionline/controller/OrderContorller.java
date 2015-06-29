package kr.co.ohdeokrionline.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.Order_Dao;
import kr.co.ohdeokrionline.model.vo.Order_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class OrderContorller {
	
	@Autowired
	private SqlSession sqlsession;
	
//	판매자 판매 상황 
	@RequestMapping("sellermanage.five")
	public String sellmanagepage(Principal principal, Model model){
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		List<Order_DTO> list = dao.sellermanage(principal.getName());
		model.addAttribute("list", list);
	    model.addAttribute("user_id", principal.getName());
        return "mypage/sellmanage";
	}
	
//	입금상태 변경
	@RequestMapping("orderupdate.five")
	public void orderchange(String order_num,HttpServletResponse response) throws IOException{
		System.out.println(order_num);
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		System.out.println(dao.orderstatechange(order_num));
		response.getWriter().write(dao.orderstatechange(order_num));
	}
}
