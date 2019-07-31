package com.management.common;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {

	@Inject
	private CommonService service;
	
	@ResponseBody
	@RequestMapping(value = "/sidebar") 
	public Map<String, Object> sidebar() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(service.checkUser() == 0) {
			map.put("signStayCount", 0);
		} else {
		map.put("signStayCount", service.signStayCount());
		}
		
		if(service.checkUser2() == 0) {
		map.put("signProcessCount", 0);
		map.put("signFinishCount", 0);
		} else {
		map.put("signProcessCount", service.signProcessCount());
		map.put("signFinishCount", service.signFinishCount());
		}
		
		return map;
	}
}
