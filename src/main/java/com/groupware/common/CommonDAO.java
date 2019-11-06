package com.groupware.common;

import java.util.HashMap;
import java.util.Map;

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
	
	public int signProcessCount(Map<String,Object> map) {
		return sqlSession.selectOne(namespace + ".signProcessCount",map);
	}
	
	public int signStayCount(Map<String,Object> map) {
		
		return sqlSession.selectOne(namespace + ".signStayCount",map);
	}
	
	public int signFinishCount(Map<String,Object> map) {
		
		return sqlSession.selectOne(namespace + ".signFinishCount",map);
	}
	
	public int checkUser(Map<String,Object> map) {
		
		return sqlSession.selectOne(namespace + ".checkUser", map);
	}
	
	public int checkUser2(Map<String,Object> map) {
		
		return sqlSession.selectOne(namespace + ".checkUser2", map);
	}
}
