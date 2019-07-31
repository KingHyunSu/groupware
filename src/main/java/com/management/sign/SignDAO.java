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
	
	public SignDTO userInfo(SignDTO dto) {
		return sqlSession.selectOne(namespace + ".userInfo", dto);
	}
	
	public void insertSign(SignDTO dto) {
		sqlSession.insert(namespace + ".insertSign", dto);
	}
	
	public SignDTO selectNum(SignDTO dto) {
		return sqlSession.selectOne(namespace + ".selectNum", dto);
	}
	
	public void insertSignPath(SignDTO dto) {
		sqlSession.insert(namespace + ".insertSignPath", dto);
	}
	
	public List<SignDTO> signProcessList(SignDTO dto) {
		return sqlSession.selectList(namespace + ".signProcessList", dto);
	}
	
	public List<SignDTO> signStayList(SignDTO dto) {
		return sqlSession.selectList(namespace + ".signStayList", dto);
	}
	
	public List<SignDTO> signFinishList(SignDTO dto) {
		return sqlSession.selectList(namespace + ".signFinishList", dto);
	}
	
	public SignDTO signDocView(SignDTO dto){
		return sqlSession.selectOne(namespace + ".selectSignDoc", dto);
	}
	
	public List<SignDTO> signDocPath(SignDTO dto) {
		return sqlSession.selectList(namespace + ".selectSignPath", dto);
	}
	
	public void signOK(SignDTO dto) {
		sqlSession.update(namespace + ".signOK", dto);
	}
	
	public int signCount(SignDTO dto) {
		return sqlSession.selectOne(namespace + ".signCount", dto);
	}
	
	public void signFinish(SignDTO dto) {
		sqlSession.update(namespace + ".signFinish", dto);
	}
}

