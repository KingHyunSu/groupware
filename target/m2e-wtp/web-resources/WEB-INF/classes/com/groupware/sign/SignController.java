package com.groupware.sign;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;
import com.groupware.dto.SignDTO;
import com.groupware.dto.SignPathDTO;

@Controller
public class SignController {

	@Inject
	private SignService service;

	
	//기안 페이지
	@RequestMapping(value = "/sign")
	public String sign(Model model) throws Exception {
		
		
		//model.addAttribute("user",service.userInfo());
		
		return "/main/sign";
	}
	
	//기안 페이지 팝업
	@RequestMapping(value = "/signPopup")
	public String sginPopup() throws Exception {
		return "/main/signPopup";
	}
	
	//기안 페이지 팝업 - 해당 부서 직원 목록
	@RequestMapping(value = "/selectDeptShowMember")
	public String selectDeptShowMember(DeptDTO dto, Model model) throws Exception {
		
		model.addAttribute("list",service.selectDeptShowMember(dto));

		return "/main/signPopupSuv";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/selectSignUser")
	public Map<String, Object> selectSignUser(@RequestBody MemberDTO dto, Model model) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("list",service.selectSignUser(dto));
		
		return map;
	}
	
	@RequestMapping(value = "/insertSign", method=RequestMethod.POST)
	public String insertSign(HttpSession session,
					@RequestParam("title") String title,
					@RequestParam("content") String content,
					@RequestParam("signname") String name,
					@RequestParam("sign_id")String sign_id,
					@RequestParam("rank_no") String rank_no,
					@RequestParam("dept_no") String dept_no
					) throws Exception {
		
		String id = (String)session.getAttribute("id");

		service.insertSign(id,title,content,name,sign_id,rank_no,dept_no);

		return "redirect:/signProcess";
	}
	
	@RequestMapping(value = "/signProcess")
	public String signProcess(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("list", service.signProcessList(id));

		return "/main/signProcess";
	}
	
	@RequestMapping(value = "/signProcessDoc")
	public String signProcessDocView(SignDTO dto, Model model) throws Exception{
		
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		
		return "/main/signProcessDoc";
	}
	
	@RequestMapping(value = "/signStay")
	public String signStay(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("signStayList", service.signStayList(id));
		
		return "/main/signStay";
	}
	
	
	@RequestMapping(value = "/signStayDoc")
	public String signStayDocView(@RequestParam String num, Model model, HttpSession session) throws Exception{
		
		SignDTO dto = new SignDTO();
		dto.setSign_no(Integer.parseInt(num));
		
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		model.addAttribute("id" , session.getAttribute("id"));
		//model.addAttribute("userInfo", service.userInfo());
		
		return "/main/signStayDoc";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signOK", method = RequestMethod.POST)
	public Map<String,Object> signOK(@RequestBody SignPathDTO dto)throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();

		service.signOK(dto);
		
		
		return map;
	}
	
	@RequestMapping(value = "/signFinish")
	public String signFinish(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		model.addAttribute("list",service.signFinishList(id));
		
		return "/main/signFinish";
	}
	
	@RequestMapping(value = "/signFinishDoc")
	public String signFinishDocView(SignDTO dto, Model model, HttpSession session) throws Exception{

		
		//signDoc이랑 userInfo는 묶어서, signPath는 따로 들고 오면 될듯 
		model.addAttribute("signDoc", service.signDocView(dto));
		model.addAttribute("signPath", service.signDocPath(dto));
		
		return "/main/signFinishDoc";
	}
}
