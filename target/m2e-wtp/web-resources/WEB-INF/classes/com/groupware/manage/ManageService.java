package com.groupware.manage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;
import com.groupware.dto.RankDTO;

@Service
public class ManageService {

	@Inject
	private ManageDAO dao;
	
	public void joinOK(MemberDTO dto) throws Exception {
		
		dao.joinOK(dto);
	}
	
	public void joinNO(MemberDTO dto) throws Exception {
		
		dao.joinNO(dto);
	}
	
	public List<MemberDTO> memberInfo(){
		
		return dao.memberInfo();
	}
	
	public List<DeptDTO> deptList(){
		
		return dao.deptList();
	}
	
	public List<RankDTO> rankList(){
		
		return dao.rankList();
	}
	
	public void memberUpdate(MemberDTO dto) {
		
		dao.memberUpdate(dto);
	}
}
