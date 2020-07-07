package com.kosmo.travelmaker.service;

import org.springframework.stereotype.Repository;

@Repository("memberDTO")
public class MemberDTO {
	
	private String name;
	private String id;
	private String pwd;
	private String password_check;
	private String rrn;
	private String gender;
	
	public String getPassword_check() {
		return password_check;
	}
	public void setPassword_check(String password_check) {
		this.password_check = password_check;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getPassword() {
		return pwd;
	}
	public void setPassword(String password) {
		this.pwd = password;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", id=" + id + ", pwd=" + pwd + ", password_check=" + password_check
				+ ", rrn=" + rrn + ", gender=" + gender + "]";
	}
	
}
