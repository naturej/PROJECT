package kr.co.ohdeokrionline.model.dao;

import java.util.HashMap;

public interface BalanceSheet_Dao {
	int totalsell(String sell_user);
	HashMap<String, Integer>sellpercent(String sell_user);
}
