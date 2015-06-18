package kr.co.ohdeokrionline.controller;

import java.util.HashMap;

import kr.co.ohdeokrionline.model.dao.Enuri_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.dao.SaleBoard_Dao;
import kr.co.ohdeokrionline.model.vo.Enuri_DTO;
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
	
//	salesboard 완성된 이후
//	HashMap<String, String> input = new HashMap<String, String>();
	

	// 테스트용 페이지 이동
	@RequestMapping("test.five")
	public String sendpage() {
		return "marketplace/messagetestpage";
	}

	// 메시지 발송창 팝업 
	@RequestMapping("popup.five")
	public String openpopup() {
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
	// 에누리 테스트용 판매 글 이동
		@RequestMapping("sellpage.five")
		public String testdata(Model model) {
			SaleBoard_Dao dao = sqlSession.getMapper(SaleBoard_Dao.class);
			model.addAttribute("list", dao.salDetail());
			return "marketplace/test_sellpage";
		}

		// 에누리 신청 테스트 용 팝업 페이지 이동
		@RequestMapping("enuri_sinchung.five")
		public String openpopup_enuri() {
			return "marketplace/message_enuriForm";
		}
		
		//에누리 메시지 발송 메서드
		@RequestMapping("send_enuriMessage.five")
		public String send_enuri(Enuri_DTO enuri) {
			System.out.println("왔따~");
			SaleBoard_Dao dao = sqlSession.getMapper(SaleBoard_Dao.class);
			System.out.println(enuri.toString());
			dao.insertEnuri(enuri);
			return null;
		}
	
	// 에누리 리스트
	@Transactional
	@RequestMapping("enulist.five")
	public String enuList(Model model){
		
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		model.addAttribute("list",dao.enuList());
//		salesboard 완성된 이후
//		model.addAttribute("bo_id",dao.bo_id(bo_num));
//		model.addAttribute("bo_subject",dao.bo_subject(bo_num));
		
		return "marketplace/enulist";
	} 
		
	// 에누리 상세보기
	@RequestMapping("enuDetail.five")
	public String enuDetail(Model model, String enu_idx){
		
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		Enuri_DTO dto = dao.enuDetail(enu_idx);
		model.addAttribute("dto",dto);
		
		return "marketplace/enuDetail";
	}
	// 메세지 보내기
/*			@Transactional
			@RequestMapping("sendMessage.five")
			public void insert(Message_DTO message) {
				System.out.println("sendmsg");
				Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
				dao.insertRec(message);
				dao.insertSend(message);
				System.out.println("insert구문 종료");
		}*/
	
	// 에누리 수락
	@RequestMapping("yesEnuri.five")
	public void yesEnuri(String enu_idx){
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		dao.yesEnuri(enu_idx);
	}
	
	// 에누리 거절
	@RequestMapping("noEnuri.five")
	public void noEnuri(String enu_idx){
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		dao.noEnuri(enu_idx);
	}
	
}
