package com.management.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping(value = "/main")
	public String main() throws Exception{
		return "/main/main";
	}
}
