package kr.co.ohdeokrionline.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.BalanceSheet_Dao;
import kr.co.ohdeokrionline.model.dao.Order_Dao;
import kr.co.ohdeokrionline.model.vo.BalanceSheet_DTO;
import kr.co.ohdeokrionline.model.vo.Order_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@RequestMapping("/farmmanage/")
@Controller
public class FarmController {
	
	@Autowired
	private SqlSession sqlsession;
	
//	통계 출력창
	@RequestMapping("daechaStatics.five")
	public String orderchange(Principal principal, Model model) throws IOException{
		
		BalanceSheet_Dao dao = sqlsession.getMapper(BalanceSheet_Dao.class);
		Map<String, Integer> map = dao.sellpercent(principal.getName());
		model.addAttribute("dir", map.get("DIR"));
		model.addAttribute("indir", map.get("INDIR"));
		
		System.out.println(dao.sellrec(principal.getName()));
		ArrayList<HashMap<String, Integer>> arr = dao.sellrec(principal.getName());
		System.out.println(arr.get(0).get("COST"));
		System.out.println(arr.get(0).get("MONTH"));
		for(int i =0 ; i<6 ; i++){
			model.addAttribute("c"+i,arr.get(i).get("COST"));
			model.addAttribute("m"+i,arr.get(i).get("MONTH"));
		}
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
