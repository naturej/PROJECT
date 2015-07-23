package kr.co.ohdeokrionline.controller;

import net.sf.json.JSONArray;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.BalanceSheet_Dao;
import kr.co.ohdeokrionline.model.dao.Dirm_Dao;
import kr.co.ohdeokrionline.model.dao.Order_Dao;
import kr.co.ohdeokrionline.model.dao.ScheduleRecord2_Dao;
import kr.co.ohdeokrionline.model.vo.Dirm_DTO;
import kr.co.ohdeokrionline.model.vo.Order_DTO;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord2_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			HttpServletRequest request,Principal principal) throws IOException{
		response.setCharacterEncoding("utf-8");
		Calendar cal= Calendar.getInstance();
		String bal_date= cal.get(Calendar.YEAR)+"년"+(cal.get(Calendar.MONTH)+1)+"월";
		String or_id=request.getParameter("order_num");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		int or_cost =Integer.parseInt(request.getParameter("or_cost"));
		
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		response.getWriter().write(dao.orderstatechange(or_id, bo_num));
		BalanceSheet_Dao baldao = sqlsession.getMapper(BalanceSheet_Dao.class);
		int check =baldao.balcount(principal.getName(), bal_date);
		System.out.println(check);
		if(check!=0){
			int result =dao.upbal(principal.getName(), bal_date, or_cost);
		}else{
			
			int result = dao.crebal(principal.getName(), bal_date, or_cost);
		}
		
	}
	
	@RequestMapping("orderupdate2.five")
	public void orderchange2(HttpServletResponse response,
			HttpServletRequest request) throws IOException{
		String or_id=request.getParameter("order_num");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		System.out.println(or_id);
		System.out.println(bo_num);
		
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		response.getWriter().write(dao.orderstatechange2(or_id, bo_num));
		System.out.println("확인 해 보려는 값 : "+ dao.orderstatechange2(or_id, bo_num));
	}
	@RequestMapping("orderupdate3.five")
	public void orderchange3(HttpServletResponse response,
			HttpServletRequest request) throws IOException{
		String or_id=request.getParameter("order_id");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		System.out.println(or_id);
		System.out.println(bo_num);
		
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		response.getWriter().write(dao.orderstatechange3(or_id, bo_num));
		System.out.println("확인 해 보려는 값 : "+ dao.orderstatechange3(or_id, bo_num));
	}
	
//	주문관리
	@RequestMapping("ordermanage.five")
	public String ordermanage(Model model,Principal principal) throws IOException{
		String buy_userid = principal.getName();
		Order_Dao orderdao = sqlsession.getMapper(Order_Dao.class);
		List<Order_DTO> codelist = orderdao.ordercodelist(buy_userid);
		List<Order_DTO> orderlist = orderdao.orderlist(buy_userid); 
		model.addAttribute("codelist", codelist);
		model.addAttribute("orderlist",orderlist);
         return "mypage.ordermanage";
	}
	
	@RequestMapping("buyer_address.five")
	public String buyerinfo(Model model, HttpServletRequest request) throws IOException{
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		String or_id = request.getParameter("or_id");
		List<Order_DTO> buyer_address = dao.buyer_address(or_id);
		model.addAttribute("buyer",buyer_address);
		return "mypage/buyer_info";
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
		return "mypage/dirmForm";
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
	@Transactional
	@RequestMapping("yesDirm.five")
	public String yesDirm(String dirmno, String user_rec, String user_send, String pro_id
			, String title, String content, String start, String end) throws SQLException{
		Dirm_Dao dao = sqlsession.getMapper(Dirm_Dao.class);
		dao.yesDirm(dirmno);
		
		String[] startDt = start.split("-");
		String[] endDt = end.split("-");
		startDt[2] = startDt[2].substring(0, 2);
		endDt[2] = endDt[2].substring(0, 2);
		
		start =	new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString();
						
		
		end = new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString();
		System.out.println(start+"/"+end);
		// 받은 사람 일정에 들어가게
		ScheduleRecord2_DTO plandto = new ScheduleRecord2_DTO();
		plandto.setUser_id(user_rec);
		plandto.setPro_name(pro_id);
		plandto.setTitle(title);
		plandto.setContent(content);
		plandto.setStart(start);
		plandto.setEnd(end);
	
		// 보낸 사람 일정에 들어가게
		ScheduleRecord2_DTO plandto2 = new ScheduleRecord2_DTO();
		plandto2.setUser_id(user_send);
		plandto2.setPro_name(pro_id);
		plandto2.setTitle(title);
		plandto2.setContent(content);
		plandto2.setStart(start);
		plandto2.setEnd(end);
		
		ScheduleRecord2_Dao plandao = sqlsession.getMapper(ScheduleRecord2_Dao.class);
		System.out.println(plandto);
		System.out.println(plandto2);
		
		plandao.scheduleAdd(plandto);
		plandao.scheduleAdd(plandto2);
		
		return "mypage.yesDirm";
	}
	
	//판매자 '입금확인 중' 주문 COUNT 
	@RequestMapping("newordercount.five")
	public void newordercount(String user_id,HttpServletResponse response) throws IOException{
		Order_Dao dao = sqlsession.getMapper(Order_Dao.class);
		int newcount =dao.newordercount(user_id);
		JSONArray tocount = JSONArray.fromObject(newcount);
        response.getWriter().print(tocount);
	}
	
}
