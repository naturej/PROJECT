package kr.co.ohdeokrionline.model.dao;

import java.util.List;

import kr.co.ohdeokrionline.model.vo.Order_DTO;

public interface Order_Dao {
	
//	판매자의 판매상태 보여주는 페이지
	List<Order_DTO> sellermanage(String user_id);
	int orderstatechange(String order_num);
	
}
