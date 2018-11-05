package com.jhta.test1.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
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
public class TboardDetailController {
	@Autowired
	private TboardService service;
	
	@RequestMapping(value="/tboardDetail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		TboardVo vo =  service.detail(num);
		model.addAttribute("vo", vo);
		return ".board.detail";
	}
	
	@RequestMapping(value="/tboardUpdate",method=RequestMethod.GET)
	public String update(int num,Model model) {
		TboardVo vo =  service.detail(num);
		model.addAttribute("vo", vo);
		return ".board.update";
	}
	
	@RequestMapping(value="/tboardUpdate",method=RequestMethod.POST)
	public String update(TboardVo vo,HttpSession session,MultipartFile file1) {
		try {
			if(!file1.isEmpty()) {
				String path = session.getServletContext().getRealPath("/resources/upload");
				String fname = service.detail(vo.getNum()).getSavefilename();
				File f = new File(path + "/" + fname);
				f.delete();
				String orgfilename = file1.getOriginalFilename();
				String savefilename = UUID.randomUUID() + "_" + orgfilename;
				InputStream is = file1.getInputStream();
				FileOutputStream fos = new FileOutputStream(path + "/" + savefilename);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				long filesize = file1.getSize();
				vo.setOrgfilename(orgfilename);
				vo.setSavefilename(savefilename);
				vo.setFilesize(filesize);
			}else {
				vo.setOrgfilename(service.detail(vo.getNum()).getOrgfilename());
				vo.setSavefilename(service.detail(vo.getNum()).getSavefilename());
				vo.setFilesize(service.detail(vo.getNum()).getFilesize());
			}
			service.update(vo);
			
			return "redirect:/tboardList";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
