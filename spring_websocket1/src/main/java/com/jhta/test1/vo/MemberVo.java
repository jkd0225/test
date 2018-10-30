package com.jhta.test1.vo;


public class MemberVo {
	private int id;
	private String email;
	private String password;
	private String authority;
	
	
	public MemberVo() {}
	
	
	
	





	public String getAuthority() {
		return authority;
	}









	public void setAuthority(String authority) {
		this.authority = authority;
	}









	public MemberVo(int id, String email, String password, String authority) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.authority = authority;
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
