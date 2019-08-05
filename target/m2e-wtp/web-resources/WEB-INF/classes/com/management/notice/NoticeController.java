package com.management.notice;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

	@Inject
	private NoticeService service;
	
	@RequestMapping(value = "/notice")
	public String notice(Model model) throws Exception {
		
		model.addAttribute("list",service.noticeList());
		
		return "/main/notice";
	}
	
	@RequestMapping(value = "/noticeWrite")
	public String noticeWtire() throws Exception {

		return "/main/noticeWrite";
	}

	@RequestMapping(value = "/noticeAdd", method = RequestMethod.POST)
	public String insertNotice(NoticeDTO dto) throws Exception {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		
		service.insertNotice(dto);
		
		return "redirect:/notice";
	}
	
	@RequestMapping(value = "/noticeDoc")
	public String noticeDoc(Model model, @RequestParam String num)throws Exception {
		
		model.addAttribute("noticeDoc", service.noticeDoc(num));
		
		return "/main/noticeDoc";
	}
}
