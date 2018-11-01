package com.jhta.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.TboardService;
import com.jhta.test1.vo.TboardVo;

@Controller
public class TboardDetailController {
	@Autowired
	private TboardService service;
	
	@RequestMapping(value="/tboardDetail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		TboardVo vo =  service.detail(num);
		model.addAttribute("vo", vo);
		return ".board.detail";
	}
}
