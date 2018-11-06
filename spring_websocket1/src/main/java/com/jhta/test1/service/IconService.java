package com.jhta.test1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.IconDao;
import com.jhta.test1.vo.IconVo;

@Service
public class IconService {
	@Autowired
	private IconDao dao;
	
	public List<IconVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	
	public int getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}
}
