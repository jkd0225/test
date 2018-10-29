package com.jhta.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value = "/t_board", method = RequestMethod.GET)
	public String board() {
		return ".t_board";
	}
}
