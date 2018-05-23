package com.spring.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.example.biz.BoardBiz;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping(value="/boardList.sp")
	public String boardList(Model model) {
		logger.info("user into the boardList page");
		
		model.addAttribute("voList", biz.selectBoardList());
		
		return "boardList";
		
	}
	
	@RequestMapping(value="/getBoard.sp", method=RequestMethod.GET)
	public String getBoard(HttpServletRequest req, Model model) {
		logger.info("user select post");
		System.out.println(req.getParameter("bseq"));
		
		model.addAttribute("vo", biz.selectBoard(req));
		
		
		return "getBoard";
	}

}
