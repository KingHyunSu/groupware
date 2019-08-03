package com.management.sign;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignController {

	@Inject
	private SignService service;

	
	//기안 페이지
	@RequestMapping(value = "/sign")
	public String sign(Model model) throws Exception {
		
		
		model.addAttribute("user",service.userInfo());
		
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
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("list",service.selectSignUser(dto));
		
		return map;
	}
	
	@RequestMapping(value = "/insertSign", method=RequestMethod.POST)
	public String insertSign(SignDTO dto) throws Exception {
		System.out.println(dto.getSignName());
		service.insertSign(dto);

		return "redirect:/signProcess";
	}
	
	@RequestMapping(value = "/signProcess")
	public String signProcess(Model model) {
		
		model.addAttribute("list", service.signProcessList());

		return "/main/signProcess";
	}
	
	@RequestMapping(value = "/signStay")
	public String signStay(Model model) {
		
		model.addAttribute("signStayList", service.signStayList());
		
		return "/main/signStay";
	}
	
	@RequestMapping(value = "/signProcessDoc")
	public String signProcessDocView(@RequestParam String num, Model model) throws Exception{
		
		SignDTO dto = new SignDTO();
		dto.setNum(Integer.parseInt(num));
		
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		
		return "/main/signProcessDoc";
	}
	
	@RequestMapping(value = "/signStayDoc")
	public String signStayDocView(@RequestParam String num, Model model) throws Exception{
		
		SignDTO dto = new SignDTO();
		dto.setNum(Integer.parseInt(num));
		
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		model.addAttribute("userInfo", service.userInfo());
		
		return "/main/signStayDoc";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signOK", method = RequestMethod.POST)
	public Map<String,Object> signOK(@RequestBody String pageNum)throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();

		service.signOK(pageNum);
		
		
		return map;
	}
	
	@RequestMapping(value = "/signFinish")
	public String signFinish(Model model) throws Exception {
		
		model.addAttribute("list",service.signFinishList());
		
		return "/main/signFinish";
	}
	
	@RequestMapping(value = "/signFinishDoc")
	public String signFinishDocView(@RequestParam String num, Model model) throws Exception{
		
		SignDTO dto = new SignDTO();
		dto.setNum(Integer.parseInt(num));
		
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		model.addAttribute("userInfo", service.userInfo());
		
		return "/main/signFinishDoc";
	}
}
