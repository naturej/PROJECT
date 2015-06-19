package kr.co.ohdeokrionline.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApiController {
	
	
	//빠른 가격조회
	@RequestMapping(value="searchPriceApi.five", method=RequestMethod.GET)
	public String serachPriceGet(){
		return "api/searchPriceApi";
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
		return "api/MiddleForecastApi";
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
		return "api/MiddleLandWeatherApi";
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
		return "api/MiddleTemperatureApi";
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
		return "api/RealTime_Forecast_Api";
	}
	
	@RequestMapping(value="RealTime_Forecast_Api.five", method=RequestMethod.POST)
	public String RealTime_Forecast_Post(HttpServletRequest request, Model model) throws IOException{
		
		String base_date=request.getParameter("base_date");
		String base_time = request.getParameter("base_time");
		String nx = request.getParameter("nx");
		String ny = request.getParameter("ny");

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
}
 