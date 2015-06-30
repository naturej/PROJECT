package kr.co.ohdeokrionline.model.dao;

import kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO;

import java.util.List;

import kr.co.ohdeokrionline.model.vo.Order_DTO;

public interface Order_Dao {
	
//	판매자의 판매상태 보여주는 페이지
	List<Order_DTO> sellermanage(String user_id);
	int orderstatechange(String order_num);
	
	//주문 입력
	public int insert(Order_DTO order);
	
	//주문 번호 생성
	public String orid();
	
	//주문 완료 후 장바구니 삭제
	public int delshopbag(ShoppingBasket_DTO shopbag);
	
	//주문 완료 후 장바구니 LIST 비동기 처리
	public List<ShoppingBasket_DTO> shopbaglist(String user_id);
	
	
	
}
