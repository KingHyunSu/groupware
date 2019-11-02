package com.groupware.dto;

public class MemberDTO {

	private int num;
	private String id;
	private String pw;
	private String name;
	private String authority;
	private boolean enabled;
	private int dept_no;
	private int rank_no;
	private DeptDTO deptDto;
	private RankDTO rankDto;
	
	
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
	public DeptDTO getDeptDto() {
		return deptDto;
	}
	public void setDeptDto(DeptDTO deptDto) {
		this.deptDto = deptDto;
	}
	public RankDTO getRankDto() {
		return rankDto;
	}
	public void setRankDto(RankDTO rankDto) {
		this.rankDto = rankDto;
	}
	
	
}
