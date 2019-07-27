package com.management.member;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService{

	@Inject
	private MemberDAO dao;
	@Inject
	private BCryptPasswordEncoder passEncoder;
	
	
	public void joinAction(MemberDTO dto, String formDept, String formRank) throws Exception {
		
		System.out.println(dto.getPw());
		String pass = passEncoder.encode(dto.getPw());
		
		dto.setPw(pass);
		dto.setDept(Integer.parseInt(formDept));
		dto.setRank(Integer.parseInt(formRank));
				
		dao.joinAction(dto);
	}

	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}


	public String selectDeptName(String deptNum) throws Exception {
		int deptno = Integer.parseInt(deptNum);
		
		return dao.selectDeptName(deptno);
	}

	public String selectRankName(String rankNum) throws Exception {
		int rankno = Integer.parseInt(rankNum);
		return dao.selectRankName(rankno);
	}
	
	
}
