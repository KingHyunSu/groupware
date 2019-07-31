package com.management.schedule;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {

	@Inject
	private ScheduleDAO dao;
	
	public List<ScheduleDTO> showSchedule() throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		return dao.showSchedule(id);
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception{
		dao.addSchedule(dto);
	}
}
