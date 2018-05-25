package com.spring.example.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.controller.BoardController;
import com.spring.example.dao.BoardDao;
import com.spring.example.vo.BoardListVO;
import com.spring.example.vo.BoardVO;
import com.spring.example.vo.UserVO;

@Service
public class BoardBiz {

	private static final Logger logger = LoggerFactory.getLogger(BoardBiz.class);
	@Autowired
	private BoardDao dao;
	
	public List<BoardListVO> selectBoardList(int page, int count){
		//remake datetime format
		int start = count*(page-1)+1; //select 1~count, ...
		return dao.selectBoardList(start, count);
	}
	
	public BoardListVO selectBoard(int bseq) {
		//increase hit 
		
		return dao.selectBoard(bseq);
	}

	public int insertBoard(HttpSession session, BoardVO vo) {
		// insert board
		UserVO userVO = (UserVO) session.getAttribute("userInfo");
		vo.setUseq(userVO.getUseq());
		logger.info("insert board vo {}", vo);
		
		return dao.insertBoard(vo);
	}
}
