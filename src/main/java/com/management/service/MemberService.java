package com.management.service;

import com.management.dto.MemberDTO;

public interface MemberService {

	public void joinAction(MemberDTO dto) throws Exception; 
	public int idCheck(String id) throws Exception;
}
