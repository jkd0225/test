package com.jhta.test1.vo;

import java.util.List;

public class MemberInfoVo {
	private int id;
	private String email;
	private String password;
	List<AuthVo> authorities;

	public MemberInfoVo() {
	}

	public boolean hasRole(String role) {
		for(AuthVo vo : authorities) {
			if(vo.isRole(role)) {
				return true;				
			}
		}
		return false;
	}

	

	public List<AuthVo> getAuthorities() {
		return authorities;
	}





	public void setAuthorities(List<AuthVo> authorities) {
		this.authorities = authorities;
	}





	public MemberInfoVo(int id, String email, String password, List<AuthVo> authorities) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.authorities = authorities;
	}





	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", password=" + password + "]";
	}
}
