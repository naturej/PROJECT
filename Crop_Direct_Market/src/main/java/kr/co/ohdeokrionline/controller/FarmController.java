package kr.co.ohdeokrionline.controller;

import net.sf.json.JSONArray;

import java.io.IOException;
import java.security.Principal;
import java.util.Calendar;
import java.util.List;


import kr.co.ohdeokrionline.model.dao.BalanceSheet_Dao;
import kr.co.ohdeokrionline.model.vo.BalanceSheet_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/farmmanage/")
@Controller
public class FarmController {
	
	@Autowired
	private SqlSession sqlsession;
	
//	매출 기록 확인
	@RequestMapping("daechaStatics.five")
	public String orderchange(Principal principal, Model model,String year) throws IOException{
	BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		
		Calendar cal= Calendar.getInstance();
		String bal_date=String.valueOf(cal.get(Calendar.YEAR));
		if(year != null && !year.equals("")){
			bal_date = year;
		}
		
		System.out.println(principal.getName());
		System.out.println(bal_date);
		List ballist_income = dao.getbalgra_income(principal.getName(),bal_date);
		List ballist_total = dao.getbalgra_total(principal.getName(),bal_date);
		List ballist_date= dao.getbalgra_date(principal.getName(),bal_date);
		List sal_on = dao.gra_salon(principal.getName(),bal_date);
		List sal_mar = dao.gra_salmar(principal.getName(),bal_date);
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("totallist", jsonArray.fromObject(ballist_total));
		model.addAttribute("datelist", jsonArray.fromObject(ballist_date));
		model.addAttribute("incomelist", jsonArray.fromObject(ballist_income));
		model.addAttribute("sal_on", jsonArray.fromObject(sal_on));
		model.addAttribute("sal_mar",jsonArray.fromObject(sal_mar));
		return "mypage.daechaStats";
	}
	
//	손익 계산서 list 출력
	@RequestMapping(value="daecha.five",method=RequestMethod.GET)
	public String sellmanagepage(Principal principal,Model model){
		Calendar cal= Calendar.getInstance();
		String year=cal.get(Calendar.YEAR)+"년";
		String month=cal.get(Calendar.MONTH)+1+"월";
		String bal_date= year+month;
		System.out.println(bal_date);
		String user_id = principal.getName();
		System.out.println(user_id);
		BalanceSheet_Dao balance = sqlsession.getMapper(BalanceSheet_Dao.class);
		
		int num = balance.balcount(user_id, bal_date);
		List<BalanceSheet_DTO> ballist = balance.getbal(user_id,bal_date);
	    model.addAttribute("ballist",ballist);
       if(num==0){
    	   return "mypage.daechaform";
       }else{
    	   return "mypage.daecha";
       }
	}
	
	// UPDATE
	@RequestMapping(value="daecha.five",method=RequestMethod.POST)
	public String sellmanagepage(Principal principal,Model model,BalanceSheet_DTO bal){
		BalanceSheet_Dao balance = sqlsession.getMapper(BalanceSheet_Dao.class);
		int num = balance.balcount(bal.getUser_id(),bal.getBal_date());
		System.out.println(bal.getSal_income());
       if(num==0){
    	   balance.insertbal(bal);
       }else{
    	   balance.updatebal(bal);
       }
       List<BalanceSheet_DTO> ballist = balance.getbal(bal.getUser_id(),bal.getBal_date());
       model.addAttribute("ballist",ballist);
       System.out.println("controller 확인!!");
       return "mypage.daecha";
	}
	
/*	
		@RequestMapping("daechaStatics.five")
		public String orderchange(Principal principal,Model model,String year) throws IOException{
			Calendar cal= Calendar.getInstance();
			String bal_date=String.valueOf(cal.get(Calendar.YEAR));
			if(year != null && !year.equals("")){
				bal_date = year;
			}
		BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		List<BalanceSheet_DTO> ballist = dao.getbal(principal.getName(),bal_date);
		model.addAttribute("ballist",ballist);
		
		return "mypage.daechaStats";
	*/	

	
	
}
