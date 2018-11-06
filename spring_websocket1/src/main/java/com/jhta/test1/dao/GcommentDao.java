package com.jhta.test1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.GcommentVo;

@Repository
public class GcommentDao {
	@Autowired
	private SqlSession session;
	
	public int insert(GcommentVo vo) {
		return session.insert("com.jhta.mybatis.GcommentMapper.insert", vo);
	}
	
	public List<GcommentVo> list(int num){
		return session.selectList("com.jhta.mybatis.GcommentMapper.list", num);
	}
	
	public int getCount(int num) {
		return session.selectOne("com.jhta.mybatis.GcommentMapper.getCount", num);
	}
	
	public int delete(int cnum) {
		return session.delete("com.jhta.mybatis.GcommentMapper.delete", cnum);
	}
}
