package com.management.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {

	@Inject
	private ScheduleService service;
	
	
	@RequestMapping(value = "/schedulePopup")
	public String test2() throws Exception {
		return "/schedulePopup";
	}
	
	@RequestMapping(value = "/schedule")
	public String schedule(Model model)throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		model.addAttribute("showSchedule" , service.showSchedule(id));
		
		return "/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody ScheduleDTO dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();

		service.addSchedule(dto);
	
		return map;
	}

	
	@ResponseBody
	@RequestMapping(value = "/showSchedule")
	public List<ScheduleDTO> showSchedule() throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		List<ScheduleDTO> list = service.showSchedule(id);
		
		return list;
	}
}
