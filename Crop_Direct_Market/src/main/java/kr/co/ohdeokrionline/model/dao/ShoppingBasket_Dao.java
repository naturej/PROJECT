package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO;

public interface ShoppingBasket_Dao {
	// 장바구니 리스트 보여주기
	public ArrayList<ShoppingBasket_DTO> shoplist() throws SQLException;
	// 장바구니 넣기
	public void insertshop(ShoppingBasket_DTO dto);
	// 에누리 -> 장바구니
	public void enuritoshop(ShoppingBasket_DTO dto);
	// 장바구니 선택삭제
	public void deleteshop(int bo_num);
	// 장바구니 비우기
	public void deleteall();
}	
