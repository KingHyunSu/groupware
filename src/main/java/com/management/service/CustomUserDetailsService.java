package com.management.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.management.dao.MemberDAO;
import com.management.dto.CustomUserDetails;

public class CustomUserDetailsService implements UserDetailsService{

	@Inject
	private MemberDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		CustomUserDetails user = dao.login(id);
		
		if(user == null) {
			throw new UsernameNotFoundException(id);
		}
		return user;
	}
}
