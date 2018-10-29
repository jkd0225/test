package com.jhta.test1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.ChatDao;
import com.jhta.test1.vo.ChatVo;
import com.jhta.test1.vo.RoomVo;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;
	
	public int insert(ChatVo vo) {
		return dao.insert(vo);
	}
	
	public List<ChatVo> list(int room){
		return dao.list(room);
	}
	
	public List<RoomVo> getRoom(String user_id) {
		return dao.getRoom(user_id);
	}
	
	public int update(ChatVo vo) {
		return dao.update(vo);
	}
}
