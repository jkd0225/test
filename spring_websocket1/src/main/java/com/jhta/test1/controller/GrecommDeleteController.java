package com.jhta.test1.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.jhta.test1.service.GboardService;
import com.jhta.test1.service.GrecommService;
import com.jhta.test1.vo.GrecommVo;

@Controller
public class GrecommDeleteController {
	@Autowired
	private GrecommService service;
	@Autowired
	private GboardService service2;
	
	@RequestMapping(value="/recommDown",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(String writer, int num,Model model) {
		
		GrecommVo vo =new GrecommVo(0, writer, num);
		if(service.isRecomm(vo)==null) {
			service.delete(vo);
			int recomm = service.getRecommCount(num);
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("recomm", recomm);
			service2.recommUp(map);
		}
		JsonObject obj = new JsonObject();
		
		obj.addProperty("isrecomm", false);
		
		return obj.toString();
	}
}
