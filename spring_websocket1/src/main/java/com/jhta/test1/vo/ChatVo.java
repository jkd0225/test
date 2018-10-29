package com.jhta.test1.vo;

import java.sql.Date;

import com.google.gson.Gson;

public class ChatVo {
	private int num;
	private String sender;
	private String receiver;
	private String content;
	private int room;
	private int read;
	private Date regdate;
	
	public ChatVo() {}

	

	public ChatVo(int num, String sender, String receiver, String content, int room, int read, Date regdate) {
		super();
		this.num = num;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.room = room;
		this.read = read;
		this.regdate = regdate;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public int getNum() {
		return num;
	}

	public int getRead() {
		return read;
	}


	public void setRead(int read) {
		this.read = read;
	}


	public void setNum(int num) {
		this.num = num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}
	
	public static ChatVo convertMessage(String source) {
		ChatVo message = new ChatVo();
		Gson gson = new Gson();
		message = gson.fromJson(source, ChatVo.class);
		return message;
	}



	@Override
	public String toString() {
		return "ChatVo [num=" + num + ", sender=" + sender + ", receiver=" + receiver + ", content=" + content
				+ ", room=" + room + ", read=" + read + ", regdate=" + regdate + "]";
	}

	
	
	
}
