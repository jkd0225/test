package com.jhta.test1.vo;

import java.sql.Date;

public class GboardVo {
	private int num;
	private String title;
	private String content;
	private Date regdate;
	private int comments;
	private int hit;
	private int recomm;
	private String writer;

	public GboardVo() {
	}

	
	
	public int getComments() {
		return comments;
	}



	public void setComments(int comments) {
		this.comments = comments;
	}



	public GboardVo(int num, String title, String content, Date regdate, int comments, int hit, int recomm,
			String writer) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.comments = comments;
		this.hit = hit;
		this.recomm = recomm;
		this.writer = writer;
	}



	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecomm() {
		return recomm;
	}

	public void setRecomm(int recomm) {
		this.recomm = recomm;
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
