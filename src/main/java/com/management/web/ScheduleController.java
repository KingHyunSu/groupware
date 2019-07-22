package com.management.web;

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

import com.management.dto.ScheduleDTO;
import com.management.service.ScheduleService;

@Controller
public class ScheduleController {

	@Inject
	private ScheduleService service;
	
	@RequestMapping(value = "/test2")
	public String test2() throws Exception {
		return "/test2";
	}
	
	@RequestMapping(value = "/schedule")
	public String tables(Model model)throws Exception {

		model.addAttribute("showSchedule" , service.showSchedule());
		return "/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody ScheduleDTO dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		System.out.println(dto.getMemo());
		System.out.println(dto.getSubject());
		
		service.addSchedule(dto);
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/showSchedule")
	public List<ScheduleDTO> showSchedule() throws Exception {
		
		List<ScheduleDTO> list = service.showSchedule();
		
		return list;
	}
}
