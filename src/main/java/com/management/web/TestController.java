package com.management.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.dto.SignDTO;
import com.management.service.SignService;

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
	
	@RequestMapping(value = "/signPopup")
	public String sginPopup() throws Exception {
		return "/signPopup";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/selectDeptShowMember", method=RequestMethod.POST)
//	public Map<String,Object> selectDeptShowMember(@RequestBody String dept) throws Exception {
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("list", service.selectDeptShowMember(dept));
//		return map;
//	}
	
	@RequestMapping(value = "/selectDeptShowMember")
	public String selectDeptShowMember(String dept, Model model) throws Exception {

		model.addAttribute("list",service.selectDeptShowMember(dept));

		return "/test4";
	}

	
	@ResponseBody
	@RequestMapping(value = "/selectSignUser")
	public Map<String, Object> selectSignUser(@RequestBody SignDTO dto, Model model) throws Exception {
		System.out.println(dto.getName());
		System.out.println(dto.getRank());
		System.out.println(dto.getDept());
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("list",service.selectSignUser(dto));
		
		return map;
		
	}
	
}
