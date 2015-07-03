package kr.co.ohdeokrionline.model.dao;

import kr.co.ohdeokrionline.model.vo.Account_DTO;
import kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO;

import java.util.List;

import kr.co.ohdeokrionline.model.vo.Order_DTO;

public interface Order_Dao {
	
//	판매자의 판매상태 보여주는 페이지
	List<Order_DTO> sellermanage(String user_id);
	int orderstatechange(String order_num, int bo_num);
	
	//주문 입력
	public int insert(Order_DTO order);
	
	//주문 번호 생성
	public String orid();
	
	//주문 완료 후 장바구니 삭제
	public int delshopbag(ShoppingBasket_DTO shopbag);
	
	//주문 완료 후 장바구니 LIST 비동기 처리
	public List<ShoppingBasket_DTO> shopbaglist(String user_id);
	
	//주문 LIST 출력문
	public List<Order_DTO> orderlist(String buy_userid);
	
	//실구매자 아이디 출력
	public List<String> buyUser(String bo_num);
	
	
//	구매자 입금 상태 변경(대기->입금확인 중)
	public int moneychecking(String order_id, int bo_num);
	
//	판매자 계좌 정보 확인 쿼리
	public List<Account_DTO> seller_account(String sell_userid);
	
	// 실구매자 여부 출력
	// public String buyUser(String bo_num, String buy_userid);
	
}
