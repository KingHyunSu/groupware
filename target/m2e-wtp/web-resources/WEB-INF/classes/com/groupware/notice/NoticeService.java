package com.groupware.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.groupware.dto.NoticeDTO;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO dao;
	
	public List<NoticeDTO> noticeList() throws Exception {
		return dao.noticeList();
	}
	
	public void insertNotice(NoticeDTO dto) throws Exception {
		dao.insertNotice(dto);
	}
	
	public NoticeDTO noticeDoc(NoticeDTO dto) throws Exception{
		
		return dao.noticeDoc(dto);
	}
	
	public void noticeUpdate(NoticeDTO dto) {
		
		dao.noticeUpdate(dto);
	}
	
	public void noticeDelete(NoticeDTO dto) {
		
		dao.noticeDelete(dto);
	}
}
