package kr.co.ohdeokrionline.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.Market_Dao;
import kr.co.ohdeokrionline.model.dao.ScheduleRecord2_Dao;
import kr.co.ohdeokrionline.model.vo.Market_DTO;
import kr.co.ohdeokrionline.model.vo.ScheduleRecord2_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class MarketController {
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping("marketlist.five")
	public String marketlist(String pg, Model model, HttpServletRequest request)
			throws ClassNotFoundException, SQLException {

		int page = 1;

		if (pg != null && !pg.equals("")) {
			page = Integer.parseInt(pg);
		}

		System.out.println(page);
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);

		int total = marketDao.getCount();
		System.out.println(total);
		int listnum = 8;
		int maxpage = 0;

		if (total % listnum != 0) {
			maxpage = total / listnum + 1;
		} else {
			maxpage = total / listnum;
		}

		int startpage = (int) ((double) page / listnum + 0.9);
		int endpage = maxpage;

		if (endpage > startpage + 8 - 1)
			endpage = startpage + 8 - 1;

		List<Market_DTO> list = marketDao.getMarketlist(page);
		model.addAttribute("list", list);
		System.out.println("page : " + page + " maxpage : " + maxpage
				+ " startpage : " + startpage + " endpage : " + endpage);

		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);

		// System.out.println(pg+" / "+f+" / "+q);

		return "market.marketlist";
	}

	@RequestMapping(value = "marketwrite.five", method = RequestMethod.GET)
	public String marketReg() {
		System.out.println("화면출력");
		return "market.marketwrite";
	}

	// 글등록 처리(실제 글등록 처리)

	@RequestMapping(value = "marketwrite.five", method = RequestMethod.POST)
	public String marketReg(Market_DTO n, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {

		System.out.println("여긴오냐");
		CommonsMultipartFile file = n.getFile();
		System.out.println(file);
		String fname = file.getOriginalFilename();
		if (file != null) {
			String path = request.getServletContext().getRealPath(
					"/market/upload");
			String fullpath = path + "\\" + fname;
			System.out.println(fname);
			System.out.println(path);
			System.out.println(fullpath);

			if (!fname.equals("")) {
				// 서버에 물리적 경로 파일쓰기작업
				FileOutputStream fs = new FileOutputStream(fullpath);
				fs.write(file.getBytes());
				fs.close();
			}
		}

		System.out.println(fname);
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);
		
		// DB insert (파일명)
		n.setMar_photo(fname);
		// n.setUser_id(principal.getName());
		// Tiles 로 바뀌지 않는다
		marketDao.insert(n);
		return "redirect:marketlist.five"; // 요청 주소
	}

	@RequestMapping("detailmarket.five")
	public String noticeDetail(int mar_id, Model model,
			HttpServletRequest request) throws ClassNotFoundException,
			SQLException {
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);

		System.out.println("index : " + mar_id);
		int person = marketDao.getCount2(mar_id);
		System.out.println("index : " + person);
		request.setAttribute("person", person);
		Market_DTO marketDto = marketDao.detailmarket(mar_id);

		model.addAttribute("marketDto", marketDto);
		return "market.marketdetail";
	}

	// 참가등록
	@RequestMapping(value = { "marketpart.five" })
	public void marketparti(HttpServletResponse response,
			HttpServletRequest request) throws IOException, SQLException {
		int mar_id = Integer.parseInt(request.getParameter("mar_id"));
		String mar_parti = ", " + request.getParameter("mar_parti");
		System.out.println(mar_id);
		System.out.println(mar_parti);
		System.out.println(request.getParameter("mar_date"));
		String[] date = request.getParameter("mar_date").trim().split(". ");
		System.out.println(Arrays.toString(date));
		System.out.println(date[0]+"/"+date[1]+"/"+date[2]);
		Market_Dao market_dao = sqlsession.getMapper(Market_Dao.class);
		ScheduleRecord2_Dao schedule2Dao = sqlsession.getMapper(ScheduleRecord2_Dao.class);
		ScheduleRecord2_DTO schedule = new ScheduleRecord2_DTO();
		schedule.setUser_id(request.getParameter("mar_parti"));
		schedule.setPro_name("보리");
		schedule.setTitle(request.getParameter("mar_subject"));
		schedule.setContent(request.getParameter("mar_subject")+" 참가");
		// format 변경
		schedule.setStart(
				new Date(Integer.parseInt(date[0])-1900,
						Integer.parseInt(date[1])-1,
						Integer.parseInt(date[2])).toString()
						);
		
		schedule.setEnd(
				new Date(Integer.parseInt(date[0])-1900,
						Integer.parseInt(date[1])-1,
						Integer.parseInt(date[2])).toString()
						);
		schedule2Dao.scheduleAdd(schedule);
		response.getWriter().write(market_dao.updatepart(mar_id, mar_parti));
		int person = market_dao.getCount2(mar_id);
		request.setAttribute("person", person);
	}

	@RequestMapping(value = { "marketpart2.five" })
	public void marketparti2(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		System.out.println(request.getParameter("mar_id"));
		System.out.println(request.getParameter("mar_parti"));
		int mar_id = Integer.parseInt(request.getParameter("mar_id"));
		System.out.println(mar_id);
		Market_Dao market_dao = sqlsession.getMapper(Market_Dao.class);
		market_dao.getCount2(mar_id);
	}

	// 글삭제하기
	@RequestMapping("marketdelete.five")
	public String noticeDel(int mar_id) throws ClassNotFoundException,
			SQLException {
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);
		marketDao.delete(mar_id);

		// Tiles 로 바뀌지 않는다 (요청 주소)
		return "redirect:marketlist.five";
	}

	// 수정글
	@RequestMapping(value = { "marketedit.five" }, method = RequestMethod.GET)
	// =>customer/notice.htm
	public String noticeEdit(int mar_id, Model model) {
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);
		Market_DTO marketDto = marketDao.detailmarket(mar_id);
		model.addAttribute("marketDto", marketDto);
		return "market.marketedit";
	}

	// 수정 실행문
	@RequestMapping(value = { "marketedit.five" }, method = RequestMethod.POST)
	// =>customer/notice.htm
	public String noticeEdit(Market_DTO n, HttpServletRequest request)
			throws ClassNotFoundException, SQLException, IOException {

		if (!n.getFile().isEmpty()) {
			String fname = n.getFile().getOriginalFilename();
			String con = n.getEditor1();
			String path = request.getServletContext().getRealPath(
					"/market/upload");
			String fpath = path + "\\" + fname;
			// 파일쓰기 작업
			FileOutputStream fs = new FileOutputStream(path);
			fs.write(n.getFile().getBytes());
			fs.close();
			n.setMar_photo(fname); // 파일이름
			n.setMar_content(con);
		}
		Market_Dao marketDao = sqlsession.getMapper(Market_Dao.class);
		marketDao.update(n);
		System.out.println("11");
		return "redirect:marketdetail.five?mar_id=" + n.getMar_id();
	}

}
