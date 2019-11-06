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
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("name",session.getAttribute("name"));
		map.put("rank_name",session.getAttribute("rank_name"));
		map.put("dept_name",session.getAttribute("dept_name"));
		
		if(service.checkUser(map) == 0) {
			map.put("signStayCount", 0);
		} else {
			map.put("signStayCount", service.signStayCount(map));
		}
		
		if(service.checkUser2(map) == 0) {
		map.put("signProcessCount", 0);
		map.put("signFinishCount", 0);
		} else {
		map.put("signProcessCount", service.signProcessCount(map));
		map.put("signFinishCount", service.signFinishCount(map));
		}
		
		return map;
	}
}
