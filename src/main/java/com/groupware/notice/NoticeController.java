package com.groupware.notice;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.groupware.dto.NoticeDTO;

@Controller
public class NoticeController {

	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/notice")
	public String notice(Model model) throws Exception {
		
		model.addAttribute("list",service.noticeList());
		
		return "/main/notice";
	}
	
	@RequestMapping(value = "/noticeInsertForm")
	public String noticeWtire() throws Exception {

		return "/main/noticeWrite";
	}

	@RequestMapping(value = "/noticeInsertAction", method = RequestMethod.POST)
	public String insertNotice(NoticeDTO dto,HttpSession session) throws Exception {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		
		dto.setId((String)session.getAttribute("id"));
		service.insertNotice(dto);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value = "/noticeDoc")
	public String noticeDoc(NoticeDTO dto, Model model)throws Exception {
		
		model.addAttribute("noticeDoc", service.noticeDoc(dto));
		
		return "/main/noticeDoc";
	}
	@RequestMapping(value = "/noticeUpdateForm")
	public String noticeUpdateForm(NoticeDTO dto, Model model) throws Exception {
		
		model.addAttribute("noticeDoc", service.noticeDoc(dto));
		
		
		return "main/noticeUpdate";
	}
	
	@RequestMapping(value = "/noticeUpdateAction")
	public String noticeUpdateAction(NoticeDTO dto) {
		
		service.noticeUpdate(dto);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value = "/noticeDeleteAction")
	public String noticeDeleteAction(NoticeDTO dto) {
		
		service.noticeDelete(dto);
		
		return "redirect:/notice";
	}

}
