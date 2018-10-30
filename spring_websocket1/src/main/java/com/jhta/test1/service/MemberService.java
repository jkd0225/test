package com.jhta.test1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.MemberDao;
import com.jhta.test1.vo.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	

	public List<MemberVo> list(){
		return dao.list();
	}
	

}










