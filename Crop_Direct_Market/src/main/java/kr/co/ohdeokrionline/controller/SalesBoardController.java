package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.vo.Message_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/marketplace/")
public class SalesBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	// 받은 메세지함
	@RequestMapping("receiveList")
	public String receiveList(Model model){
		
		Message_Dao dao =  sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.ListRec());
		
		return "receivelist";
	}
	
	// 보낸 메세지함
	@RequestMapping("sendList")
	public String sendList(Model model){
		
		Message_Dao dao =  sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.ListSend());
		
		return "sendlist";
	}
	
	// 메세지 보내기
	@RequestMapping("sendMessage")
	public String insert(Message_DTO message) {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		dao.insertRec(message);
		dao.insertSend(message);
		
		return "redirect:sendList";
	}
	
	// 보낸 메세지 삭제
	@RequestMapping("deleteSend")
	public String deleteSend(String seq){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		dao.deleteSend(seq);
		
		return "redirect:sendList";
	}
	
	// 받은 메세지 삭제
		@RequestMapping("deleteRec")
		public String deleteRec(String seq){
			Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
			dao.deleteRec(seq);
			
			return "redirect:sendRec";
		}
}
