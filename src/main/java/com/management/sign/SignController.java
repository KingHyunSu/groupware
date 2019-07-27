package com.management.sign;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignController {

	@Inject
	private SignService service;
	
	@RequestMapping(value = "/form_validation")
	public String PaymentForm() throws Exception {
		
		return "/main/form_validation";
	}
	
	//기안 페이지
	@RequestMapping(value = "/sign")
	public String PaymentForm2() throws Exception {
		return "/main/sign";
	}
	
	//기안 페이지 팝업
	@RequestMapping(value = "/signPopup")
	public String sginPopup() throws Exception {
		return "/main/signPopup";
	}
	
	//기안 페이지 팝업 - 해당 부서 직원 목록
	@RequestMapping(value = "/selectDeptShowMember")
	public String selectDeptShowMember(String dept, Model model) throws Exception {

		model.addAttribute("list",service.selectDeptShowMember(dept));

		return "/main/signPopupSuv";
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
	
	@ResponseBody
	@RequestMapping(value = "/signTest", method=RequestMethod.POST)
	public Map<String, Object> signTest(@RequestBody SignDTO dto) {
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println("부서 :"+dto.getDept());
		System.out.println("이름 :"+dto.getName());
		List<String> list = dto.getTestname();
		
		for(int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i));
		}
		
		return map;
	}
	
	
}
