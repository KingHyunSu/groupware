package com.groupware.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;

@Service
public class MemberService{

	@Inject
	private MemberDAO dao;
	@Inject
	private BCryptPasswordEncoder passEncoder;
	
	
	public void joinAction(MemberDTO dto) throws Exception {

		String pass = passEncoder.encode(dto.getPw());
		
		dto.setPw(pass);

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
	
	public List<MemberDTO> showUser() throws Exception {
		return dao.showUser();
	}
	
	public List<MemberDTO> selectDept(MemberDTO dto) throws Exception {

		
		return dao.selectDept(dto);
	}
	
	public MemberDTO selectName(MemberDTO dto) throws Exception {
		
		return dao.selectName(dto);
	}
	
	public MemberDTO memberUpdateInfo(String id) {
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		
		return dao.memberUpdateInfo(dto);
	}
	
	public void memberUpdate(MemberDTO dto, String id) {

		String pass = passEncoder.encode(dto.getPw());
		
		dto.setPw(pass);
		dto.setId(id);
		
		dao.memberUpdate(dto);
	}
	
}
