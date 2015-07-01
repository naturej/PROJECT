package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BalanceSheet_Dao {
	int totalsell(String sell_user);
	HashMap<String, Integer>sellpercent(String sell_user);
	ArrayList<HashMap<String, Integer>> sellrec(String sell_user);
}
