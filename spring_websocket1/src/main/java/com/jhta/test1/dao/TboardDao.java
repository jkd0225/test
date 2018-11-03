package com.jhta.test1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.TboardVo;

@Repository
public class TboardDao {
	@Autowired
	private SqlSession session;
	
	public int getMaxNum() {
		return session.selectOne("com.jhta.mybatis.TboardMapper.getMaxNum");
	}
	
	public int getCount() {
		return session.selectOne("com.jhta.mybatis.TboardMapper.getCount");
	}
	
	public int insert(TboardVo vo)	{
		return session.insert("com.jhta.mybatis.TboardMapper.insert", vo);
	}
	
	public int insertReply(Map<String, Object> map) {
		return session.insert("com.jhta.mybatis.TboardMapper.insertReply", map);
	}
	
	public List<TboardVo> list(Map<String, Object> map){
		return session.selectList("com.jhta.mybatis.TboardMapper.list", map);
	}
	
	public TboardVo detail(int num) {
		return session.selectOne("com.jhta.mybatis.TboardMapper.detail", num);
	}
	
	public int update(TboardVo vo) {
		return session.update("com.jhta.mybatis.TboardMapper.update", vo);
	}
}
















