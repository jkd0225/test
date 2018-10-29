package com.jhta.test1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.ChatVo;
import com.jhta.test1.vo.RoomVo;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession session;
	
	public int insert(ChatVo vo) {
		return session.insert("com.jhta.mybatis.ChatMapper.insert",vo);
	}
	
	public List<ChatVo> list(int room){
		return session.selectList("com.jhta.mybatis.ChatMapper.list",room);
	}
	
	public List<RoomVo> getRoom(String user_id) {
		return session.selectList("com.jhta.mybatis.ChatMapper.getRoom", user_id);
	}
	
	public int update(ChatVo vo) {
		return session.update("com.jhta.mybatis.ChatMapper.read", vo);
	}
}
