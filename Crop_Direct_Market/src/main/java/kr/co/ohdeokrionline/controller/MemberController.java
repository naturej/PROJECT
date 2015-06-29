package kr.co.ohdeokrionline.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.ohdeokrionline.model.dao.Authorities_Dao;
import kr.co.ohdeokrionline.model.dao.FarmRecord_Dao;
import kr.co.ohdeokrionline.model.dao.Member_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
import kr.co.ohdeokrionline.model.vo.Authorities_DTO;
import kr.co.ohdeokrionline.model.vo.FarmRecord_DTO;
import kr.co.ohdeokrionline.model.vo.Member_DTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;

	// 로그인
	@RequestMapping(value="login.five",method=RequestMethod.GET)
	public String login() {
		//Tiles 적용 전 코드
		//return "login/login";
		//Tiles 적용
		return "login.login";
	}
	
	@RequestMapping(value="login.five",method=RequestMethod.POST)
	public String loginProcess(String user_id,String password) {
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		try {
			Member_DTO member = dao.login(user_id);
			/*if(member.getPassword().equals(password)){
				return "redirect:index.jsp";
			}*/
			if(passwordEncoder.matches(password, member.getPassword())){
				//Tiles 적용 전 코드
				//return "redirect:index.five";
				//Tiles 적용
				return "home.index";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//Tiles 적용 전 코드
		//return "login/login";
		//Tiles 적용
		return "login.login";
	}
	
	// 회원가입
	@RequestMapping(value="joinSelect.five",method=RequestMethod.GET)
	public String joinSelect() {
		//Tiles 적용 전 코드
		//return "join/joinSelect";
		//Tiles 적용
		return "join.joinSelect";
	}
	
	@RequestMapping(value="join.five",method=RequestMethod.GET)
	public String joinForm(String user,Model model) {
		model.addAttribute("user",user);
		//Tiles 적용 전 코드
		//return "join/join";
		//Tiles 적용
		return "join.join";
	}
	
	@RequestMapping(value="join.five",method=RequestMethod.POST)
	public String joinInsert(Member_DTO member,FarmRecord_DTO farm,Authorities_DTO authority,HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		System.out.println(member);
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		FarmRecord_Dao dao2 = sqlSession.getMapper(FarmRecord_Dao.class);
		Authorities_Dao dao3 = sqlSession.getMapper(Authorities_Dao.class);
		CommonsMultipartFile file = member.getFile();
		
		if(file != null){
			String fname = file.getOriginalFilename();
			//String path = request.getServletContext().getRealPath("upload");
			String path = "C:\\Users\\KOSTA\\git\\PROJECT\\Crop_Direct_Market\\src\\main\\webapp\\upload";
			System.out.println(path);
			String fullpath = path + "\\" + fname;
			if(!fname.equals("")){
				//서버에 물리적 경로 파일쓰기작업
				FileOutputStream fs = new FileOutputStream(fullpath);
				fs.write(file.getBytes());
				fs.close();
			}
			//DB insert (파일명)
			member.setPhoto(fname);
		}
		
		if(dao.joinInsert(member)==1){
			if(farm.getFarminfo()!=null){
				dao2.insertFarminfo(farm);
			}
			System.out.println(authority);
			dao3.insertAuth(authority);
		}
		
		//Tiles 적용 전 코드
		//return "redirect:index.jsp";
		//Tiles 적용
		return "home.index";
	}
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder.five",method={RequestMethod.GET,RequestMethod.POST})
	String passwordEncoder(@RequestParam(value="password",required=false,defaultValue="")String password, Model model) throws IOException{
		if(StringUtils.hasText(password)){
			// 암호화 작업
			String bCryptString = passwordEncoder.encode(password);
			System.out.println(bCryptString);
			model.addAttribute("passwordEncoder", bCryptString);
			//Tiles 적용 전 코드
			return "join/encoder";
		}
		return "";
	}
	
	@RequestMapping(value="searchForm.five",method=RequestMethod.GET)
	String search(){
		return "login.searchForm";
	}
	
	@RequestMapping(value="id_search.five",method=RequestMethod.POST)
	String id_search(String email,Model model){
		System.out.println(email);
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		try {
			String user_id = dao.getUser_idByEmail(email);
			if(user_id != null){
				model.addAttribute("user_id", user_id);
				return "login/id_search";
			}else{
				model.addAttribute("user_id", "일치하는 email이 존재하지 않습니다.");
				return "login/id_search";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping(value="pwd_search.five",method=RequestMethod.POST)
	String pwd_search(String user_id,String email){
		System.out.println(user_id+"/"+email);
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		try {
			String pwd = dao.getPwdByUser_idAndEmail(user_id, email);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="check_user_id.five",method=RequestMethod.POST)
	String check_user_id(String user_id,Model model){
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		try {
			String checked = dao.check_user_id(user_id);
			if(checked!=null){
				model.addAttribute("user_id", "중복된 ID입니다. 다른 ID를 입력하십시오.");
				return "login/id_search";
			}else{
				model.addAttribute("user_id", "사용 가능한 ID입니다.");
				return "login/id_search";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
