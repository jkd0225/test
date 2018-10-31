package com.jhta.test1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.test1.vo.AuthVo;
import com.jhta.test1.vo.MemberInfoVo;
import com.jhta.test1.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession session;
	
	public int insert(MemberVo vo) {
		return session.insert("com.jhta.mybatis.MemberMapper.insert",vo);
	}
	
	public int addAuth(Map<String, Object> map) {
		return session.insert("com.jhta.mybatis.MemberMapper.addAuth",map);
	}
	
	public List<MemberInfoVo> list(){
		return session.selectList("com.jhta.mybatis.MemberMapper.list");
	}
	
	public MemberInfoVo getInfo(int id) {
		return session.selectOne("com.jhta.mybatis.MemberMapper.getInfo", id);
	}
	
	public List<AuthVo> getAuth(String email){
		return session.selectList("com.jhta.mybatis.MemberMapper.getAuth", email);
	}
	
	public int insertAuth(AuthVo vo) {
		return session.insert("com.jhta.mybatis.MemberMapper.insertAuth", vo);
	}
	
	public int deleteAuth(AuthVo vo) {
		return session.delete("com.jhta.mybatis.MemberMapper.deleteAuth", vo);
	}
}










