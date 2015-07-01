package kr.co.ohdeokrionline.model.dao;

import kr.co.ohdeokrionline.model.vo.Report_DTO;

public interface Report_Dao {
		// 신고 작성 
		public void reportInsert(Report_DTO report);
}
