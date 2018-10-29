package com.jhta.test1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.GboardVo;
@Repository
public class GboardDao {
	@Autowired
	private SqlSession session;
	
	public int insert(GboardVo vo) {
		return session.insert("com.jhta.mybatis.GboardMapper.insert",vo);
	}
	
	public List<GboardVo> list(Map<String, Object> map){
		return session.selectList("com.jhta.mybatis.GboardMapper.list", map);
	}
	
	public int getCount(Map<String, Object> map) {
		return session.selectOne("com.jhta.mybatis.GboardMapper.getCount", map);
	}
	
	public GboardVo detail(int num) {
		return session.selectOne("com.jhta.mybatis.GboardMapper.detail", num);
	}
}
