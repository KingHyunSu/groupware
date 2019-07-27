package com.management.sign;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.management.member.MemberDTO;

@Repository
public class SignDAO {

	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.management.sign.SignDAO";
	
	public List<SignDTO> selectDeptShowMember(SignDTO dto) {
		return sqlSession.selectList(namespace + ".selectDeptShowMember", dto);
	}
	
	public SignDTO selectSignUser(SignDTO dto) {
		return sqlSession.selectOne(namespace + ".selectSignUser", dto);  
	}
	
	public SignDTO userInfo(String id) {
		return sqlSession.selectOne(namespace + ".userInfo", id);
	}
	
}
