package com.groupware.manage;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.MemberDTO;
import com.groupware.dto.RankDTO;

@Repository
public class ManageDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.groupware.manage.ManageDAO";
	
	public int joinOK(MemberDTO dto) throws Exception {
		return sqlSession.update(namespace + ".joinOK", dto);
	}
	
	public int joinNO(MemberDTO dto) throws Exception {
		return sqlSession.update(namespace + ".joinNO", dto);
	}
	
	public List<MemberDTO> memberInfo() {
		
		return sqlSession.selectList(namespace + ".memberInfo");
	}
	
	public List<DeptDTO> deptList(){
		
		return sqlSession.selectList(namespace + ".deptList");
	}
	
	public List<RankDTO> rankList(){
		
		return sqlSession.selectList(namespace + ".rankList");
	}
	
	public void memberUpdate(MemberDTO dto) {
		
		sqlSession.update(namespace + ".memberUpdate", dto);
	}
}
