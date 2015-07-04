package kr.co.ohdeokrionline.model.dao;

import kr.co.ohdeokrionline.model.vo.BalanceSheet_DTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BalanceSheet_Dao {
	int totalsell(String sell_user);
	HashMap<String, Integer>sellpercent(String sell_user);
	ArrayList<HashMap<String, Integer>> sellrec(String sell_user);
	
	
		//손익계산서 list 출력
		public List<BalanceSheet_DTO> getbal(String user_id,String bal_date);
		
		//손익계산서 우뮤 확인
		public int balcount(String user_id,String bal_date);
		
		//손익계산서 INSERT 확인
		public int insertbal(BalanceSheet_DTO bal);
		
		//손익계산서 UPDATE 확인
		public int updatebal(BalanceSheet_DTO bal);
		
		//손익계산서 graph 화 income
		public List getbalgra_income(String user_id,String bal_date);
				
		//손익계산서 graph 화 date
		public List getbalgra_date(String user_id,String bal_date);
				
		//손익계산서 graph 화 total
		public List getbalgra_total(String user_id,String bal_date);
						
		//손익계산서 graph 화 amount
		public List getbalgra_amount(String user_id,String bal_date);
				
		//ROUND GRAPH 온라인매출
		public List gra_salon(String user_id,String bal_date);
				
		//ROUND GRAPH 직거래장터매출
		public List gra_salmar(String user_id,String bal_date);
				
	
}
