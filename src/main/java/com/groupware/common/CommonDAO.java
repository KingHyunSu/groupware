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
	
	public MemberDTO userInfo(String id) {
		
		return sqlSession.selectOne(namespace + ".userInfo",id);
	}
	
	public int signProcessCount(String id) {
		return sqlSession.selectOne(namespace + ".signProcessCount",id);
	}
	
	public int signStayCount(String id) {
		
		return sqlSession.selectOne(namespace + ".signStayCount",id);
	}
	
	public int signFinishCount(String id) {
		
		return sqlSession.selectOne(namespace + ".signFinishCount",id);
	}
	
	public int checkUser(String id) {
		
		return sqlSession.selectOne(namespace + ".checkUser", id);
	}
	
	public int checkUser2(String id) {
		
		return sqlSession.selectOne(namespace + ".checkUser2", id);
	}
}
