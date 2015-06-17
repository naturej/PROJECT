package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Enuri_DTO;

public interface Enuri_Dao {
	// 에누리 목록
	public ArrayList<Enuri_DTO> enuList();
	// 상세보기
	public Enuri_DTO enuDetail(String enu_idx);
	// 글쓰기
	public void enuInsert(Enuri_DTO enuri);
	// 에누리 수락
	public int yesConfirm(String enu_idx);
	// 에누리 거절
	public int noConfirm(String enu_idx);
	// 장바구니로 보내기
}
