package com.groupware.common;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {

	@Inject
	private CommonService service;
	
	@ResponseBody
	@RequestMapping(value = "/sidebar") 
	public Map<String, Object> sidebar(HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = (String)session.getAttribute("id");
		
		int signStayCount = service.signStayCount(id);
		int signProcessCount = service.signProcessCount(id);
		int signFinishCount = service.signFinishCount(id);


		map.put("signStayCount", signStayCount);
		map.put("signProcessCount", signProcessCount);
		map.put("signFinishCount", signFinishCount);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/userInfo")
	public Map<String, Object> userInfo(HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		String id = (String)session.getAttribute("id");
		
		map.put("userInfo",service.UserInfo(id));
		
		return map;
	}
}
