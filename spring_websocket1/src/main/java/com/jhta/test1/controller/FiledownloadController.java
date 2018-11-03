package com.jhta.test1.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.test1.service.TboardService;
import com.jhta.test1.vo.TboardVo;

@Controller
public class FiledownloadController {
	@Autowired
	private TboardService service;
	
	@RequestMapping(value="/fileDownload",method = RequestMethod.GET)
	public String download(int num,HttpSession session,Model model) {
		TboardVo vo = service.detail(num);
		String path = session.getServletContext().getRealPath("/resources/upload");
		File f = new File(path + "/" + vo.getSavefilename());
		String filename = vo.getOrgfilename();
		
		model.addAttribute("file", f);
		model.addAttribute("filename", filename);
		model.addAttribute("filesize", vo.getFilesize());
		
		return "filedownloadView";
	}
}
