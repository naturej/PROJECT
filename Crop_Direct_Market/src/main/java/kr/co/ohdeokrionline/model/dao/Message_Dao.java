package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Message_DTO;

public interface Message_Dao {
	public ArrayList<Message_DTO> ListRec();
	public ArrayList<Message_DTO> ListSend();
	void insertMessage(Message_DTO message);
}
