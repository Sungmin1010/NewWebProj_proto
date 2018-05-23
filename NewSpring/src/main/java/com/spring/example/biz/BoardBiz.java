package com.spring.example.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.dao.BoardDao;
import com.spring.example.vo.BoardListVO;

@Service
public class BoardBiz {

	@Autowired
	private BoardDao dao;
	
	public List<BoardListVO> selectBoardList(){
		//remake datetime format
		return dao.selectBoardList();
	}
	
	public BoardListVO selectBoard(HttpServletRequest req) {
		//increase hit 
		return dao.selectBoard(Integer.parseInt(req.getParameter("bseq")));
	}
}
