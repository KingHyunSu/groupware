package com.groupware.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private int num;
	private String id;
	private String pw;
	private String name;
	private String photo;
	private String authority;
	private boolean enabled;
	private int dept_no;
	private int rank_no;
	private String email;
	private String phone;
	
	private List<DeptDTO> deptDto;
	private List<RankDTO> rankDto;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getRank_no() {
		return rank_no;
	}
	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
