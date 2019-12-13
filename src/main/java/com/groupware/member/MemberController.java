package com.groupware.member;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.groupware.dto.MemberDTO;

@Controller
public class MemberController {

	@Inject
	private MemberService service;
	
	//회원가입 페이지
	@RequestMapping(value = "/join")
	public String join() throws Exception {
		
		return "/join";
	}
	
	//회원가입 버튼 클릭
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(MemberDTO dto, HttpServletRequest request,
			@RequestParam MultipartFile file) throws Exception {
		
		ServletContext application = request.getServletContext();
		String savePath = application.getRealPath("/resources/upload/");
		System.out.println(savePath);
		if(!file.isEmpty()) {
			String saveFileName = new Date().getTime() + "-" + file.getOriginalFilename();
			dto.setPhoto(saveFileName);
			file.transferTo(new File(savePath + saveFileName));
		}
		
		service.joinAction(dto);
		
		return "redirect:/login";
	}
	
	//아이디 중복 검사 Ajax
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception {
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		int result = 0;
		
		result = service.idCheck(id);
		map.put("check", result);
		
		return map;
	}
	
	//부서 선택 Ajax
	@ResponseBody
	@RequestMapping(value = "/join/selectDeptName", method = RequestMethod.POST, produces = "application/json")
	public Map<Object,Object> selectDeptName(@RequestBody String deptNum) 
				throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		String name = service.selectDeptName(deptNum);
		map.put("deptname", name);
		return map;
	}
	
	//직급 선택 Ajax
	@ResponseBody
	@RequestMapping(value = "/join/selectRankName", method = RequestMethod.POST, produces = "application/json")
	public Map<Object,Object> selectRankName(@RequestBody String rankNum) 
				throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		String name = service.selectRankName(rankNum);
		map.put("rankname", name);
		return map;
	}
	
	//로그인 페이지
	@RequestMapping(value = "/login")
	public String login() throws Exception {
		
		return "/login";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout() throws Exception {
		return "redirect:/login";
	}
	
	//개인정보수정 팝업
	@RequestMapping(value="/memberUpdatePopup")
	public String memberUpdatePopup(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		MemberDTO aa = service.memberUpdateInfo(id);
		System.out.println(aa.getPhoto());
		model.addAttribute("memberInfo", aa);
		
		return "/main/common/memberUpdatePopup";
	}
	
	//개인정보수정
	@RequestMapping(value="/memberInfoUpdate")
	public String memberInfoUpdate(MemberDTO dto, HttpSession session, HttpServletRequest request,
									@RequestParam MultipartFile file,
									@RequestParam String photoName) throws IllegalStateException, IOException {
		
		String id = (String)session.getAttribute("id");
		
		ServletContext application = request.getServletContext();
		String savePath = application.getRealPath("/resources/upload/");
		System.out.println(savePath);
		if(!file.isEmpty()) {
			String saveFileName = new Date().getTime() + "-" + file.getOriginalFilename();
			dto.setPhoto(saveFileName);
			file.transferTo(new File(savePath + saveFileName));
		}else {
			dto.setPhoto(photoName);
		}
		
		service.memberUpdate(dto,id);
		return "redirect:/memberUpdatePopup";
	}
}
