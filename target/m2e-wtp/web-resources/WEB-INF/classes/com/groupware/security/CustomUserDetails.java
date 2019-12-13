package com.groupware.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.groupware.dto.DeptDTO;
import com.groupware.dto.RankDTO;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails{

	private String id;
	private String pw;
	private String name;
	private String authority;
	private boolean enabled;
	private List<DeptDTO> deptDto;
	private List<RankDTO> rankDto;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
			auth.add(new SimpleGrantedAuthority(authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return pw;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<DeptDTO> getDeptDto() {
		return deptDto;
	}

	public void setDeptDto(List<DeptDTO> deptDto) {
		this.deptDto = deptDto;
	}

	public List<RankDTO> getRankDto() {
		return rankDto;
	}

	public void setRankDto(List<RankDTO> rankDto) {
		this.rankDto = rankDto;
	}

	
	
	
	
}
