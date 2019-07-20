package com.management.dao;

import com.management.dto.CustomUserDetails;
import com.management.dto.MemberDTO;

public interface MemberDAO {

	public void joinAction(MemberDTO dto) throws Exception;
	public int idCheck(String id) throws Exception;
	public CustomUserDetails login(String username);
}
