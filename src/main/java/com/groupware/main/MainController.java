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
		
		map.put("name",session.getAttribute("name"));
		map.put("rank_name",session.getAttribute("rank_name"));
		map.put("dept_name",session.getAttribute("dept_name"));
		
		model.addAttribute("noticeList", notice.noticeList());
		
		
		if(common.checkUser(map) == 0) {
			model.addAttribute("signStayCount", 0);
		} else {
			model.addAttribute("signStayCount", common.signStayCount(map));
		}
		
		if(common.checkUser2(map) == 0) {
			model.addAttribute("signProcessCount", 0);
			model.addAttribute("signFinishCount", 0);
		} else {
			model.addAttribute("signProcessCount", common.signProcessCount(map));
			model.addAttribute("signFinishCount", common.signFinishCount(map));
		}
		
		model.addAttribute("showSchedule" , shedule.showSchedule());
		
		return "/main/main";
	}

}
