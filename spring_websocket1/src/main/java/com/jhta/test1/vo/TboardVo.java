package com.jhta.test1.vo;

public class TboardVo {
	private int num;
	private String writer;
	private String title;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private String orgfilename;
	private String savefilename;
	private long filesize;

	public TboardVo() {
	}

	
	
	public TboardVo(int num, String writer, String title, String content, int ref, int lev, int step,
			String orgfilename, String savefilename, long filesize) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
		this.orgfilename = orgfilename;
		this.savefilename = savefilename;
		this.filesize = filesize;
	}



	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

}
