package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Message_DTO;

public interface Message_Dao {
	// 받은 메세지 목록
	public ArrayList<Message_DTO> listRec(String rec_userid);
	// 보낸 메세지 목록
	public ArrayList<Message_DTO> listSend(String send_userid);
	// 받은 메세지 상세보기
	public Message_DTO recDetail(String me_num);
	// 보낸 메세지 상세보기
	public Message_DTO sendDetail(String me_num);
	// 받은 메세지 조회수 증가
	public int updateSend(String me_num);
	// 받은 메세지 읽음 Header 표시
	public int updaterec(String me_num);
	// 메세지 작성
	public void insertRec(Message_DTO message);
	// 메세지 작성
	public void insertSend(Message_DTO message);
	// 받은 메세지 삭제
	public int deleteRec(String me_num);
	// 보낸 메세지 삭제
	public int deleteSend(String me_num);
	// 안 본 메세지 개수
	public int msgNum(String rec_userid);
}
