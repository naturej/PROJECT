package kr.co.ohdeokrionline.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.Dirm_Dao;
import kr.co.ohdeokrionline.model.dao.Order_Dao;
import kr.co.ohdeokrionline.model.vo.Dirm_DTO;
import kr.co.ohdeokrionline.model.vo.Order_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@RequestMapping("/manage/")
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
	    System.out.println(list);
        return "mypage.sellmanage";
	}
	
//	입금상태 변경
	@RequestMapping("orderupdate.five")
	public void orderchange(HttpServletResponse response,
			HttpServletRequest request) throws IOException{
		String or_id=request.getParameter("order_num");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		System.out.println(or_id);
		System.out.println(bo_num);
		
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		response.getWriter().write(dao.orderstatechange(or_id, bo_num));
	}
	
//	주문관리
	@RequestMapping("ordermanage.five")
	public String ordermanage(Model model,Principal principal) throws IOException{
		String buy_userid = principal.getName();
		Order_Dao orderdao = sqlsession.getMapper(Order_Dao.class);
		List<Order_DTO> orderlist = orderdao.orderlist(buy_userid); 
		model.addAttribute("orderlist",orderlist);
         return "mypage.ordermanage";
	}
	
//	1추가
//	판매자 계좌 정보확인 
	@RequestMapping("seller_account.five") 
	public String sellerinfo(Model model, HttpServletRequest request) throws IOException{
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		String seller=request.getParameter("seller");
		System.out.println(dao.seller_account(seller));
		model.addAttribute("account", dao.seller_account(seller));
		model.addAttribute("seller",seller);
         return "mypage/account_info";
	}
	
	
	@RequestMapping("moneystate_check.five") 
	public void moneyinput(Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		String order_id = request.getParameter("order_id");
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		System.out.println("order_id : "+order_id);
		System.out.println("bo_num : " +bo_num);
		PrintWriter out = response.getWriter();
		int result = dao.moneychecking(order_id, bo_num);
		System.out.println(result);
		out.print(result);
	}
	
	// 직거래 신청 팝업
	@RequestMapping("popupDirm.five")
	public String dirm_popup(Model model, Principal principal){
		model.addAttribute("user_send",principal.getName());
		return "mypage.dirmForm";
	}
	
	// 직거래 신청 
	@RequestMapping(value="dirm_sinchung.five",method=RequestMethod.POST)
	public void insertDirm(Dirm_DTO dirm){
		System.out.println("직거래 신청 컨트롤러");
		Dirm_Dao dao = sqlsession.getMapper(Dirm_Dao.class);
		dao.insertDirm(dirm);
	}
	
	// 직거래 쪽지 리스트
	@RequestMapping("dirmlist.five")
	public String dirmlist(Model model,Principal principal){
		Dirm_Dao dao = sqlsession.getMapper(Dirm_Dao.class);
		model.addAttribute("list",dao.dirmList(principal.getName()));
		return "mypage.dirmlist";
	}
	
	// 직거래 상세보기
	@RequestMapping("dirmDetail.five")
	public String dirmDetail(Model model, String dirmno){
		Dirm_Dao dao = sqlsession.getMapper(Dirm_Dao.class);
		Dirm_DTO dto = dao.dirmDetail(dirmno);
		model.addAttribute("dto",dto);
		return "mypage.dirmDetail";
	}
	
	// 직거래 승인
	@RequestMapping("yesDirm.five")
	public String yesDirm(String dirmno){
		Dirm_Dao dao = sqlsession.getMapper(Dirm_Dao.class);
		dao.yesDirm(dirmno);
		return "mypage.yesDirm";
	}
}
