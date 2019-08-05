package com.management.main;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.management.common.CommonService;
import com.management.notice.NoticeService;
import com.management.schedule.ScheduleService;

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
			model.addAttribute("signProcessCount", 0);
			model.addAttribute("signFinishCount", 0);
		} else {
		model.addAttribute("signStayCount", common.signStayCount());
		model.addAttribute("signProcessCount", common.signProcessCount());
		model.addAttribute("signFinishCount", common.signFinishCount());
		}
		model.addAttribute("showSchedule" , shedule.showSchedule());
		
		return "/main/main";
	}

}
