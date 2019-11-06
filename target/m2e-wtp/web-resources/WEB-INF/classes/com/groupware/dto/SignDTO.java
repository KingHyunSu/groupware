package com.groupware.dto;

import java.sql.Date;

public class SignDTO {

	private int sign_no;
	private String title;
	private String content;
	private Date date;
	private String id;
	private int state_no;
	private StateDTO stateDto;
	
	public int getSign_no() {
		return sign_no;
	}
	public void setSign_no(int sign_no) {
		this.sign_no = sign_no;
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
	public int getState_no() {
		return state_no;
	}
	public void setState_no(int state_no) {
		this.state_no = state_no;
	}
	public StateDTO getStateDto() {
		return stateDto;
	}
	public void setStateDto(StateDTO stateDto) {
		this.stateDto = stateDto;
	}
	
	
}
