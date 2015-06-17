package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.vo.ScheduleRecord_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ScheduleController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("schedule.five")
	public String schedule(){
		return "mypage/schedule";
	}
	
	@RequestMapping("scheduleAdd.five")
	public String scheduleAdd(ScheduleRecord_DTO schedule){
		return "mypage/schedule";
	}
}
