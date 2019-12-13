package com.groupware.dto;

import java.sql.Date;
import java.util.List;

public class NoticeDTO {

	private int num;
	private String title;
	private String content;
	private Date date;
	private String id;
	
	private List<MemberDTO> memberDto;
	private List<DeptDTO> deptDto;
	private List<RankDTO> rankDto;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<MemberDTO> getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(List<MemberDTO> memberDto) {
		this.memberDto = memberDto;
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
