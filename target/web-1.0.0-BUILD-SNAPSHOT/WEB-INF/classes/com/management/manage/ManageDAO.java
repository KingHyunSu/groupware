package com.management.manage;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ManageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.management.manage.ManageDAO";
	
	public int joinOK(ManageDTO dto) throws Exception {
		return sqlSession.update(namespace + ".joinOK", dto);
	}
	
	public int joinNO(ManageDTO dto) throws Exception {
		return sqlSession.update(namespace + ".joinNO", dto);
	}
	
}
