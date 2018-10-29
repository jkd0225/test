package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.ChatService;
import com.jhta.test1.vo.ChatVo;

@Controller
public class ChatController {
	@Autowired
	private ChatService service;
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(int room,Model model) {
		List<ChatVo> list = service.list(room);
		for(ChatVo vo1 : list) {
			vo1.setContent(vo1.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
		}
		String user = "aaa";
		ChatVo vo = new ChatVo(0, user, null, null, room, 0, null);
		service.update(vo);
		model.addAttribute("list", list);
		model.addAttribute("room", room);
		model.addAttribute("user", user);
		return ".chat";
	}
	
}

