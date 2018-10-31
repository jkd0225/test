package com.jhta.test1.vo;

public class AuthVo {
	private String email;
	private String authority;
	
	public AuthVo() {}

	public boolean isRole(String role) {
		return authority.equals("ROLE_" + role.toUpperCase());
	}
	
	public AuthVo(String email, String authority) {
		super();
		this.email = email;
		this.authority = authority;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
}
