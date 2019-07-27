package com.management.sign;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@Inject
	private SignService service;
	
	@RequestMapping(value = "/test")  
	public String test() throws Exception {
		return "/test";
	}
	
	
	@RequestMapping(value = "/test3")
	public String test3() throws Exception {
		return "/test3";
	}

	
//	@ResponseBody
//	@RequestMapping(value = "/selectDeptShowMember", method=RequestMethod.POST)
//	public Map<String,Object> selectDeptShowMember(@RequestBody String dept) throws Exception {
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("list", service.selectDeptShowMember(dept));
//		return map;
//	}
	
	
	
	
	
}
