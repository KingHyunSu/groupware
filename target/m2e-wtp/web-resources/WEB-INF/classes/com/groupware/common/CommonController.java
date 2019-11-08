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
		
		if(service.checkUser(id) == 0) {
			map.put("signStayCount", 0);
		} else {
			map.put("signStayCount", service.signStayCount(id));
		}
		
		if(service.checkUser2(id) == 0) {
		map.put("signProcessCount", 0);
		map.put("signFinishCount", 0);
		} else {
		map.put("signProcessCount", service.signProcessCount(id));
		map.put("signFinishCount", service.signFinishCount(id));
		}
		
		return map;
	}
}
