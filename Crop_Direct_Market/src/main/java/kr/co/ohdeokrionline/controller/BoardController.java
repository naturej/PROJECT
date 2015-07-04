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
import kr.co.ohdeokrionline.model.vo.B_reply_DTO;
import kr.co.ohdeokrionline.model.vo.Board_DTO;
import net.sf.json.JSONArray;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/board/")
public class BoardController {
		
		@Autowired
		private SqlSession sqlsession;
	
			@RequestMapping("boardlist.five")
			public String boardlist(String pg,Model model,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		 	//(String pg , String f , String q , Model model)
		 	int page = 1;
			//String field = "TITLE";
			//String query ="%%";
			if(pg != null && !pg.equals("")){
				page = Integer.parseInt(pg);
			}
			//if(f != null && !f.equals("")){
			//	field = f;
			//}
			//if(q != null && !q.equals("")){
			//	query = q;
			//}
			//System.out.println(pg+" / "+f+" / "+q);
			System.out.println(page);
			Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			//System.out.println(pg+" / "+f+" / "+q);
			//List<Board_DTO> list = boardDao.getBoardlist(page, field, query);
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
			for(int i=1;i<list.size();i++){
				System.out.println(list.get(i).getWritedate());
				System.out.println(list.get(i).getSubject());
				
			}
			System.out.println(page+maxpage+startpage+endpage);
			request.setAttribute("page",page);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			
			//System.out.println(pg+" / "+f+" / "+q);
			
			return "board.boardlist";
	 }

		 //글등록
		 @RequestMapping(value="boardwrite.five" , method=RequestMethod.GET)
		 public String boardReg(Model model,Principal principal){
			 	model.addAttribute("user_id",principal.getName());
				return "board.boardwrite";
		  }
	
		 //글등록 처리(실제 글등록 처리)
		 @RequestMapping(value="boardwrite.five",method=RequestMethod.POST)
		 public String boardReg(Board_DTO n, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException{
					
			 			CommonsMultipartFile file =n.getFile();
			 			String con = n.getEditor1();
			 			
			 			System.out.println(file);
			 			String fname = file.getOriginalFilename();
				       if(file != null){
						String path = request.getServletContext().getRealPath("/board/upload");
						String fullpath = path + "\\" + fname;
						
						if(!fname.equals("")){
							//서버에 물리적 경로 파일쓰기작업
							FileOutputStream fs = new FileOutputStream(fullpath);
							fs.write(file.getBytes());
							fs.close();
						}
				       }
				       System.out.println(fname);
				       Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
						n.setFilename(fname);
						n.setContent(con);
					  //n.setUser_id(principal.getName());
				boardDao.insert(n);
				return "redirect:boardlist.five"; //요청 주소
		 }	
		 
		 //글상세보기
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
		 
		//수정글
			@RequestMapping(value={"boardedit.five"},method=RequestMethod.GET)   //=>customer/notice.htm
			public String noticeEdit(String idx, Model model){
				 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
				 Board_DTO boardDto = boardDao.detailboard(idx);
				 model.addAttribute("boardDto", boardDto);
			   	   return "board.boardedit";
				}
		 
		//수정 실행문
		@RequestMapping(value={"boardedit.five"},method=RequestMethod.POST)   //=>customer/notice.htm
		public String noticeEdit(Board_DTO n, HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
			   
				if(!n.getFile().isEmpty()){
				   	String fname = n.getFile().getOriginalFilename();
				   	String con = n.getEditor1();
					String path = request.getServletContext().getRealPath("/board/upload");
					String fpath = path + "\\" + fname;
					//파일쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(n.getFile().getBytes());
					fs.close();
					n.setFilename(fname); //파일이름
					n.setContent(con);
				}
				Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
				boardDao.update(n);	
		   	   return "redirect:detailboard.five?idx="+n.getIdx();
			}
		 
		 
		//글삭제하기
		 @RequestMapping("boarddelete.five") 
		public String noticeDel(String idx,Principal principal) throws ClassNotFoundException, SQLException{
			 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 boardDao.re_del(idx);
			 boardDao.delete(idx);
			return "redirect:boardlist.five";
		}  
		  
		 //댓글쓰기처리
		 @RequestMapping(value="replywrite.five", method=RequestMethod.POST)
		 public void replyreg(HttpServletResponse response, String idx,Principal principal,String re_content) throws IOException{
			 response.setCharacterEncoding("UTF-8");
			 Board_Dao boardDao= sqlsession.getMapper(Board_Dao.class);
			 B_reply_DTO re = new B_reply_DTO();
			 re.setIdx(Integer.parseInt(idx));
			 re.setRe_content(re_content);
			 re.setUser_id(principal.getName());
			 boardDao.re_insert(re);
			 
			 List<B_reply_DTO> list = boardDao.re_list(idx);
			 JSONArray relists = JSONArray.fromObject(list);
	         response.getWriter().print(relists);
		 } 
		 
	}

