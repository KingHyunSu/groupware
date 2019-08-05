package com.management.common;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class CommonService {

	@Inject
	private CommonDAO dao;
	
	
	public int signProcessCount() {
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		return dao.signProcessCount(dto);
	}
	
	public int signStayCount() {
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		CommonDTO user = dao.userInfo(dto);
		dto.setSignName(user.getName());
		dto.setSignDept(user.getDeptname());
		dto.setSignRank(user.getRankname());
		
		return dao.signStayCount(dto);
	}
	
	public int signFinishCount() {
		
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);

		return dao.signFinishCount(dto);
	}
	
	public int checkUser() {
		
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		CommonDTO user = dao.userInfo(dto);
		dto.setSignName(user.getName());
		dto.setSignDept(user.getDeptname());
		dto.setSignRank(user.getRankname());
		
		return dao.checkUser(dto);
	}
	
	public int checkUser2() {
		
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		return dao.checkUser2(dto);
	}
}
