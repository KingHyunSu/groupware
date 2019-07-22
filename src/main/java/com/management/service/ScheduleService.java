package com.management.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.management.dao.ScheduleDAO;
import com.management.dto.ScheduleDTO;

@Service
public class ScheduleService {

	@Inject
	private ScheduleDAO dao;
	
	public List<ScheduleDTO> showSchedule() throws Exception {
		return dao.showSchedule();
	}
	
	public void addSchedule(ScheduleDTO dto) throws Exception{
		dao.addSchedule(dto);
	}
}
