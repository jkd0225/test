package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.ChatService;
import com.jhta.test1.vo.RoomVo;

@Controller
public class RoomController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String room(String user_id,Model model) {
		List<RoomVo> list = service.getRoom(user_id);
		model.addAttribute("list", list);
		return ".room";
	}
}
