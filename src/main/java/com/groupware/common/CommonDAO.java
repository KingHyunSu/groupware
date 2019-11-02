package com.groupware.common;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupware.dto.MemberDTO;

@Repository
public class CommonDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.management.common.CommonDAO";
	
	public MemberDTO userInfo(MemberDTO dto) {
		
		return sqlSession.selectOne(namespace + ".userInfo",dto);
	}
	
	public int signProcessCount(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".signProcessCount",dto);
	}
	
	public int signStayCount(MemberDTO dto) {
		
		return sqlSession.selectOne(namespace + ".signStayCount",dto);
	}
	
	public int signFinishCount(MemberDTO dto) {
		
		return sqlSession.selectOne(namespace + ".signFinishCount",dto);
	}
	
	public int checkUser(MemberDTO dto) {
		
		return sqlSession.selectOne(namespace + ".checkUser", dto);
	}
	
	public int checkUser2(MemberDTO dto) {
		
		return sqlSession.selectOne(namespace + ".checkUser2", dto);
	}
}
