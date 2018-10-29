package com.jhta.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.vo.GboardVo;

@Controller
public class InsertController {
	@Autowired
	private GboardService service;
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(GboardVo vo) {
		service.insert(vo);
		return "redirect:.t_board";
	}
	
}
