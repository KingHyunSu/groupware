package com.management.common;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.management.common.CommonDAO";
	
	public CommonDTO userInfo(CommonDTO dto) {
		
		return sqlSession.selectOne(namespace + ".userInfo",dto);
	}
	
	public int signProcessCount(CommonDTO dto) {
		return sqlSession.selectOne(namespace + ".signProcessCount",dto);
	}
	
	public int signStayCount(CommonDTO dto) {
		
		return sqlSession.selectOne(namespace + ".signStayCount",dto);
	}
	
	public int signFinishCount(CommonDTO dto) {
		
		return sqlSession.selectOne(namespace + ".signFinishCount",dto);
	}
	
	public int checkUser(CommonDTO dto) {
		
		return sqlSession.selectOne(namespace + ".checkUser", dto);
	}
	
	public int checkUser2(CommonDTO dto) {
		
		return sqlSession.selectOne(namespace + ".checkUser2", dto);
	}
}
