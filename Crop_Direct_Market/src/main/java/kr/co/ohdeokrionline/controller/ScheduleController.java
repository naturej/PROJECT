package kr.co.ohdeokrionline.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import kr.co.ohdeokrionline.model.dao.ScheduleRecord_Dao;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScheduleController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="schedule.five",method=RequestMethod.GET)
	public String schedule(Model model) throws SQLException{
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		List<ScheduleRecord_DTO> list = dao.mySchedule("smlee2");
		System.out.println(list);
		model.addAttribute("list", list);
		return "mypage/schedule";
	}
	
	@RequestMapping("scheduleAdd.five")
	public String scheduleAdd(ScheduleRecord_DTO schedule) throws SQLException{
		
		String date = schedule.getPl_date().replace(". " , "-").replace(".", "");
		String[] Dt = date.split("-");
		
		schedule.setPl_date(
				new Date(Integer.parseInt(Dt[0])-1900,
						Integer.parseInt(Dt[1])-1,
						Integer.parseInt(Dt[2])).toString()
						);
		schedule.setPl_sub("smlee");
		schedule.setPro_name("보리");
		
		ScheduleRecord_Dao dao = sqlSession.getMapper(ScheduleRecord_Dao.class);
		
		dao.scheduleAdd(schedule);
		return "mypage/schedule";
	}
}
