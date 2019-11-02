package com.groupware.main;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupware.common.CommonService;
import com.groupware.notice.NoticeService;
import com.groupware.schedule.ScheduleService;

@Controller
public class MainController {

	@Inject
	private NoticeService notice;
	@Inject
	private CommonService common;
	@Inject
	private ScheduleService shedule;
	
	@RequestMapping(value = "/main")
	public String main(Model model) throws Exception{
		
		model.addAttribute("noticeList", notice.noticeList());
		
		
		if(common.checkUser() == 0) {
			model.addAttribute("signStayCount", 0);
		} else {
			model.addAttribute("signStayCount", common.signStayCount());
		}
		
		if(common.checkUser2() == 0) {
			model.addAttribute("signProcessCount", 0);
			model.addAttribute("signFinishCount", 0);
		} else {
			model.addAttribute("signProcessCount", common.signProcessCount());
			model.addAttribute("signFinishCount", common.signFinishCount());
		}
		
		model.addAttribute("showSchedule" , shedule.showSchedule());
		
		return "/main/main";
	}

}
