package com.groupware.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccesHandler implements AuthenticationSuccessHandler{

	private String userId;
	private String defaultUrl;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();

		String id = cud.getUsername();
		String name = cud.getName();
		String dept_name = cud.getDeptDto().get(0).getDept_name();
		String rank_name = cud.getRankDto().get(0).getRank_name();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("dept_name",dept_name);
		session.setAttribute("rank_name", rank_name);
		
		response.sendRedirect("main");
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}
	
	

}
