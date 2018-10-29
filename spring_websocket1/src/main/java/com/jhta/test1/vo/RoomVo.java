package com.jhta.test1.vo;

public class RoomVo {
	private int room_num;
	private String user_id;
	private String tutor_id;
	
	public RoomVo() {}

	public RoomVo(int room_num, String user_id, String tutor_id) {
		super();
		this.room_num = room_num;
		this.user_id = user_id;
		this.tutor_id = tutor_id;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTutor_id() {
		return tutor_id;
	}

	public void setTutor_id(String tutor_id) {
		this.tutor_id = tutor_id;
	}
	
	
}
