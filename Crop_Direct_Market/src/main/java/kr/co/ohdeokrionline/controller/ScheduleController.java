package kr.co.ohdeokrionline.controller;

import java.security.Principal;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.dao.ScheduleRecord2_Dao;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord2_DTO;

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
	
	// 스케쥴 페이지
	@RequestMapping(value="schedule2.five",method=RequestMethod.GET)
	public String schedule2(Model model,Principal principal) throws SQLException{
		ScheduleRecord2_Dao dao = sqlSession.getMapper(ScheduleRecord2_Dao.class);
		List<ScheduleRecord2_DTO> list = dao.mySchedule(principal.getName()); //LogingUser 값을 받음
		if(!principal.getName().equals("admin")){ // "admin"이 아니면 추가
			List<ScheduleRecord2_DTO> admin = dao.mySchedule("admin");
			list.addAll(admin);
		}
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("user_id",principal.getName());
		
		//Tiles 적용
		return "mypage.schedule2";
	}
	
	// 일정 추가
	@RequestMapping(value="schedule2Add.five",method=RequestMethod.POST)
	public String schedule2Add(ScheduleRecord2_DTO schedule) throws SQLException{
		
		String[] startDt = schedule.getStart().split("-");
		String[] endDt = schedule.getEnd().split("-");
		startDt[2] = startDt[2].substring(0, 2);
		endDt[2] = endDt[2].substring(0, 2);
		// format 변경
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
		// DB insert
		dao.scheduleAdd(schedule);
		return "redirect:./schedule2.five";
	}
	
	// 일정 변경
	@RequestMapping(value="schedule2Edit.five",method=RequestMethod.POST)
	public String schedule2Edit(ScheduleRecord2_DTO schedule) throws SQLException{
		
		String[] startDt = schedule.getStart().split("-");
		String[] endDt = schedule.getEnd().split("-");
		startDt[2] = startDt[2].substring(0, 2);
		endDt[2] = endDt[2].substring(0, 2);
		// format 변경
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
		// DB update
		System.out.println(dao.scheduleEdit(schedule));
		return "redirect:./schedule2.five";
	}
	
	// 일정 삭제
	@RequestMapping(value="scheduleRemove.five",method=RequestMethod.POST)
	public String schedule2Remove(ScheduleRecord2_DTO schedule) throws SQLException{
		int pl_id = schedule.getPl_id();
		System.out.println(pl_id);
		ScheduleRecord2_Dao dao = sqlSession.getMapper(ScheduleRecord2_Dao.class);
		// DB delete
		dao.scheduleRemove(pl_id);
		return "redirect:./schedule2.five";
	}
}
