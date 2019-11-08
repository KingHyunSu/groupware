package com.groupware.main;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public String main(Model model, HttpSession session) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("noticeList", notice.noticeList());
		
		
		if(common.checkUser(id) == 0) {
			model.addAttribute("signStayCount", 0);
		} else {
			model.addAttribute("signStayCount", common.signStayCount(id));
		}
		
		if(common.checkUser2(id) == 0) {
			model.addAttribute("signProcessCount", 0);
			model.addAttribute("signFinishCount", 0);
		} else {
			model.addAttribute("signProcessCount", common.signProcessCount(id));
			model.addAttribute("signFinishCount", common.signFinishCount(id));
		}
		
		model.addAttribute("showSchedule" , shedule.showSchedule());
		
		return "/main/main";
	}

}
