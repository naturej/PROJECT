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
}
 