package com.jhta.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.vo.GboardVo;

@Controller
public class DetailController {
	@Autowired
	private GboardService service;
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		GboardVo vo = service.detail(num);
		model.addAttribute("vo", vo);
		return ".detail";
	}
}
