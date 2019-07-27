package com.management.schedule;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService {

	@Inject
	private ScheduleDAO dao;
	
	public List<ScheduleDTO> showSchedule(String id) throws Exception {
		return dao.showSchedule(id);
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception{
		dao.addSchedule(dto);
	}
}
