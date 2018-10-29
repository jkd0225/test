package com.jhta.test1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.ChatService;
import com.jhta.test1.vo.ChatVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(int room) {
		String user = "aaa";
		ChatVo vo = new ChatVo(0, user, null, null, room, 0, null);
		service.update(vo);
		return ".main";
	}
	
}
