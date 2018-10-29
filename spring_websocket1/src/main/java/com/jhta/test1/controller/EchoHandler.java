package com.jhta.test1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.jhta.test1.dao.ChatDao;
import com.jhta.test1.vo.ChatVo;




public class EchoHandler extends TextWebSocketHandler{
	
	@Inject
	private ChatDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} ¿¬°áµÊ", session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}·Î ºÎÅÍ {} ¹ÞÀ½", session.getId(), message.getPayload());
		
		ChatVo vo = ChatVo.convertMessage(message.getPayload());
		dao.insert(vo);
		vo.setContent(vo.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
		System.out.println(vo.toString());
		
		for(WebSocketSession sess : sessionList) {
			Gson gson = new Gson();
			String msg = gson.toJson(vo);
			System.out.println(msg);
			sess.sendMessage(new TextMessage(msg));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} ¿¬°á ²÷±è", session.getId());
	}
}








