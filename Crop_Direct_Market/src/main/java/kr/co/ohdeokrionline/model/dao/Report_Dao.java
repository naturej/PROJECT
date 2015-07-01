package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Report_DTO;

public interface Report_Dao {
		// 신고 작성 
		public void reportInsert(Report_DTO report);
		// 신고 리스트
		public ArrayList<Report_DTO> reportList();
}
