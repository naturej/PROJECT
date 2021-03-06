package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Enuri_DTO;

public interface Enuri_Dao {
	// 판매글 아이디
	public String bo_id(int bo_num);
	// 판매글 제목
	public String bo_subject(int bo_num);
	// 판매자 에누리 목록
	public ArrayList<Enuri_DTO> enuListRec(String sell_id);
	// 소비자 에누리 목록
	public ArrayList<Enuri_DTO> enuListSend(String user_id);
	// 상세보기
	public Enuri_DTO enuDetail(String enu_idx);
	//에누리 메시지 전달 
	void insertEnuri(Enuri_DTO enuri);
	// 에누리 수락
	public void yesEnuri(String enu_idx);
	// 에누리 거절
	public void noEnuri(String enu_idx);
	// 장바구니로 보내기
}
