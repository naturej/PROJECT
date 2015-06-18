package kr.co.ohdeokrionline.model.dao;

import kr.co.ohdeokrionline.model.vo.Enuri_DTO;
import kr.co.ohdeokrionline.model.vo.SaleBoard_DTO;

public interface SaleBoard_Dao {
	SaleBoard_DTO salDetail();
	
	//에누리 메시지 전달 
	void insertEnuri(Enuri_DTO enuri);
}
