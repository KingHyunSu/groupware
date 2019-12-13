package com.groupware.manage;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupware.dto.MemberDTO;
import com.groupware.member.MemberService;

@Controller
public class ManageController {

	@Inject
	private ManageService service;
	
	@Inject
	private MemberService member;
	
	@RequestMapping(value = "/joinManage")
		public String joinManage(Model model) throws Exception{
		
		model.addAttribute("list", service.memberInfo());
		
		return "/main/admin/joinManage";
	}
	
	@RequestMapping(value = "/joinOK")
	public String joinOK(MemberDTO dto) throws Exception {
		
		service.joinOK(dto);
		
		return "redirect:/joinManage";
	}
	
	@RequestMapping(value = "/joinNO")
	public String joinNO(MemberDTO dto) throws Exception {
		
		service.joinNO(dto);
		
		return "redirect:/joinManage";
	}
	
	@RequestMapping(value = "/memberManage")
	public String memberManage() throws Exception {
		return "/main/admin/memberManage";
	}
	
	@RequestMapping(value = "/selectDept")
	public String selectDept(MemberDTO dto, Model model) throws Exception {
		System.out.println(dto.getDept_no());
		model.addAttribute("deptMemberList", member.selectDept(dto));
		
		return "/main/admin/memberManageSuv";
	}
	
	@RequestMapping(value = "/selectName")
	public String selectName(MemberDTO dto, Model model) throws Exception {
		
		model.addAttribute("memberInfo", member.selectName(dto));
		model.addAttribute("deptList", service.deptList());
		model.addAttribute("rankList", service.rankList());
		
		return "/main/admin/memberManageSuv2";
	}
	
	@RequestMapping(value = "/memberUpdate")
	public String memberUpdate(MemberDTO dto) {
		System.out.println(dto.getId());
		service.memberUpdate(dto);
		
		return "redirect:/memberManage";
	}
}
