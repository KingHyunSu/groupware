package com.groupware.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.groupware.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.groupware.notice.NoticeDAO";
	
	public List<NoticeDTO> noticeList(){
		return sqlSession.selectList(namespace + ".noticList");
	}
	
	public int insertNotice(NoticeDTO dto) {
		return sqlSession.insert(namespace + ".insertNotice", dto);
	}
	
	public NoticeDTO noticeDoc(NoticeDTO dto) {
		return sqlSession.selectOne(namespace + ".noticeDoc", dto);
	}
	
	public void noticeUpdate(NoticeDTO dto) {
		sqlSession.update(namespace + ".noticeUpdate", dto);
	}
	
	public void noticeDelete(NoticeDTO dto) {
		sqlSession.delete(namespace + ".noticeDelete", dto);
	}
}
