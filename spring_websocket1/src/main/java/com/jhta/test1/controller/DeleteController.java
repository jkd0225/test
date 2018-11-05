package com.jhta.test1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;

@Controller
public class DeleteController {
	@Autowired
	private GboardService service;
	
	@RequestMapping(value="/gboardDelete",method=RequestMethod.GET)
	public String delete(int num) {
		service.delete(num);
		return "redirect:/list";
	}
}
