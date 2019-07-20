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
	public void joinAction(MemberDTO dto) throws Exception {
		String userPw = dto.getPw();
		String pass = passEncoder.encode(userPw);
		dto.setPw(pass);
		
		dao.joinAction(dto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	
}
