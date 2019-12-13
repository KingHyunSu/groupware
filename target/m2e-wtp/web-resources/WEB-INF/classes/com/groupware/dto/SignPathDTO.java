package com.groupware.dto;

import java.sql.Date;
import java.util.List;

public class SignPathDTO {

	private int sign_no;
	private String name;
	private Date date;
	private int dept_no;
	private int rank_no;
	private int state_no;
	private String id;
	
	private List<StateDTO> stateDto;
	private List<RankDTO> rankDto;
	private List<DeptDTO> deptDto;
	
	public int getSign_no() {
		return sign_no;
	}
	public void setSign_no(int sign_no) {
		this.sign_no = sign_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	public int getState_no() {
		return state_no;
	}
	public void setState_no(int state_no) {
		this.state_no = state_no;
	}
	public List<StateDTO> getStateDto() {
		return stateDto;
	}
	public void setStateDto(List<StateDTO> stateDto) {
		this.stateDto = stateDto;
	}
	public List<RankDTO> getRankDto() {
		return rankDto;
	}
	public void setRankDto(List<RankDTO> rankDto) {
		this.rankDto = rankDto;
	}
	public List<DeptDTO> getDeptDto() {
		return deptDto;
	}
	public void setDeptDto(List<DeptDTO> deptDto) {
		this.deptDto = deptDto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
