package com.jhta.test1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.test1.dao.TboardDao;
import com.jhta.test1.vo.TboardVo;

@Service
public class TboardService {
	@Autowired
	private TboardDao dao;
	
	public int getMaxNum() {
		return dao.getMaxNum();
	}
	
	public int getCount() {
		return dao.getCount();
	}
	
	public int insert(TboardVo vo) {
		return dao.insert(vo);
	}
	
	public int insertReply(Map<String, Object> map) {
		return dao.insertReply(map);
	}	
	
	public List<TboardVo> list(Map<String, Object> map){
		return dao.list(map);
	}
	
	public TboardVo detail(int num) {
		return dao.detail(num);
	}
}












