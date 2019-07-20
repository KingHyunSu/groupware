package com.management.service;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.management.dto.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Inject
	private UserDetailsService service;
	@Inject
	private BCryptPasswordEncoder passEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = (String)authentication.getPrincipal();
		String pass = (String)authentication.getCredentials();
		String pw = passEncoder.encode(pass);
		//String pw = (String)authentication.getCredentials();
		System.out.println(pw);
		
		CustomUserDetails user = (CustomUserDetails)service.loadUserByUsername(id);
		
		if(!matchPassword(pw, user.getPassword())) {
            throw new BadCredentialsException(id);
        }


		return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
	}


	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	private boolean matchPassword(String pw, String password) {
		return pw.equals(password);
	}
}
