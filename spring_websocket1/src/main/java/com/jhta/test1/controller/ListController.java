package com.jhta.test1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.vo.GboardVo;
import com.jhta.util.PageUtil;

@Controller
public class ListController {
	@Autowired
	private GboardService service;
	
	@RequestMapping("/list")
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String sort, String field, String keyword, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		int totalRowCount = service.getCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<GboardVo> list =  service.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return ".list";
	}
}
