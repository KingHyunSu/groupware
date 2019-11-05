package com.groupware.common;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.groupware.dto.MemberDTO;

@Service
public class CommonService {

	@Inject
	private CommonDAO dao;
	
	
	public int signProcessCount() {
		MemberDTO dto = new MemberDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		return dao.signProcessCount(dto);
	}
	
	public int signStayCount(String id) {
		MemberDTO dto = new MemberDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
		dto.setId(id);
		
//		MemberDTO user = dao.userInfo(dto);
//		필요없음
//		dto.setSignName(user.getName());
//		dto.setSignDept(user.getDeptname());
//		dto.setSignRank(user.getRankname());
		
		return dao.signStayCount(dto);
	}
	
	public int signFinishCount() {
		
		MemberDTO dto = new MemberDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);

//		Object principal = SecurityContextHolder.getContext().getAuthentication().getDetails();
//		UserDetails user = (UserDetails)principal;
//		
//		String a = user.get
		
		return dao.signFinishCount(dto);
	}
	
	public int checkUser() {
		
		CommonDTO dto = new CommonDTO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		dto.setId(id);
		
		MemberDTO user = dao.userInfo(dto);
		
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
