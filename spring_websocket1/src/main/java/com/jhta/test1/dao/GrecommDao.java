package com.jhta.test1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.GrecommVo;

@Repository
public class GrecommDao {
	@Autowired
	private SqlSession session;
	
	public int insert(GrecommVo vo) {
		return session.insert("com.jhta.mybatis.GrecommMapper.insert", vo);
	}
	
	public GrecommVo isRecomm(GrecommVo vo) {
		return session.selectOne("com.jhta.mybatis.GrecommMapper.isRecomm", vo);
	}
	
	public int getRecommCount(int num) {
		return session.selectOne("com.jhta.mybatis.GrecommMapper.getRecommCount", num);
	}
	
	public int delete(GrecommVo vo) {
		return session.delete("com.jhta.mybatis.GrecommMapper.delete", vo);
	}
	
	public List<GrecommVo> list() {
		return session.selectList("com.jhta.mybatis.GrecommMapper.list");
	}
	
}
