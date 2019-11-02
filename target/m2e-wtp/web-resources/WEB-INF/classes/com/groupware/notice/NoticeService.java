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
	
	public NoticeDTO noticeDoc(String num) throws Exception{
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNum(Integer.parseInt(num));
		
		return dao.noticeDoc(dto);
	}
}
