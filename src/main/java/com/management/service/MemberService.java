package com.management.service;

import com.management.dto.MemberDTO;

public interface MemberService {

	public void joinAction(MemberDTO dto,String formDept,String formRank) throws Exception; 
	public int idCheck(String id) throws Exception;
	public String selectDeptName(String deptNum) throws Exception;
	public String selectRankName(String rankNum) throws Exception;
}
