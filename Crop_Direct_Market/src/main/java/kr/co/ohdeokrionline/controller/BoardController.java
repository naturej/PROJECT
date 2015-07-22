package kr.co.ohdeokrionline.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.Board_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.vo.B_reply_DTO;
import kr.co.ohdeokrionline.model.vo.Board_DTO;
import kr.co.ohdeokrionline.model.vo.Message_DTO;
import net.sf.json.JSONArray;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/board/")
public class BoardController {
		
		//공지사항 LIST 출력문
		@Autowired
		private SqlSession sqlsession;
			@RequestMapping("boardlist.five")
			public String boardlist(String pg,Model model,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		 	int page = 1;
			if(pg != null && !pg.equals("")){
				page = Integer.parseInt(pg);
			}
			Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			int total = boardDao.getCount();
			int listnum=10;
			int maxpage=0;
			if(total%listnum!=0){
				maxpage=total/listnum+1;
			}else{
				maxpage=total/listnum;
			}
			int startpage =(int)((double)page/listnum+0.9);
			int endpage=maxpage;
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			List<Board_DTO> list = boardDao.getBoardlist(page);
			model.addAttribute("list", list);
			request.setAttribute("page",page);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			return "board.boardlist";
	 }

		 //공지사항 글등록
		 @RequestMapping(value="boardwrite.five" , method=RequestMethod.GET)
		 public String boardReg(Model model,Principal principal){
			 	model.addAttribute("user_id",principal.getName());
				return "board.boardwrite";
		  }
	
		 //공지사항 글등록 처리(실제 글등록 처리)
		 @RequestMapping(value="boardwrite.five",method=RequestMethod.POST)
		 public String boardReg(Board_DTO n, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException{
			 			Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 			CommonsMultipartFile file =n.getFile();
			 			String fname = file.getOriginalFilename();
				       if(file != null){
						String path = request.getServletContext().getRealPath("/upload");
						String fullpath = path + "\\" + fname;
						if(!fname.equals("")){
							FileOutputStream fs = new FileOutputStream(fullpath);
							fs.write(file.getBytes());
							fs.close();
						}
						n.setFilename(fname);
				       }
						String con = n.getEditor1();
						n.setContent(con);
				boardDao.insert(n);
				return "redirect:boardlist.five"; //요청 주소
		 }	
		 
		 //공지사항 상세보기
		 @RequestMapping("detailboard.five")
		 public String noticeDetail(String idx, Model model) throws ClassNotFoundException, SQLException{
			 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 Board_DTO boardDto = boardDao.detailboard(idx);
			 boardDao.hitUp(idx);
			 List<B_reply_DTO> list = boardDao.re_list(idx);
			 model.addAttribute("boardDto", boardDto);
			 model.addAttribute("list", list);
			 return "board.boarddetail"; 
		 }
		 
		//공지사항 수정 FORM
			@RequestMapping(value={"boardedit.five"},method=RequestMethod.GET)   //=>customer/notice.htm
			public String noticeEdit(String idx, Model model){
				 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
				 Board_DTO boardDto = boardDao.detailboard(idx);
				 model.addAttribute("boardDto", boardDto);
			   	   return "board.boardedit";
				}
		 
		//공지사항 수정 실행문
		@RequestMapping(value={"boardedit.five"},method=RequestMethod.POST)   //=>customer/notice.htm
		public String noticeEdit(Board_DTO n, HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
				Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 	String con = n.getEditor1();
				CommonsMultipartFile file =n.getFile();
				String fname = file.getOriginalFilename();
				if(!n.getFile().isEmpty()){
					String path = request.getServletContext().getRealPath("/board/upload");
					String fpath = path + "\\" + fname;
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(n.getFile().getBytes());
					fs.close();
					n.setFilename(fname); //파일이름
				}
				n.setContent(con);
				boardDao.update(n);	
		   	   return "redirect:detailboard.five?idx="+n.getIdx();
			}
		 
		 
		//공지사항 삭제하기
		 @RequestMapping("boarddelete.five") 
		public String noticeDel(String idx,Principal principal) throws ClassNotFoundException, SQLException{
			 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 boardDao.re_del(idx);
			 boardDao.delete(idx);
			return "redirect:boardlist.five";
		}  
		 
		 
		 //공지사항 글쓰기처리
		 @RequestMapping(value="replywrite.five", method=RequestMethod.POST)
		 public void replyreg(HttpServletResponse response, String idx,Principal principal,String re_content) throws IOException{
			 response.setCharacterEncoding("UTF-8");
			 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 B_reply_DTO re = new B_reply_DTO();
			 re.setIdx(Integer.parseInt(idx));
			 re.setRe_content(re_content);
			 re.setUser_id(principal.getName());
			 boardDao.re_insert(re);
		 } 
		 
		//공지사항 자신 댓글 삭제
			@RequestMapping(value="re_del.five", method=RequestMethod.POST)
			public void redel(int re_idx,String idx,HttpServletResponse response) throws IOException{
				 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
				 boardDao.re_ondel(re_idx);
			 }
		
			// 메시지 발송창 팝업 
			@RequestMapping("popup.five")
			public String openpopup(Model model, Principal principal, String rec_userid) {
				model.addAttribute("rec_userid", rec_userid);
				model.addAttribute("send_userid", principal.getName());
				return "marketplace/messageForm";
			}
			
			// 메세지 보내기
			@Transactional
			@RequestMapping("sendMessage.five")
			public void insert(Message_DTO message) {
				System.out.println("sendmsg");
				Message_Dao dao = sqlsession.getMapper(Message_Dao.class);
				dao.insertRec(message);
				dao.insertSend(message);
				System.out.println("insert구문 종료");
		}
	}

