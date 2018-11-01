package com.jhta.test1.vo;

public class GrecommVo {
	private int num;
	private String writer;
	private int bnum;
	
	public GrecommVo() {}

	public GrecommVo(int num, String writer, int bnum) {
		super();
		this.num = num;
		this.writer = writer;
		this.bnum = bnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	
	
}
