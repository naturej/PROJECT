package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.vo.Order_DTO;
import kr.co.ohdeokrionline.model.dao.Order_Dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.vo.Freem_DTO;
import kr.co.ohdeokrionline.model.dao.Freem_Dao;
import kr.co.ohdeokrionline.model.dao.Enuri_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.dao.Report_Dao;
import kr.co.ohdeokrionline.model.dao.ReviewWrite_Dao;
import kr.co.ohdeokrionline.model.dao.SaleBoard_Dao;
import kr.co.ohdeokrionline.model.dao.SalesBoard_Dao;
import kr.co.ohdeokrionline.model.dao.ShoppingBasket_Dao;
import kr.co.ohdeokrionline.model.vo.Enuri_DTO;
import kr.co.ohdeokrionline.model.vo.FarmRecord_DTO;
import kr.co.ohdeokrionline.model.vo.Message_DTO;
import kr.co.ohdeokrionline.model.vo.Product_DTO;
import kr.co.ohdeokrionline.model.vo.Report_DTO;
import kr.co.ohdeokrionline.model.vo.ReviewWrite_DTO;
import kr.co.ohdeokrionline.model.vo.SalesBoard_DTO;
import kr.co.ohdeokrionline.model.vo.Separate_DTO;
import kr.co.ohdeokrionline.model.vo.ShoppingBasket_DTO;
import kr.co.ohdeokrionline.model.vo.Unit_DTO;
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
@RequestMapping("/freemboard/")
public class FreemController {
	@Autowired
	private SqlSession sqlSession;
	
	//판매글 리스트 출력
	@RequestMapping("freemboardlist.five")
	public String freemboardlist(String pg,Model model,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		
		int page = 1;
		if(pg != null && !pg.equals("")){
			page = Integer.parseInt(pg);
		}

		System.out.println(page);
		Freem_Dao freemDao= sqlSession.getMapper(Freem_Dao.class);
		
		int total = freemDao.getCount();
		System.out.println(total);
		int listnum=16;
		int maxpage=0;
		
		if(total%listnum!=0){
			maxpage=total/listnum+1;
		}else{
			maxpage=total/listnum;
		}
		
		int startpage =(int)((double)page/listnum+0.96);
		int endpage=maxpage;
		
		if(endpage>startpage+16-1) endpage=startpage+16-1;
		
		List<Freem_DTO> list = freemDao.getFreemlist(page);
		model.addAttribute("list", list);
		System.out.println("page : "+page+" maxpage : "+maxpage+" startpage : "+startpage+" endpage : "+endpage);
		request.setAttribute("page",page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		
		
		return "freemboard.freemboardlist";
		}
		
		//판매글등록
		 @RequestMapping(value="freemboardwrite.five" , method=RequestMethod.GET)
		 public String freemboardReg(Model model,Principal principal){
			 	model.addAttribute("user_id",principal.getName());
				return "freemboard.freemboardwrite";
		  }

	 	//판매글등록 처리(실제 글등록 처리)
	 	@RequestMapping(value="freemboardwrite.five",method=RequestMethod.POST)
	 	public String salboardReg(Freem_DTO n, HttpServletRequest request,Principal principal) throws IOException, ClassNotFoundException, SQLException{
	 		Freem_Dao freemDao= sqlSession.getMapper(Freem_Dao.class);
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
			n.setFm_photo(fname);
	       }
			String con = n.getEditor1();
			n.setFm_content(con);
			List<FarmRecord_DTO> list = freemDao.farminfo(principal.getName());
			n.setFarminfo(list.get(0).getFarminfo());
			String add=list.get(0).getFarm_add();
			String add_de=list.get(0).getFarm_add_de();
			String loc=add+add_de;
			System.out.println(add);
			System.out.println(add_de);
			n.setFm_location(loc);
			n.setPro_name(list.get(0).getPro_name());
			n.setUser_id(principal.getName());
			freemDao.insert(n);
			return "redirect:freemboardlist.five"; //요청 주소
	 		}	
	
	 	//판매글상세보기
 		@RequestMapping("freemboarddetail.five")
 		public String salesdetail(String fm_id, Model model) throws ClassNotFoundException, SQLException{
 		System.out.println("상세보기 controller 진입");
 		Freem_Dao freemDao= sqlSession.getMapper(Freem_Dao.class);
 		Freem_DTO freemDto = freemDao.detailboard(fm_id);
 		System.out.println("mapper소환 Dto에 bo_num");
		 model.addAttribute("freemDto", freemDto);
		 
		 return "freemboard.freemboarddetail"; 
	 }

 		 //수정 기존데이터 출력
		 @RequestMapping(value="salboardedit.five",method=RequestMethod.GET)
			public String salboardedit(String bo_num, Model model) throws ClassNotFoundException, SQLException{
			 	SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 		SalesBoard_DTO salboardDto = salboardDao.salesdetail(bo_num);
			 	model.addAttribute("salboardDto", salboardDto);
			 	return "salesboard.salboardedit";
			}
		 
		//수정 실행문
		@RequestMapping(value={"salboardedit.five"},method=RequestMethod.POST)   //=>customer/notice.htm
		public String salboardedit(SalesBoard_DTO n, HttpServletRequest request) throws ClassNotFoundException, SQLException, IOException{
			   
					CommonsMultipartFile file =n.getFile();
					System.out.println(file);
					String fname = file.getOriginalFilename();
				if(!n.getFile().isEmpty()){
					String path = request.getServletContext().getRealPath("/salesboard/upload");
					String fpath = path + "\\" + fname;
					//파일쓰기 작업
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(n.getFile().getBytes());
					fs.close();
					n.setBo_photo(fname); //파일이름 
				}
				SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
				salboardDao.update(n);	
		   	   return "redirect:salesdetail.five?bo_num="+n.getBo_num();
			}
		 
		//판매글삭제하기
		 @RequestMapping("salboarddelete.five") 
		public String salboardDel(String bo_num) throws ClassNotFoundException, SQLException{
			 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
			 salboardDao.delete(bo_num);
			return "redirect:salboardlist.five";
		}  
		 
	
}
