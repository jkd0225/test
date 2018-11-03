package com.jhta.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.vo.GboardVo;

@Controller
public class UpdateController {
	@Autowired
	private GboardService service;
	
	@RequestMapping(value="/gboardUpdate", method=RequestMethod.POST)
	public String update(GboardVo vo,Model model) {
		model.addAttribute("vo", vo);
		return ".update";
	}
	
	@RequestMapping(value="/gboardUpdateOk", method=RequestMethod.POST)
	public String updateOk(GboardVo vo,Model model) {
		service.update(vo);
		return "redirect:/list";
	}
}










