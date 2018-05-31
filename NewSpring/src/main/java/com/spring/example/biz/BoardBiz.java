package com.spring.example.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.example.Paging;
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
	
	public List<BoardListVO> selectBoardList(Paging paging){
		
		return dao.listPage(paging);
	}
	
	public int listCountPage(Paging paging) {
		return dao.countPaging(paging);
	}
	
	public BoardListVO selectBoard(int bseq) {
		//increase hit 
		
		return dao.selectBoard(bseq);
	}

	@Transactional()
	public void insertBoard(HttpSession session, BoardVO vo) {
		// insert board
		UserVO userVO = (UserVO) session.getAttribute("userInfo");
		vo.setUseq(userVO.getUseq());
		logger.info("insert board vo {}", vo);
		dao.insertBoard(vo);
		String[] files = vo.getFiles();
		if(files == null) {return;}
		for(String fileName:files) {
			dao.addAttach(fileName);
		}
	}
	
	//get File fullName with bseq(ajax)
	public List<String> getAttach(int bseq){
		List<String> list = dao.getAttach(bseq);
		logger.info("get list");
		System.out.println("가져온 데이터 크기" +list.size());
		return list;
	}
	
	//modify board content + delete files from tb_attach + insert files from tb_attach
	@Transactional
	public void modify(BoardVO vo) {
		dao.updateBoard(vo);
		
		int bseq = vo.getBseq();
		dao.deleteAttach(bseq);
		
		String[] files = vo.getFiles();
		if(files==null) {
			return ;
		}
		for(String fileName: files) {
			dao.replaceAttach(fileName, bseq);
		}
	}
}
