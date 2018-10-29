package com.jhta.test1.vo;

import java.sql.Date;

public class GboardVo {
	private int num;
	private String title;
	private String content;
	private Date regdate;
	
	public GboardVo() {}

	public GboardVo(int num, String title, String content, Date regdate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}

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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
