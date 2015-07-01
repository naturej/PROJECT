package kr.co.ohdeokrionline.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.ohdeokrionline.model.vo.Freem_DTO;

public interface Freem_Dao {
	//게시물 개수
		public int getCount();
		//전체 게시물
		public List<Freem_DTO> getFreemlist(int page);
		//게시물 삭제
		public int delete(String fm_id);
		//게시물 수정
		public int update(Freem_DTO Freem);
		//게시물 상세
		public Freem_DTO detailboard(String fm_id);
		//조회수 증가
		public void hitUp(String fm_id);
		//게시물 입력
		public int insert(Freem_DTO Freem);

}
