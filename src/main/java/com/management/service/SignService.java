package com.management.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.management.dao.SignDAO;
import com.management.dto.SignDTO;

@Service
public class SignService {

	@Inject
	private SignDAO dao;
	
	public List<SignDTO> selectDeptShowMember(String dept){
		SignDTO dto = new SignDTO();
		dto.setDept(dept);
		
		return dao.selectDeptShowMember(dto);
	}
	
	public SignDTO selectSignUser(SignDTO dto){
		
		System.out.println( dao.selectSignUser(dto));
		return dao.selectSignUser(dto);
	}
}
