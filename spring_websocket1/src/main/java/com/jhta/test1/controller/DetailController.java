package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.vo.GboardVo;
import com.jhta.test1.vo.GcommentVo;

@Controller
public class DetailController {
	@Autowired
	private GboardService service;
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		service.hitUp(num);
		GboardVo vo = service.detail(num);
		List<GcommentVo> list = service.commentList(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return ".detail";
	}
}
