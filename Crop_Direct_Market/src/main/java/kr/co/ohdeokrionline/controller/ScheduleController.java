package kr.co.ohdeokrionline.controller;

import java.security.Principal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.dao.ScheduleRecord2_Dao;
import kr.co.ohdeokrionline.model.dao.ScheduleRecord_Dao;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord2_DTO;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage/")
public class ScheduleController {
	@Autowired
	private SqlSession sqlSession;
	
	/*@RequestMapping(value="schedule.five",method=RequestMethod.GET)
	public String schedule(Model model,Principal principal) throws SQLException{
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		List<ScheduleRecord_DTO> list = dao.mySchedule(principal.getName()); //LogingUser 값을 받음
		if(!principal.getName().equals("admin")){
			List<ScheduleRecord_DTO> admin = dao.mySchedule("admin");
			list.addAll(admin);
		}
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("user_id",principal.getName());
		//Tiles 적용 전 코드
		//return "mypage/schedule";
		//Tiles 적용
		return "mypage.schedule";
	}
	
	@RequestMapping("scheduleAdd.five")
	public String scheduleAdd(ScheduleRecord_DTO schedule) throws SQLException{
		
		String startdate = schedule.getPl_startdate().replace(". " , "-").replace(".", "");
		String[] startDt = startdate.split("-");
		String enddate = schedule.getPl_enddate().replace(". " , "-").replace(".", "");
		String[] endDt = enddate.split("-");
		
		schedule.setPl_startdate(
				new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString()
						);
		
		schedule.setPl_enddate(
				new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString()
						);
		
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		System.out.println("add:"+schedule);
		dao.scheduleAdd(schedule);
		return "redirect:schedule.five";
	}
	
	@RequestMapping("scheduleEdit.five")
	public String scheduleEdit(ScheduleRecord_DTO schedule) throws SQLException{
		
		String startdate = schedule.getPl_startdate().replace(". " , "-").replace(".", "");
		String[] startDt = startdate.split("-");
		String enddate = schedule.getPl_enddate().replace(". " , "-").replace(".", "");
		String[] endDt = enddate.split("-");
		
		schedule.setPl_startdate(
				new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString()
						);
		
		schedule.setPl_enddate(
				new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString()
						);
		
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		System.out.println("edit:"+schedule);
		dao.scheduleEdit(schedule);
		return "redirect:schedule.five";
	}
	
	@RequestMapping("scheduleRemove.five")
	public String scheduleRemove(ScheduleRecord_DTO schedule) throws SQLException{
		
		String startdate = schedule.getPl_startdate().replace(". " , "-").replace(".", "");
		String[] startDt = startdate.split("-");
		String enddate = schedule.getPl_enddate().replace(". " , "-").replace(".", "");
		String[] endDt = enddate.split("-");
		
		schedule.setPl_startdate(
				new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString()
						);
		
		schedule.setPl_enddate(
				new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString()
						);
		
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		System.out.println("remove:"+schedule);
		dao.scheduleRemove(schedule);
		return "redirect:schedule.five";
	}*/
	
	@RequestMapping(value="schedule2.five",method=RequestMethod.GET)
	public String schedule2(Model model,Principal principal) throws SQLException{
		ScheduleRecord2_Dao dao = sqlSession.getMapper(ScheduleRecord2_Dao.class);
		List<ScheduleRecord2_DTO> list = dao.mySchedule(principal.getName()); //LogingUser 값을 받음
		if(!principal.getName().equals("admin")){
			List<ScheduleRecord2_DTO> admin = dao.mySchedule("admin");
			list.addAll(admin);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("user_id",principal.getName());
		//Tiles 적용 전 코드
		//return "mypage/schedule";
		//Tiles 적용
		return "mypage.schedule2";
	}
	
	@RequestMapping(value="agenda.five",method=RequestMethod.GET)
	public String agenda(Model model,Principal principal) throws SQLException{
		
		return "mypage.agenda";
	}
	
	@RequestMapping(value="schedule2Add.five",method=RequestMethod.POST)
	public String schedule2Add(ScheduleRecord2_DTO schedule) throws SQLException{
		
		String[] startDt = schedule.getStart().split("-");
		String[] endDt = schedule.getEnd().split("-");
		System.out.println(startDt+"/"+endDt);
		schedule.setStart(
				new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString()
						);
		
		schedule.setEnd(
				new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString()
						);
		
		ScheduleRecord2_Dao dao = sqlSession.getMapper(ScheduleRecord2_Dao.class);
		System.out.println("add:"+schedule);
		dao.scheduleAdd(schedule);
		return "redirect:./schedule2.five";
	}
	
	@RequestMapping("schedule2Edit.five")
	public String schedule2Edit(ScheduleRecord2_DTO schedule) throws SQLException{
		
		String[] startDt = schedule.getStart().split("-");
		String[] endDt = schedule.getEnd().split("-");
		
		schedule.setStart(
				new Date(Integer.parseInt(startDt[0])-1900,
						Integer.parseInt(startDt[1])-1,
						Integer.parseInt(startDt[2])).toString()
						);
		
		schedule.setEnd(
				new Date(Integer.parseInt(endDt[0])-1900,
						Integer.parseInt(endDt[1])-1,
						Integer.parseInt(endDt[2])).toString()
						);
		
		ScheduleRecord2_Dao dao = sqlSession.getMapper(ScheduleRecord2_Dao.class);
		System.out.println("edit:"+schedule);
		dao.scheduleEdit(schedule);
		return "redirect:schedule2.five";
	}
}
