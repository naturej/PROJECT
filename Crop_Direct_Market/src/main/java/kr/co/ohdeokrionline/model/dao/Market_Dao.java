package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.Market_DTO;

public interface Market_Dao {
		//게시물 개수
		public int getCount();
		//참가자 수
		public int getCount2(int mar_id);
		//전체 게시물
		public List<Market_DTO> getMarketlist(int page);
		//게시물 삭제
		public int delete(int mar_id);
		//게시물 수정
		public int update(Market_DTO market);
		//참가 등록
		int updatepart(int mar_id, String mar_parti);
		//게시물 상세
		public Market_DTO detailmarket(int mar_id);
		//조회수 증가
		public void hitUp(int mar_id);
		//게시물 입력
		public int insert(Market_DTO market);
}
