package com.jhta.test1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.GrecommDao;
import com.jhta.test1.vo.GrecommVo;

@Service
public class GrecommService {
	@Autowired
	private GrecommDao dao;
	
	public int insert(GrecommVo vo) {
		return dao.insert(vo);
	}
	
	public GrecommVo isRecomm(GrecommVo vo) {
		return dao.isRecomm(vo);
	}
	
	public int getRecommCount(int num) {
		return dao.getRecommCount(num);
	}
	
	public int delete(GrecommVo vo) {
		return dao.delete(vo);
	}
	
	public List<GrecommVo> list() {
		return dao.list();
	}
}
