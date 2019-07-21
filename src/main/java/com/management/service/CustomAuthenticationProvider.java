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
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = (String)authentication.getPrincipal();
		String pw = (String)authentication.getCredentials();

		
		CustomUserDetails user = (CustomUserDetails)service.loadUserByUsername(id);
		
		if(!matchPassword(id, user.getUsername())) {
            throw new BadCredentialsException(id);
        }


		return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
	}


	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	private boolean matchPassword(String userId, String dbId) {
		return userId.equals(dbId);
	}
}
