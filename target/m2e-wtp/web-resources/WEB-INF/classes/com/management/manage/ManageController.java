package com.management.manage;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.management.member.MemberService;

@Controller
public class ManageController {

	@Inject
	private ManageService service;
	
	@Inject
	private MemberService member;
	
	@RequestMapping(value = "/joinManage")
		public String joinManage(Model model) throws Exception{
		
		model.addAttribute("list", member.showUser());
		
		return "/main/admin/joinManage";
	}
	
	@RequestMapping(value = "/joinOK")
	public String joinOK(@RequestParam String num) throws Exception {
		
		service.joinOK(num);
		
		return "redirect:/joinManage";
	}
	
	@RequestMapping(value = "/joinNO")
	public String joinNO(@RequestParam String num) throws Exception {
		
		service.joinNO(num);
		
		return "redirect:/joinManage";
	}
	
	@RequestMapping(value = "/memberManage")
	public String memberManage() throws Exception {
		return "/main/admin/memberManage";
	}
	
	@RequestMapping(value = "/selectDept")
	public String selectDept(String dept, Model model) throws Exception {
		
		model.addAttribute("deptMemberList", member.selectDept(dept));
		
		return "/main/admin/memberManageSuv";
	}
}
