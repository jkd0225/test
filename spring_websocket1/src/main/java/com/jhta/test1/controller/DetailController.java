package com.jhta.test1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.GboardService;
import com.jhta.test1.service.GrecommService;
import com.jhta.test1.vo.GboardVo;
import com.jhta.test1.vo.GcommentVo;
import com.jhta.test1.vo.GrecommVo;

@Controller
public class DetailController {
	@Autowired
	private GboardService service;
	@Autowired
	private GrecommService service2;
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		int bnum = num;
		service.hitUp(num);
		GboardVo vo = service.detail(num);
		List<GcommentVo> list = service.commentList(num);
		for(GcommentVo vo2 : list) {
			vo2.setContent(vo2.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
		}
		GrecommVo vo1 = new GrecommVo(0, vo.getWriter(), bnum);
		
		if(service2.isRecomm(vo1)==null) {
			model.addAttribute("isRecomm", "false");
		}else {
			model.addAttribute("isRecomm", "true");
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return ".detail";
	}
}
