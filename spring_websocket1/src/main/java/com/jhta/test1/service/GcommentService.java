package com.jhta.test1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.GcommentDao;
import com.jhta.test1.vo.GcommentVo;

@Service
public class GcommentService {
	@Autowired
	private GcommentDao dao;
	
	public int insert(GcommentVo vo) {
		return dao.insert(vo);
	}
	
	public List<GcommentVo> list(int num){
		return dao.list(num);
	}
}
