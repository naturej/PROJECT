package kr.co.ohdeokrionline.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.ohdeokrionline.model.dao.Market_Dao;
import kr.co.ohdeokrionline.model.vo.Market_DTO;

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
	 public String marketlist(String pg,Model model) throws ClassNotFoundException, SQLException{
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
			Market_Dao marketDao= sqlsession.getMapper(Market_Dao.class);
			//System.out.println(pg+" / "+f+" / "+q);
			//List<Board_DTO> list = boardDao.getBoardlist(page, field, query);
			List<Market_DTO> list = marketDao.getMarketlist(page);
			model.addAttribute("list", list);
			//System.out.println(pg+" / "+f+" / "+q);
			
			return "market/marketlist";
	 }

 
	 @RequestMapping(value="marketwrite.five" , method=RequestMethod.GET)
	 public String marketReg(){
		 System.out.println("화면출력");
			return "market/marketwrite";
	  }

	 
	//글등록 처리(실제 글등록 처리)
	 
		 @RequestMapping(value="marketwrite.five",method=RequestMethod.POST)
		 public String marketReg(Market_DTO n, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException{
						
			 			System.out.println("여긴오냐");
			 			CommonsMultipartFile file =n.getFile();
			 			System.out.println(file);
			 			String fname = file.getOriginalFilename();
				       if(file != null){
						String path = request.getServletContext().getRealPath("/WEB-INF/views/market/upload");
						String fullpath = path + "\\" + fname;
						System.out.println(fname);
						System.out.println(path);
						System.out.println(fullpath);
						
						if(!fname.equals("")){
							//서버에 물리적 경로 파일쓰기작업
							FileOutputStream fs = new FileOutputStream(fullpath);
							fs.write(file.getBytes());
							fs.close();
						}
				       }
				      
				       System.out.println(fname);
				       Market_Dao marketDao= sqlsession.getMapper(Market_Dao.class);
						//DB insert (파일명)
						n.setMar_photo(fname);
					  //n.setUser_id(principal.getName());
							//Tiles 로 바뀌지 않는다
						marketDao.insert(n);
				return "redirect:marketlist.five"; //요청 주소
		 }	
		 
		 @RequestMapping("detailmarket.five")
		 public String noticeDetail(int mar_id, Model model) throws ClassNotFoundException, SQLException{
			 Market_Dao marketDao= sqlsession.getMapper(Market_Dao.class);
			 //boardDao.hitUp(idx);
			 System.out.println("index : " + mar_id);
			
			 Market_DTO marketDto = marketDao.detailmarket(mar_id);
			 model.addAttribute("marketDto", marketDto);
			 return "market/marketdetail"; 
		 }
		 
			//글삭제하기
		 @RequestMapping("marketdelete.five") 
		public String noticeDel(int mar_id) throws ClassNotFoundException, SQLException{
			 Market_Dao marketDao= sqlsession.getMapper(Market_Dao.class);
			 marketDao.delete(mar_id);
			
			//Tiles 로 바뀌지 않는다 (요청 주소)
			return "redirect:marketlist.five";
		}  
	 
	}
