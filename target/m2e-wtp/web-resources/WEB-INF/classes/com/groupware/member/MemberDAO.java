package com.groupware.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;
import com.groupware.security.CustomUserDetails;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.groupware.member.MemberDAO";
	
	public void joinAction(MemberDTO dto) throws Exception {
		sqlSession.insert(namespace + ".join", dto);
	}

	public int idCheck(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".idCheck", id);
	}

	public CustomUserDetails login(String id) {
		System.out.println("----------------------------------" + id);
		return sqlSession.selectOne(namespace + ".login", id);
	}

	public String selectDeptName(int deptno) throws Exception {
		return sqlSession.selectOne(namespace + ".deptname", deptno);
	}

	public String selectRankName(int rankno) throws Exception {
		return sqlSession.selectOne(namespace + ".rankname", rankno);
	}

	public List<MemberDTO> showUser() throws Exception {
		return sqlSession.selectList(namespace + ".showUser");
	}
	
	public List<MemberDTO> selectDept(MemberDTO dto) throws Exception {
		return sqlSession.selectList(namespace + ".selectDept", dto);
	}
	
	public MemberDTO selectName(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".selectName", dto);
	}
	
	public MemberDTO memberUpdateInfo(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".memberUpdateInfo", dto);
	}
	
	public void memberUpdate(MemberDTO dto) {
		sqlSession.update(namespace + ".memberUpdate", dto);
	}
}
