package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.vo.Message_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	// 테스트용 페이지 이동
	@RequestMapping("test.five")
	public String sendpage() {
		System.out.println("왜못잡냐");
		return "marketplace/messagetestpage";
	}

	// 테스트용 페이지 이동
	@RequestMapping("popup.five")
	public String openpopup() {
		System.out.println("이건 잡니?");
		return "marketplace/messageForm";
	}
	
	// 받은 메세지함
	@RequestMapping("receiveList.five")
	public String receiveList(Model model){
		
		Message_Dao dao =  sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.listRec());
		
		return "marketplace/receivelist";
	}
	
	// 보낸 메세지함
	@RequestMapping("sendList.five")
	public String sendList(Model model){
		
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.listSend());
		
		return "marketplace/sendlist";
	}
	
	// 받은 메세지 상세보기
	@Transactional
	@RequestMapping("RecDetail.five")
	public String RecDetail(Model model, String me_num){
		System.out.println("메세지 조회수 증가...");
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		Message_DTO dto = dao.recDetail(me_num);
		dao.updateSend(me_num);
		model.addAttribute("dto",dto);
		
		return "marketplace/receiveDetail";
	}
	
	// 보낸 메세지 상세보기
	@RequestMapping("SendDetail.five")
	public String SendDetail(Model model, String me_num){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		Message_DTO dto = dao.sendDetail(me_num);
		model.addAttribute("dto",dto);
		
		return "marketplace/sendDetail";
	}
	
	// 메세지 보내기
		@Transactional
		@RequestMapping("sendMessage.five")
		public void insert(Message_DTO message) {
			System.out.println("sendmsg");
			Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
			dao.insertRec(message);
			dao.insertSend(message);
			System.out.println("insert구문 종료");
	}
	
	// 보낸 메세지 삭제
	@RequestMapping("deleteSend.five")
	public String deleteSend(String me_num){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		dao.deleteSend(me_num);
		
		return "redirect:sendList.five";
	}
	
	// 받은 메세지 삭제
		@RequestMapping("deleteRec.five")
		public String deleteRec(String me_num){
			Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
			dao.deleteRec(me_num);
			
			return "redirect:receiveList.five";
		}
}
