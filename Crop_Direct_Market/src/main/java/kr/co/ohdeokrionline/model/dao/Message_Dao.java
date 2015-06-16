package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Message_DTO;

public interface Message_Dao {
	// 받은 메세지 목록
	public ArrayList<Message_DTO> ListRec();
	// 보낸 메세지 목록
	public ArrayList<Message_DTO> ListSend();
	// 메세지 작성
	public void insertRec(Message_DTO message);
	// 메세지 작성
	public void insertSend(Message_DTO message);
	// 받은 메세지 삭제
	public int deleteRec(String seq);
	// 보낸 메세지 삭제
	public int deleteSend(String seq);
}
