package com.jhta.test1.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.TboardService;
import com.jhta.test1.vo.TboardVo;

@Controller
public class TboardInsert {
	@Autowired
	private TboardService service;
	
	@RequestMapping(value="/tboardInsert", method=RequestMethod.GET)
	public String insert() {
		return ".board.insert";
	}
	
	@RequestMapping(value="/tboardReplyInsert", method=RequestMethod.GET)
	public String insert1(TboardVo vo,Model model) {
		model.addAttribute("vo", vo);
		return ".board.insert";
	}
	
	@RequestMapping(value="/tboardInsert", method=RequestMethod.POST)
	public String insert(TboardVo vo) {
		int boardNum = service.getMaxNum() + 1;
		int num = vo.getNum();
		int ref = vo.getRef();
		int lev = vo.getLev();
		int step = vo.getStep();
		
		if(num == 0) {
			ref = boardNum;
		}else {
			Map<String, Object> map = new HashMap<>();
			map.put("ref", ref);
			map.put("step", step);
			service.insertReply(map);
			
			lev += 1;
			step += 1;
		}
		
		TboardVo tboardVo = new TboardVo(boardNum, vo.getWriter(), vo.getTitle(), vo.getContent(), ref, lev, step);
		service.insert(tboardVo);
		
		return "redirect:/tboardList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
