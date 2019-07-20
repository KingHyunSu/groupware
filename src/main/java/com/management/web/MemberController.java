package com.management.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.management.dto.MemberDTO;
import com.management.service.MemberService;

@Controller
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/join")
	public String join() throws Exception {
		
		return "/join";
	}
	
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinActionn(MemberDTO dto, @RequestParam String formDept, @RequestParam String formRank) throws Exception {
		service.joinAction(dto,formDept,formRank);
		
		return "redirect:/loginPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/json")
	public Map<Object, Object> idCheck(@RequestBody String id) throws Exception {
		
		Map<Object,Object> map = new HashMap<Object,Object>();
		int result = 0;
		
		result = service.idCheck(id);
		map.put("check", result);
		
		return map;
	}
	
	@RequestMapping(value = "/loginPage")
	public String login() throws Exception {
		
		return "/loginPage";
	}
	@RequestMapping(value = "/main")
	public String main() throws Exception {
		
		return "/form_validation";
	}
	
	@RequestMapping(value = "/test")
	public String test() throws Exception {
		
		return "/test";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/selectDeptName", method = RequestMethod.POST, produces = "application/json")
	public Map<Object,Object> selectDeptName(@RequestBody String deptNum) 
				throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		String name = service.selectDeptName(deptNum);
		map.put("deptname", name);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/join/selectRankName", method = RequestMethod.POST, produces = "application/json")
	public Map<Object,Object> selectRankName(@RequestBody String rankNum) 
				throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		String name = service.selectRankName(rankNum);
		map.put("rankname", name);
		return map;
	}
}
