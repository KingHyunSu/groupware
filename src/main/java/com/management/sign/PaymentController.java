package com.management.sign;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {

	
	@RequestMapping(value = "/form_validation")
	public String PaymentForm() throws Exception {
		
		return "form_validation";
	}
	@RequestMapping(value = "/PaymentForm")
	public String PaymentForm2() throws Exception {
		return "/PaymentForm";
	}
}
