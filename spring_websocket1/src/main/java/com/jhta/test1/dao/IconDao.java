package com.jhta.test1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.IconVo;

@Repository
public class IconDao {
	@Autowired
	private SqlSession session;
	
	public List<IconVo> list(Map<String, Object> map){
		return session.selectList("com.jhta.mybatis.StoreMapper.list", map);
	}
	
	public int getCount(Map<String, Object> map) {
		return session.selectOne("com.jhta.mybatis.StoreMapper.getCount", map);
	}
}
