package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.B_reply_DTO;
import kr.co.ohdeokrionline.model.vo.Board_DTO;

public interface Board_Dao {
	//게시물 개수
		public int getCount();
		//전체 게시물
		//public List<Board_DTO> getBoardlist(int page, String field, String query);
		public List<Board_DTO> getBoardlist(int page);
		//게시물 삭제
		public int delete(String idx);
		//게시물 수정
		public int update(Board_DTO board);
		//게시물 상세
		public Board_DTO detailboard(String idx);
		//조회수 증가
		public void hitUp(String idx);
		//게시물 입력
		public int insert(Board_DTO board);
		//댓글입력
		public int re_insert(B_reply_DTO reply);
		//댓글리스트
		public List<B_reply_DTO> re_list(String idx);
		//댓글 리스트 삭제
		public int re_del(String idx);
		

}
