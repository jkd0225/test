package com.jhta.test1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jhta.test1.service.GboardService;
import com.jhta.test1.service.GcommentService;
import com.jhta.test1.vo.GcommentVo;

@Controller
public class CommentController {
	@Autowired
	private GcommentService service;
	@Autowired
	private GboardService service2;
	
	@RequestMapping(value="/commentInsert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		String comment = req.getParameter("comment");
		GcommentVo vo = new GcommentVo(0, comment, num, null);
		int n = service.insert(vo);
		int comments = service.getCount(num);
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("comments", comments);
		service2.commentUp(map);
		
		JsonObject obj = new JsonObject();
		if(n>0) {
			obj.addProperty("code", true);
		}else {
			obj.addProperty("code", false);
		}
		return obj.toString();
	}
	
	
	@RequestMapping(value="/comment",produces="application/json;charset=utf-8")
	@ResponseBody
	public String list(int num){
		List<GcommentVo> list = service.list(num);
		JsonArray arr = new JsonArray();
		for(GcommentVo vo : list) {
			JsonObject json = new JsonObject();
			json.addProperty("cnum", vo.getCnum());
			json.addProperty("content", vo.getContent());
			arr.add(json);
		}
		return arr.toString();
	}
}
