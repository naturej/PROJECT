package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;

import kr.co.ohdeokrionline.model.vo.Dirm_DTO;

public interface Dirm_Dao {
	// 직거래 쪽지 목록
	public ArrayList<Dirm_DTO> dirmList(String user_rec);
	// 직거래 신청
	public void insertDirm(Dirm_DTO dirm);
	// 직거래 상세보기
	public Dirm_DTO dirmDetail(String dirmno);
	// 직거래 승인
	public void yesDirm(String dirmno);
}
