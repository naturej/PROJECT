package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO;

public interface ShoppingBasket_Dao {
	// 장바구니 리스트 보여주기
	public ArrayList<ShoppingBasket_DTO> shoplist() throws SQLException;
	// 장바구니 넣기
	public void insertshop(int bo_num, String sell_id, int sh_quantity);
}	
