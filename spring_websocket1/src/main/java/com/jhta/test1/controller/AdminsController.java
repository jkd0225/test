package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.MemberService;
import com.jhta.test1.vo.MemberVo;

@Controller
public class AdminsController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String index(Model model) {
		List<MemberVo> users = service.list();
		model.addAttribute("users", users);
		return ".admin.index";
	}
}
