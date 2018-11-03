package com.jhta.test1.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.test1.service.TboardService;
import com.jhta.test1.vo.TboardVo;

@Controller
public class TboardInsert {
	@Autowired
	private TboardService service;
//	
//	@RequestMapping(value="/tboardInsert", method=RequestMethod.GET)
//	public String insert() {
//		return ".board.insert";
//	}
	
	@RequestMapping(value="/tboardInsert", method=RequestMethod.GET)
	public String insert1(TboardVo vo,Model model) {
		model.addAttribute("vo", vo);
		return ".board.insert";
	}
	
	@RequestMapping(value="/tboardInsert", method=RequestMethod.POST)
	public String insert2(TboardVo vo,MultipartFile file1,HttpSession session) {
		int boardNum = service.getMaxNum() + 1;
		int num = 0;
		int ref = 0;
		int lev = 0;
		int step = 0;
		
		if(vo.getNum() != 0) {
			num = vo.getNum();
			ref = vo.getRef();
			lev = vo.getLev();
			step = vo.getStep();
		}
		
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
		
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		String orgfilename = file1.getOriginalFilename();
		String savefilename = UUID.randomUUID() + "_" + orgfilename;
		
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefilename);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(uploadPath + "경로에 파일업로드 성공!");
			long filesize = file1.getSize();
			TboardVo tboardVo = new TboardVo(boardNum, vo.getWriter(), vo.getTitle(), vo.getContent(), 
					ref, lev, step,orgfilename,savefilename,filesize);
			service.insert(tboardVo);
			return "redirect:/tboardList";
		}catch(Exception ie){
			ie.getStackTrace();
			return "error";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
