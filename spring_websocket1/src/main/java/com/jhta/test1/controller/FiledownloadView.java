package com.jhta.test1.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
/*
 *  커스텀뷰만들기(사용자가 직접 만드는 뷰)
 *  - AbstractiView 상속받아 구현
 */
public class FiledownloadView extends AbstractView{
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//1. 다운로드창에 보여질 정보 설정(파일명이 한글인 경우 깨지지 않도록)
		//다운로드창으로 응답하기위한 콘텐츠타입설정
		super.setContentType("application/octet-stream");
		File f = (File)model.get("file");
		String filename = (String)model.get("filename");
		long filesize = (Long)model.get("filesize");
		response.setContentType(getContentType());
		response.setContentLength((int)filesize);
		//한글이 깨지지않도록 인코딩하기
		filename = URLEncoder.encode(filename, "utf-8");
		//공백이 +문자로 변환된것을 다시 공백문자로 변환하기
		filename = filename.replaceAll("\\+", "%20");
		//다운로드창에 보여질 파일명 지정
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		//2. 다운로드하기(파일복사)
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis,os);
		os.close();
		fis.close();
	}
}

















