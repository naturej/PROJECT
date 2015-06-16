package kr.co.ohdeokrionline.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.ohdeokrionline.model.dao.Member_Dao;
import kr.co.ohdeokrionline.model.dao.Message_Dao;
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
		return "login/login";
	}
	
	@RequestMapping(value="login.five",method=RequestMethod.POST)
	public String loginProcess(String user_id,String password) {
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		try {
			Member_DTO member = dao.login(user_id);
			if(member.getPassword().equals(password)){
				return "redirect:index.jsp";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "login/login";
	}
	
	// 회원가입
	@RequestMapping(value="join.five",method=RequestMethod.GET)
	public String joinForm() {
		return "join/join";
	}
	
	@RequestMapping(value="join.five",method=RequestMethod.POST)
	public String joinInsert(Member_DTO member,HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
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
		
		dao.joinInsert(member);
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping("test.message")
	public void insert() {
		Message_Dao dao = sqlSession.getMapper(Message_Dao.class);
	}
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder",method={RequestMethod.GET,RequestMethod.POST})
	String passwordEncoder(@RequestParam(value="targetStr",required=false,defaultValue="")String targetStr, Model model){
		if(StringUtils.hasText(targetStr)){
			// 암호화 작업
			String bCryptString = passwordEncoder.encode(targetStr);
			model.addAttribute("targetStr",targetStr);
			model.addAttribute("bCryptString", bCryptString);
		}
		return "";
	}
}
