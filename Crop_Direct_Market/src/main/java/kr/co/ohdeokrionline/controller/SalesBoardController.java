package kr.co.ohdeokrionline.controller;

import kr.co.ohdeokrionline.model.vo.Member_DTO;
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

import kr.co.ohdeokrionline.model.dao.Enuri_Dao;
import kr.co.ohdeokrionline.model.dao.Member_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.dao.Report_Dao;
import kr.co.ohdeokrionline.model.dao.ReviewWrite_Dao;
import kr.co.ohdeokrionline.model.dao.SaleBoard_Dao;
import kr.co.ohdeokrionline.model.dao.SalesBoard_Dao;
import kr.co.ohdeokrionline.model.dao.ShoppingBasket_Dao;
import kr.co.ohdeokrionline.model.vo.Enuri_DTO;
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
@RequestMapping("/salesboard/")
public class SalesBoardController {
	@Autowired
	private SqlSession sqlSession;
	
	//판매글 리스트 출력
	@RequestMapping("salboardlist.five")
	public String salboardlist(String pg,Model model,HttpServletRequest request) throws ClassNotFoundException, SQLException{
		int page = 1;
		if(pg != null && !pg.equals("")){
			page = Integer.parseInt(pg);
		}
		System.out.println(page);
		SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		
		int total = salboardDao.getCount();
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
		
		List<SalesBoard_DTO> list = salboardDao.saleslist(page);
		model.addAttribute("list", list);
		System.out.println("page : "+page+" maxpage : "+maxpage+" startpage : "+startpage+" endpage : "+endpage);
		request.setAttribute("page",page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		return "salesboard.salboardlist";
		}
		
		//판매글등록
		 @RequestMapping(value="salboardwrite.five" , method=RequestMethod.GET)
		 public String salboardReg(Model model,Principal principal){
			 	model.addAttribute("user_id",principal.getName());
				return "salesboard.salboardwrite";
		  }

	 	//판매글등록 처리(실제 글등록 처리)
	 	@RequestMapping(value="salboardwrite.five",method=RequestMethod.POST)
	 	public String salboardReg(SalesBoard_DTO n, HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException{
		 			CommonsMultipartFile file =n.getFile();
		 			System.out.println(file);
		 			String fname = file.getOriginalFilename();
			       if(file != null){
					String path = request.getServletContext().getRealPath("/salesboard/upload");
					String fullpath = path + "\\" + fname;
					if(!fname.equals("")){
						FileOutputStream fs = new FileOutputStream(fullpath);
						fs.write(file.getBytes());
						fs.close();
											}
			       					}
			       SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
					n.setBo_photo(fname);
					salboardDao.insert(n);
					return "redirect:salboardlist.five"; //요청 주소
	 		}	
	
	 	//판매글상세보기
 		@RequestMapping("salesdetail.five")
 		public String salesdetail(HttpServletRequest request,Model model) throws ClassNotFoundException, SQLException{
 		String bo_num=request.getParameter("bo_num");
 		
 		SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
 		List<SalesBoard_DTO> reviewDto = salboardDao.reviewlist(bo_num);
 		SalesBoard_DTO salboardDto = salboardDao.salesdetail(bo_num);
		 model.addAttribute("salboardDto", salboardDto);
		 model.addAttribute("list",reviewDto);
		 
		 Order_Dao orderDao = sqlSession.getMapper(Order_Dao.class);
		 List<String> buyList = orderDao.buyUser(bo_num);
		 model.addAttribute("buyList",buyList);

		 return "salesboard.salboarddetail"; 
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
		 
		//단위 select tag 
		 @RequestMapping("unitlist.five")  
		 public void unitlist(HttpServletResponse response) throws IOException{
			 response.setContentType("text/html;charset=utf-8");
			 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 List<Unit_DTO> list = salboardDao.unitlist();
		 JSONArray unitlists = JSONArray.fromObject(list);
         response.getWriter().print(unitlists);//서버로 데이터 전송
         System.out.println("서버로 list 전송완료");
	     }
		 
		//품종 select tag 
		 @RequestMapping("seplist.five")  
		 public void seplist(HttpServletResponse response) throws IOException{
  		 response.setContentType("text/html;charset=utf-8");
		 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 List<Separate_DTO> list = salboardDao.seplist();
		 JSONArray seplists = JSONArray.fromObject(list);
         response.getWriter().print(seplists);//서버로 데이터 전송
	     }
	 
		//상품 select tag 
		 @RequestMapping("prolist.five")  
		 public void prolist(HttpServletResponse response,String pro_sep) throws IOException{
		 response.setContentType("text/html;charset=utf-8");
		 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 ArrayList<Product_DTO> list = salboardDao.prolist(pro_sep);
		 JSONArray prolists = JSONArray.fromObject(list);
         response.getWriter().print(prolists);//서버로 데이터 전송
	     }

	// 테스트용 페이지 이동
	@RequestMapping("test.five")
	public String sendpage() {
		return "marketplace.messagetestpage";
	}

	// 메시지 발송창 팝업 
	@RequestMapping("popup.five")
	public String openpopup(Model model, Principal principal, String rec_userid) {
		model.addAttribute("rec_userid", rec_userid);
		model.addAttribute("send_userid", principal.getName());
		return "marketplace/messageForm";
	}
	
	// 받은 메세지함
	@RequestMapping("receiveList.five")
	public String receiveList(Model model, Principal principal){
		
		Message_Dao dao =  sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.listRec(principal.getName()));
		System.out.println(principal.getName());
		
		return "marketplace.receivelist";
	}
	
	// 보낸 메세지함
	@RequestMapping("sendList.five")
	public String sendList(Model model, Principal principal){
		
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		model.addAttribute("list",dao.listSend(principal.getName()));
		System.out.println(principal.getName());
		
		return "marketplace.sendlist";
	}
	
	// 받은 메세지 상세보기
	@Transactional
	@RequestMapping("RecDetail.five")
	public String RecDetail(Model model, String me_num){
		System.out.println("메세지 조회수 증가...");
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		Message_DTO dto = dao.recDetail(me_num);
		dao.updateSend(me_num);
		dao.updaterec(me_num);
		model.addAttribute("dto",dto);
		
		return "marketplace.receiveDetail";
	}
	
	// 보낸 메세지 상세보기
	@RequestMapping("SendDetail.five")
	public String SendDetail(Model model, String me_num){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		Message_DTO dto = dao.sendDetail(me_num);
		model.addAttribute("dto",dto);
		
		return "marketplace.sendDetail";
	}

	// 메세지 보내기
		@Transactional
		@RequestMapping("sendMessage.five")
		public void insert(Message_DTO message) {
			System.out.println("sendmsg");
			Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
			dao.insertRec(message);
			dao.insertSend(message);
			System.out.println("insert구문 종료");
	}
	
	// 보낸 메세지 삭제
	@RequestMapping("deleteSend.five")
	public String deleteSend(String me_num){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		dao.deleteSend(me_num);
		
		return "redirect:sendList.five";
	}
	
	// 받은 메세지 삭제
	@RequestMapping("deleteRec.five")
	public String deleteRec(String me_num){
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
		dao.deleteRec(me_num);
		
		return "redirect:receiveList.five";
	}
	// 에누리 테스트용 판매 글 이동
		@RequestMapping("sellpage.five")
		public String testdata(Model model) {
			SaleBoard_Dao dao = sqlSession.getMapper(SaleBoard_Dao.class);
			model.addAttribute("list", dao.salDetail());
			return "marketplace.test_sellpage";
		}

		// 에누리 신청 테스트 용 팝업 페이지 이동
		@RequestMapping("enuri_sinchung.five")
		public String openpopup_enuri(HttpServletRequest request,Model model, Principal principal) {
			String bo_num = request.getParameter("bo_num");
			SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
			SalesBoard_DTO salboardDto = salboardDao.salesdetail(bo_num);
			model.addAttribute("user_id", principal.getName());
			model.addAttribute("salboardDto", salboardDto); 
			return "marketplace/message_enuriForm";
		}
		
		//에누리 메시지 발송 메서드
		@RequestMapping("send_enuriMessage.five")
		public String send_enuri(Enuri_DTO enuri) {
			System.out.println("왔따~");
			Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
			System.out.println(enuri.toString());
			dao.insertEnuri(enuri);
			return null;
		}
	
//	// 에누리 리스트 
//	@Transactional
//	@RequestMapping("enulist.five")
//	public String enuList(Model model){
//		
//		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
//		model.addAttribute("list",dao.enuList());
////		salesboard 완성된 이후
////		model.addAttribute("bo_id",dao.bo_id(bo_num));
////		model.addAttribute("bo_subject",dao.bo_subject(bo_num));
//		
//		return "marketplace.enulist";
//	} 
	
	// 에누리 리스트 (판매자)
	@RequestMapping("enulistRec.five")
	public String enuListRec(Model model, Principal principal){
		
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		model.addAttribute("list",dao.enuListRec(principal.getName()));
		
		return "marketplace.enulist";
	} 
	
	// 에누리 리스트 (소비자)
	@RequestMapping("enulistSend.five")
	public String enuListSend(Model model, Principal principal){
		
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		model.addAttribute("list",dao.enuListSend(principal.getName()));
		
		return "marketplace.enulist";
	} 
		
	// 에누리 상세보기
	@RequestMapping("enuDetail.five")
	public String enuDetail(Model model, String enu_idx){
		
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		Enuri_DTO dto = dao.enuDetail(enu_idx);
		model.addAttribute("dto",dto);
		
		return "marketplace.enuDetail";
	}
	// 메세지 보내기
/*			@Transactional
			@RequestMapping("sendMessage.five")
			public void insert(Message_DTO message) {
				System.out.println("sendmsg");
				Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
				dao.insertRec(message);
				dao.insertSend(message);
				System.out.println("insert구문 종료");
		}*/
	
	// 에누리 수락
	@RequestMapping("yesEnuri.five")
	public String yesEnuri(String enu_idx){
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		dao.yesEnuri(enu_idx);
		//사용자 장바구니에 에누리 전달
		return "marketplace.yesEnuri";
	}
	
	// 에누리 거절
	@RequestMapping("noEnuri.five")
	public String noEnuri(String enu_idx){
		Enuri_Dao dao = sqlSession.getMapper(Enuri_Dao.class);
		dao.noEnuri(enu_idx);
		
		return "marketplace.noEnuri";
	}
	
//	 평가등록
	@RequestMapping("reviewReg.five")
	public void insertReview(ReviewWrite_DTO dto) {
		System.out.println("point2");
		ReviewWrite_Dao dao = sqlSession.getMapper(ReviewWrite_Dao.class);
		dao.reviewInsert(dto);
	}
//	팝업창 띄우기
	@RequestMapping("review_sinchung.five")
	public String review_popup(Model model, Principal principal) {
		model.addAttribute("user_id",principal.getName());
		return "marketplace/review";
	}
	
	//장바구니 리스트
	@RequestMapping("shopList.five")
	public String shoplist(Model model, Principal principal) throws SQLException{
		ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
		ArrayList<ShoppingBasket_DTO> list = dao.shoplist(principal.getName());
		List<Member_DTO> meminfo = dao.meminfo(principal.getName());
		System.out.println(list);
		model.addAttribute("list",list);
		model.addAttribute("meminfo",meminfo);
		
		return "mypage.shoppingbasket";
	}
	
	// 장바구니 넣기
	@RequestMapping(value="shopInsert.five",method=RequestMethod.POST)
	public void insertShop(ShoppingBasket_DTO dto, Principal principal){
		dto.setUser_id(principal.getName());	// 지금은 고정값.. 나중에 principal.getName()
		
		ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
		dao.insertshop(dto);
		
		//return "redirect:salesdetail.five?bo_num="+dto.getBo_num();
	}
	
	// 에누리 -> 장바구니 
	@RequestMapping("enuritoShop.five")
	public void enuritoShop(ShoppingBasket_DTO dto){
		
		ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
		dao.enuritoshop(dto);
		System.out.println("에누리 수량 : " + dto.getEnu_quan() + "에누리가격 : " + dto.getEnu_price());
		
		//return "redirect:salesdetail.five?bo_num="+dto.getBo_num();
	}
	
	// 장바구니 선택삭제
	@RequestMapping("deleteshop.five")
	public void deleteshop(int bo_num){
		ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
		dao.deleteshop(bo_num);
	}
	
	// 장바구니 전체삭제
	@RequestMapping("deleteall.five")
	public void deleteall(){
		ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
		dao.deleteall();
	}
	
	// 신고 팝업
	@RequestMapping("reportPopup.five")
	public String reportPopup(Model model, Principal principal){
		model.addAttribute("user_send",principal.getName());
		return "marketplace/reportForm";
	} 

	// 신고하기
	@RequestMapping("reportInsert.five")
	public void reportInsert(Report_DTO dto){
		Report_Dao dao = sqlSession.getMapper(Report_Dao.class);
		dao.reportInsert(dto); 
		System.out.println("신고완료");
	}
	
	// 신고 리스트
	@RequestMapping("reportList.five")
	public String reportList(Model model){
		Report_Dao dao = sqlSession.getMapper(Report_Dao.class);
		ArrayList<Report_DTO> list = dao.reportList();
		model.addAttribute("list",list);
		
		return "mypage.reportList";
	}

		//주문 처리
		@RequestMapping(value="orderinsert.five", method=RequestMethod.POST)
		public String orderinsert(Model model,Order_DTO order,String list,Principal principal,HttpServletResponse res,String add_code,String addd,String addr) throws IOException{
					
					List<String> checklist = JSONArray.fromObject(list);
					ShoppingBasket_DTO shopbag = new ShoppingBasket_DTO();
					Order_Dao orderdao = sqlSession.getMapper(Order_Dao.class);
					String orid = orderdao.orid();
					System.out.println(checklist);
					for(int i=0;i<checklist.size();i+=2){
					// 주문list 생성 				
					 order.setBo_num(Integer.parseInt(checklist.get(i).split(",")[0]));	
					 order.setOr_cost(Integer.parseInt(checklist.get(i).split(",")[1]));
					 order.setOr_quan(Integer.parseInt(checklist.get(i).split(",")[2]));
					 order.setSell_userid(checklist.get(i).split(",")[3]);
					 order.setBuy_userid(principal.getName());
					 order.setOr_id(orid);
					 order.setOr_how(checklist.get(i+1));
					 //택배면 택배주소 들어가게 insert
					 if(checklist.get(i+1).equals("택배")){
						 order.setAdd_code(add_code);
						 order.setOr_addd(addd);
						 order.setOr_addr(addr);
					 }else{
						 order.setAdd_code("직거래");
						 order.setOr_addd("직거래");
						 order.setOr_addr("직거래");
					 }
					 orderdao.insert(order); 
					//주문 한 내용 장바구니 삭제 
					 shopbag.setUser_id(principal.getName());
					 shopbag.setBo_num(Integer.parseInt(checklist.get(i).split(",")[0]));
					 shopbag.setSh_quantity(Integer.parseInt(checklist.get(i).split(",")[2]));
					 orderdao.delshopbag(shopbag);
					 System.out.println("장바구니 삭제 성공");
						}
					String user_id = principal.getName();
					List<Order_DTO> orderlist = orderdao.orderlist(user_id); 
					model.addAttribute("orderlist",orderlist);
			         return "mypage.ordermanage";
					}
	
	
		@RequestMapping("sold.five")
		public String sold(SalesBoard_DTO sales){
			SalesBoard_Dao dao = sqlSession.getMapper(SalesBoard_Dao.class);
			try {
				String subject = "[매진]";
				subject +=sales.getBo_subject();
				System.out.println(subject);
				sales.setBo_subject(subject); 
				dao.soldUpdate(sales);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "mypage/manage_async";
		}
		//Header 안 읽은 message수 
		@RequestMapping("messagecount.five")
		public void message(String rec_userid,HttpServletResponse response) throws IOException{
			System.out.println(rec_userid);
			int count=0;
			Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
			count = dao.msgNum(rec_userid);
			 JSONArray tocount = JSONArray.fromObject(count);
	         response.getWriter().print(tocount);
		} 
		//장바구니에 담긴 상품 수
		@RequestMapping("shopbagcount.five")
		public void shopbagcount(String user_id, HttpServletResponse response) throws IOException{
			ShoppingBasket_Dao dao = sqlSession.getMapper(ShoppingBasket_Dao.class);
			int count = dao.shopbagcount(user_id);
			 JSONArray tocount = JSONArray.fromObject(count);
	         response.getWriter().print(tocount);
		}
		
		// 회원체크
		@RequestMapping(value="isMember.five")
		String check_user_id(String user_id,Model model){
			Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
			try {
				String checked = dao.check_user_id(user_id);
				if(checked!=null){
					model.addAttribute("user_id", "등록된 회원입니다.");
					return "login/id_search";
				}else{
					model.addAttribute("user_id", "메세지를 보낼 수 없습니다. 등록된 회원이 아닙니다.");
					return "login/id_search";
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		
		// 새로운 메시지 발송창 팝업 
		@RequestMapping("newMessage.five")
		public String newMessage(Model model, Principal principal) {
			model.addAttribute("send_userid", principal.getName());
			return "marketplace/messageWriteForm";
		}
		
}
