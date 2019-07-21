package com.management.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.management.dao.MemberDAO;
import com.management.dto.MemberDTO;

@Service
public class MemberServiceImp implements MemberService {

	@Inject
	private MemberDAO dao;
	@Inject
	private BCryptPasswordEncoder passEncoder;
	
	@Override
	public void joinAction(MemberDTO dto, String formDept, String formRank) throws Exception {
		String pass = passEncoder.encode(dto.getPw());
		dto.setPw(pass);
		dto.setDept(Integer.parseInt(formDept));
		dto.setRank(Integer.parseInt(formRank));
				
		dao.joinAction(dto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}

	@Override
	public String selectDeptName(String deptNum) throws Exception {
		int deptno = Integer.parseInt(deptNum);
		return dao.selectDeptName(deptno);
	}

	@Override
	public String selectRankName(String rankNum) throws Exception {
		int rankno = Integer.parseInt(rankNum);
		return dao.selectRankName(rankno);
	}
	
}
