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

import com.jhta.test1.service.TboardService;
import com.jhta.test1.vo.TboardVo;
import com.jhta.util.PageUtil;

@Controller
public class TboardListController {
	@Autowired
	private TboardService service;
	
	@RequestMapping(value="/tboardList", method=RequestMethod.GET)
	public String list(@RequestParam(value="pageNum", defaultValue="1")int pageNum, Model model) {
		int totalRowCount = service.getCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<TboardVo> list = service.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".board.list";
	}
}













