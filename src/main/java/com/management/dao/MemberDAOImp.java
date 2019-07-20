package com.management.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.management.dto.CustomUserDetails;
import com.management.dto.MemberDTO;

@Repository
public class MemberDAOImp implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.management.dao.MemberDAO";
	
	@Override
	public void joinAction(MemberDTO dto) throws Exception {
		sqlSession.insert(namespace + ".join", dto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".idCheck", id);
	}

	@Override
	public CustomUserDetails login(String id) {
		System.out.println("dao : " + id);
		return sqlSession.selectOne(namespace + ".login", id);
	}

	@Override
	public String selectDeptName(int deptno) throws Exception {
		return sqlSession.selectOne(namespace + ".deptname", deptno);
	}

	@Override
	public String selectRankName(int rankno) throws Exception {
		return sqlSession.selectOne(namespace + ".rankname", rankno);
	}

}
