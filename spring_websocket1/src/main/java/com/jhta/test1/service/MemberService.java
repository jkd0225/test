package com.jhta.test1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.MemberDao;
import com.jhta.test1.vo.AuthVo;
import com.jhta.test1.vo.MemberInfoVo;
import com.jhta.test1.vo.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	
	public int addAuth(Map<String, Object> map) {
		return dao.addAuth(map);
	}
	
	public List<MemberInfoVo> list(){
		return dao.list();
	}
	
	public MemberInfoVo getInfo(int id) {
		return dao.getInfo(id);
	}
	
	public List<AuthVo> getAuth(String email) {
		return dao.getAuth(email);
	}
	
	public int insertAuth(AuthVo vo) {
		return dao.insertAuth(vo);
	}
	
	public int deleteAuth(AuthVo vo) {
		return dao.deleteAuth(vo);
	}
}










