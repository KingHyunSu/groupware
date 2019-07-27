package com.management.security;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Inject
	private UserDetailsService service;
	@Inject
	private BCryptPasswordEncoder passDecoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String id = (String)authentication.getPrincipal();
		String pw = (String)authentication.getCredentials();
		

		//db에서 회원 정보 가져옴
		CustomUserDetails user = (CustomUserDetails)service.loadUserByUsername(id);

		
		if(passDecoder.matches(pw, user.getPassword())) {
			System.out.println("매칭 완료");
		}
		if(!passDecoder.matches(pw, user.getPassword())) {
			 throw new BadCredentialsException(pw);
		}


		return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
	}


	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
}
