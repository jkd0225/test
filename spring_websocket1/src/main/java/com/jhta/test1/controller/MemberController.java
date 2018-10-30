package com.jhta.test1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.MemberService;
import com.jhta.test1.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		MemberVo vo = new MemberVo();
		model.addAttribute("user", vo);
		return ".users.signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String create(MemberVo vo) {
		
		service.insert(vo);
		return "redirect:.login";
	}
}
