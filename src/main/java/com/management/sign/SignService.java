package com.management.sign;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

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

		return dao.selectSignUser(dto);
	}
	
	public SignDTO userInfo() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		return dao.userInfo(id);
	}
}
