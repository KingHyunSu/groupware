package com.groupware.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.groupware.member.MemberDAO;

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
