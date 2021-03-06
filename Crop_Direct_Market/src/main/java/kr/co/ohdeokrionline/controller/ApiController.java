package kr.co.ohdeokrionline.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ohdeokrionline.model.dao.Account_Dao;
import kr.co.ohdeokrionline.model.dao.FarmRecord_Dao;
import kr.co.ohdeokrionline.model.dao.Member_Dao;
import kr.co.ohdeokrionline.model.dao.SalesBoard_Dao;
import kr.co.ohdeokrionline.model.vo.Product_DTO;
import kr.co.ohdeokrionline.model.vo.Separate_DTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
//@RequestMapping("/api/")
public class ApiController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//빠른 가격조회
	@RequestMapping(value="searchPriceApi.five", method=RequestMethod.GET)
	public String serachPriceGet(){
		return "api.searchPriceApi";
	}
	
	@RequestMapping(value="searchPriceApi.five", method=RequestMethod.POST)
	public String serachPricePost(HttpServletRequest request, Model model) throws IOException{
	 	
		String work=request.getParameter("work");
		String type = request.getParameter("type");
		//System.out.println(work);
		//System.out.println(type);
		String URL ="http://openapi.okdab.com/price/fast/pricexml_search_fast.jsp?key=f4d62c3d49e62769df33d83aad60e8e49e78e3";
		URL += "&work="+work+"&type="+type;
		//System.out.println(URL);
		 
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
		
		return "api/searchPriceApiJson";
	}
	
	
	//중기일기예보
	@RequestMapping(value="MiddleForecastApi.five", method=RequestMethod.GET)
	public String MiddleForecastGet(){
		return "api.MiddleForecastApi";
	}
	
	@RequestMapping(value="MiddleForecastApi.five", method=RequestMethod.POST)
	public String MiddleForecastPost(HttpServletRequest request, Model model) throws IOException{
		
		
		String stnId=request.getParameter("stnId");
		String tmFc = request.getParameter("tmFc");
	
		String URL ="http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleForecast?ServiceKey=Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D";
		URL += "&stnId="+stnId+"&tmFc="+tmFc;
		System.out.println(URL);
		
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
	
		
		return "api/MiddleForecastApiJson";
	}
	
	
	//중기육삭예보(맑음 흐림 ...)
	@RequestMapping(value="MiddleLandWeatherApi.five",method=RequestMethod.GET)
	public String MiddleLandWeatherGet(){
		return "api.MiddleLandWeatherApi";
	}
	
	@RequestMapping(value="MiddleLandWeatherApi.five",method=RequestMethod.POST)
	public String MiddleLandWeatherPost(HttpServletRequest request, Model model) throws IOException{
		
		String regId=request.getParameter("regId");
		String tmFc = request.getParameter("tmFc");
		//http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather?ServiceKey=Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D&regId=11B00000&tmFc=201506180600
		String URL ="http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather?ServiceKey=Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D";
		URL += "&regId="+regId+"&tmFc="+tmFc;
	
		
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
		
		return "api/MiddleLandWeatherApiJson";
	}
	
	//중기기온조회
	@RequestMapping(value="MiddleTemperatureApi.five", method=RequestMethod.GET)
	public String MiddleTemperatureGet(){
		return "api.MiddleTemperatureApi";
	}
	
	@RequestMapping(value="MiddleTemperatureApi.five", method=RequestMethod.POST)
	public String MiddleTemperaturePost(HttpServletRequest request, Model model) throws IOException{

		String regId=request.getParameter("regId");
		String tmFc = request.getParameter("tmFc");
		
		String URL ="http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleTemperature?ServiceKey=Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D";
		URL += "&regId="+regId+"&tmFc="+tmFc;		
		
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
		
		return "api/MiddleTemperatureApiJson";
	}
	
	//동네실황조회
	@RequestMapping(value="RealTime_Forecast_Api.five", method=RequestMethod.GET)
	public String RealTime_Forecast_Get(){
		return "api.RealTime_Forecast_Api";
	}
	
	@RequestMapping(value="RealTime_Forecast_Api.five", method=RequestMethod.POST)
	public String RealTime_Forecast_Post(HttpServletRequest request, Model model) throws IOException{
		
		String base_date=request.getParameter("base_date");
		String base_time = request.getParameter("base_time");
		String nx = request.getParameter("nx");
		String ny = request.getParameter("ny");
		//키값 ->  Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D
		String URL ="http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService/ForecastGrib?ServiceKey=Nbu2yzWsKZr7OFAPm4tFcA%2FWXQZpK3WmlXnDTiT7Bo4Alm8SaaENkPo0fvrg2AVNIj4Z5woLK84bmemjo1%2BNrA%3D%3D";
		URL += "&base_date="+base_date+"&base_time="+base_time+"&nx="+nx+"&ny="+ny;
	
		
		
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
		
		return "api/RealTime_Forecast_Api_Json";
	}
	
	
	//가격경매시장코드 추출
	@RequestMapping(value="auction_farmApi.five", method=RequestMethod.GET)
	public String auction_farmApi_Get(){
		return "api.auction_farmApi";
	}
	
	@RequestMapping(value="auction_farmApi.five", method=RequestMethod.POST)
	public String auction_farmApi_Post(HttpServletRequest request, Model model) throws IOException{
		
		String date = request.getParameter("date");
		String lcode = request.getParameter("lcode");
		if(lcode != null){
			 lcode =request.getParameter("lcode");		  
		}else{
			lcode ="";		
		}
		String mcode = request.getParameter("mcode");
		if(mcode != null){
			mcode =request.getParameter("mcode");		  
		}else{
			mcode ="";		
		}
		String scode = request.getParameter("scode");
		if(scode != null){
			scode =request.getParameter("scode");		  
		}else{
			scode ="";		
		}

		String URL ="http://openapi.okdab.com/price/realtime/pricexml_class_action.jsp?key=f4d62c3d49e62769df33d83aad60e8e49e78e3";
		URL += "&date="+date+"&lcode="+lcode+"&mcode="+mcode+"&scode="+scode;
		System.out.println(URL);  
		
		
		StringBuffer sb = new StringBuffer(); 
		URL naverUrl = new URL(URL);
		
		BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
		String inputLine;
		
		while ((inputLine = in.readLine()) != null)
		    sb.append( inputLine.trim());
		
		in.close();
		
		JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
		model.addAttribute("jsonxml",jsonxml);
		
		return "api/auction_farmApi_Json";
	}
	
	//추출된 가격경매시장코드 따른 경매 표시
		@RequestMapping(value="auction_farmApi2.five", method=RequestMethod.GET)
		public String auction_farmApi2_Get(){
			return "api.auction_farmApi";
		}
		
		@RequestMapping(value="auction_farmApi2.five", method=RequestMethod.POST)
		public String auction_farmApi2_Post(HttpServletRequest request, Model model) throws IOException{
			
			
			String date = request.getParameter("date");
			String lcode = request.getParameter("lcode");
			if(lcode != null){
				 lcode =request.getParameter("lcode");		  
			}else{
				lcode ="";		
			}
			String mcode = request.getParameter("mcode");
			if(mcode != null){
				mcode =request.getParameter("mcode");		  
			}else{
				mcode ="";		
			}
			String scode = request.getParameter("scode");
			if(scode != null){
				scode =request.getParameter("scode");		  
			}else{
				scode ="";		
			}String ccode = request.getParameter("ccode");
			if(ccode != null){
				ccode =request.getParameter("ccode");		  
			}else{
				ccode ="";		
			}
			   
			
			String URL ="http://openapi.okdab.com/price/realtime/pricexml_search_action.jsp?key=f4d62c3d49e62769df33d83aad60e8e49e78e3";
			URL += "&date="+date+"&ccode="+ccode+"&lcode="+lcode+"&mcode="+mcode+"&scode="+scode;
			System.out.println(URL);  
			
			
			StringBuffer sb = new StringBuffer(); 
			URL naverUrl = new URL(URL);
			
			BufferedReader in = new BufferedReader(new InputStreamReader( naverUrl.openStream()));
			String inputLine;
			
			while ((inputLine = in.readLine()) != null)
			    sb.append( inputLine.trim());
			
			in.close();
			
			JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
			model.addAttribute("jsonxml",jsonxml);
			
			return "api/auction_farmApi_Json";
		}
		
		
		
		//오픈백과
		@RequestMapping(value="OpenDB_Api.five", method=RequestMethod.GET)
		public String OpenDB_Api_Get(){
			return "api.OpenDB_Api";
		}
		
		@RequestMapping(value="OpenDB_Api.five", method=RequestMethod.POST)
		public String OpenDB_Api_Post(HttpServletRequest request, Model model) throws IOException{
			
			
			String category = request.getParameter("category");
			String searchname =request.getParameter("searchname");
			searchname =  URLEncoder.encode(searchname, "UTF-8");
			String _snum = request.getParameter("_snum");
			String _enum = request.getParameter("_enum");
			//System.out.println(work);
			//System.out.println(type);
			String URL ="http://openapi.okdab.com/open/open/opendicxml_category_find.jsp?key=f4d62c3d49e62769df33d83aad60e8e49e78e3";
			URL += "&category="+category+"&searchname="+searchname+"&snum="+_snum+"&enum="+_enum;
			
			System.out.println(URL);  
			
			
			StringBuffer sb = new StringBuffer(); 
			URL naverUrl = new URL(URL);
			
			BufferedReader in = new BufferedReader(new InputStreamReader(naverUrl.openStream(),"UTF-8"));
			String inputLine;
			
			while ((inputLine = in.readLine()) != null)
			    sb.append( inputLine.trim());
			
			in.close();
			
			JSONObject jsonxml = (JSONObject)new XMLSerializer().read(sb.toString());
			
			model.addAttribute("jsonxml",jsonxml);
			
			return "api/OpenDB_Api_Json";
		}
		
		//견적서
		@RequestMapping(value="pre_sheet.five", method=RequestMethod.GET)
		public String pre_sheet(Model model){
			
			String kkk=SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
			System.out.println("ssssssssssssss"+kkk);
			
			/*aa		String authority = principal.toString().split(";")[6].split(": ")[1];
		
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		FarmRecord_Dao dao2 = sqlSession.getMapper(FarmRecord_Dao.class);
		Account_Dao dao3 = sqlSession.getMapper(Account_Dao.class);
		
		try {
			String user_id = principal.getName();
			model.addAttribute("user", dao.login(user_id));
			
			if(authority.equals("ROLE_SELLER")){
				model.addAttribute("farm",dao2.farmInfo(user_id));
			}
			model.addAttribute("account", dao3.getAccountByUser_id(user_id));
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
			
			String user_id=SecurityContextHolder.getContext().getAuthentication().getName();
			
			Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
			FarmRecord_Dao dao2 = sqlSession.getMapper(FarmRecord_Dao.class);
			Account_Dao dao3 = sqlSession.getMapper(Account_Dao.class);
			
			try {
				model.addAttribute("user", dao.login(user_id));
				
				if(kkk.equals("[ROLE_SELLER]")){
					model.addAttribute("farm",dao2.farmInfo(user_id));
					System.out.println("만세");
				} 
		
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "api.pre_sheet";
		}
		
		//견적서에서 품목
		 @RequestMapping("api_slist.five")  
		 public void seplist(HttpServletResponse response) throws IOException{
		
			 response.setContentType("text/html;charset=utf-8");
			 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 List<Separate_DTO> list = salboardDao.seplist();
		 JSONArray seplists = JSONArray.fromObject(list);
        response.getWriter().print(seplists);//서버로 데이터 전송
	     }
	 
		//견적서에서 품명가져오기
		 @RequestMapping("api_plist.five")  
		 public void prolist(HttpServletResponse response,String pro_sep) throws IOException{
			 System.out.println(pro_sep);
			 response.setContentType("text/html;charset=utf-8");
			 SalesBoard_Dao salboardDao= sqlSession.getMapper(SalesBoard_Dao.class);
		 ArrayList<Product_DTO> list = salboardDao.prolist(pro_sep);
		 JSONArray prolists = JSONArray.fromObject(list);
        response.getWriter().print(prolists);//서버로 데이터 전송
	     }
		
		 	
		

}
 