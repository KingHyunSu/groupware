package com.groupware.common;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupware.dto.MemberDTO;

@Service
public class CommonService {

	@Inject
	private CommonDAO dao;
	
	
	public int signProcessCount(String id) {
//		MemberDTO dto = new MemberDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
//		dto.setId(id);
		
		return dao.signProcessCount(id);
	}
	
	public int signStayCount(String id) {
		MemberDTO dto = new MemberDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
		//dto.setId(id);
		
//		MemberDTO user = dao.userInfo(dto);
//		필요없음
//		dto.setSignName(user.getName());
//		dto.setSignDept(user.getDeptname());
//		dto.setSignRank(user.getRankname());
		
		return dao.signStayCount(id);
	}
	
	public int signFinishCount(String id) {
		
//		MemberDTO dto = new MemberDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
//		dto.setId(id);

//		Object principal = SecurityContextHolder.getContext().getAuthentication().getDetails();
//		UserDetails user = (UserDetails)principal;
//		
//		String a = user.get
		
		return dao.signFinishCount(id);
	}
	
	public int checkUser(String id) {
		
//		CommonDTO dto = new CommonDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
//		dto.setId(id);
//		
//		MemberDTO user = dao.userInfo(dto);
		
		return dao.checkUser(id);
	}
	
	public int checkUser2(String id) {
		
//		CommonDTO dto = new CommonDTO();
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String id = auth.getName();
//		dto.setId(id);
		
		return dao.checkUser2(id);
	}

}
