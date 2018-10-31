package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.MemberService;
import com.jhta.test1.vo.AuthVo;
import com.jhta.test1.vo.MemberInfoVo;

@Controller
public class AdminsController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String index(Model model) {
		List<MemberInfoVo> users = service.list();

		model.addAttribute("users", users);
		return ".admin.index";
	}

	@RequestMapping(value = "/admin/role/{userId}/{role}")
	public String changeRole(@PathVariable int userId, @PathVariable String role) {
		toggleRole(userId, role);
		return "redirect:/admin";
	}

	public void toggleRole(int userId, String role) {
		MemberInfoVo user = service.getInfo(userId);
		if (!user.hasRole(role))
			service.insertAuth(new AuthVo(user.getEmail(), "ROLE_" + role.toUpperCase()));
		else
			service.deleteAuth(new AuthVo(user.getEmail(), "ROLE_" + role.toUpperCase()));
	}
}
