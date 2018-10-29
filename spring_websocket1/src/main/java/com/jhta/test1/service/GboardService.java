package com.jhta.test1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.GboardDao;
import com.jhta.test1.vo.GboardVo;

@Service
public class GboardService {
	@Autowired
	private GboardDao dao;
	
	public int insert(GboardVo vo) {
		return dao.insert(vo);
	}
	
	public List<GboardVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
	
	public GboardVo detail(int num) {
		return dao.detail(num);
	}
}
