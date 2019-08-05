package com.management.manage;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ManageService {

	@Inject
	private ManageDAO dao;
	
	public void joinOK(String num) throws Exception {
		ManageDTO dto = new ManageDTO();
		
		dto.setNum(Integer.parseInt(num));
		
		dao.joinOK(dto);
	}
	
	public void joinNO(String num) throws Exception {
		ManageDTO dto = new ManageDTO();
		
		dto.setNum(Integer.parseInt(num));
		
		dao.joinNO(dto);
	}
}
