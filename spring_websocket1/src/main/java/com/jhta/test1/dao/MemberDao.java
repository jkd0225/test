package com.jhta.test1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession session;
	
	public int insert(MemberVo vo) {
		return session.insert("com.jhta.mybatis.MemberMapper.insert",vo);
	}
	
	
	public List<MemberVo> list(){
		return session.selectList("com.jhta.mybatis.MemberMapper.list");
	}
	
	
}










