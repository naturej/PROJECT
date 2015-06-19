package kr.co.ohdeokrionline.model.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.SalesBoard_DTO;
import kr.co.ohdeokrionline.model.vo.Unit_DTO;

public interface SalesBoard_Dao {

	public int getCount(String field, String query);
	//전체 게시물
	//public List<Board_DTO> getBoardlist(int page, String field, String query);
	public List<SalesBoard_DTO> saleslist(int page);
	//게시물 삭제
	public int delete(String bo_num);
	//게시물 수정
	public int update(SalesBoard_DTO salesboard);
	//게시물 상세
	public SalesBoard_DTO salesdetail(String bo_num);
	//게시물 입력
	public int insert(SalesBoard_DTO salesboard);
	
	public ArrayList<Unit_DTO> unitlist();
	//리뷰
	//public int re_insert(B_reply_DTO reply);
	//리뷰리스트
	//public List<B_reply_DTO> re_list(String idx);
	
	
	
}
