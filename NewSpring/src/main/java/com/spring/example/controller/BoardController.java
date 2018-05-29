package com.spring.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.example.PageMaker;
import com.spring.example.Paging;
import com.spring.example.biz.BoardBiz;
import com.spring.example.vo.BoardListVO;
import com.spring.example.vo.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping(value="/boards", method=RequestMethod.GET)
	public String boardList(Paging paging, Model model){ 
		logger.info("user into the boardList page");
		logger.info(paging.toString());
		model.addAttribute("voList", biz.selectBoardList(paging));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(paging);
		//pageMaker.setTotalCount(13);
		pageMaker.setTotalCount(biz.listCountPage(paging));
		model.addAttribute("pageMaker", pageMaker);
		
		return "boardList";
		
	}
	
	@RequestMapping(value="/boards", method=RequestMethod.POST)
	public ModelAndView newBoard(BoardVO vo, ModelAndView mv, HttpSession session){
		logger.info("user add new board {}", vo);
		//insert board
		biz.insertBoard(session, vo);
		mv.setViewName("redirect:/boards");
		
		return mv;
		
	}
	
	@RequestMapping(value="/boards/{bseq}", method=RequestMethod.GET)
	public String getBoard(@PathVariable int bseq, HttpServletRequest req, Model model) {
		logger.info("user select post URI {}", req.getRequestURI());
		 
		model.addAttribute("vo", biz.selectBoard(bseq));
		
		
		return "getBoard";
	}
	
	@RequestMapping(value="/boards/new", method=RequestMethod.GET)
	public String newBoard() {
		logger.info("user get new board form");
		return "postForm";
	}
	
	

}
