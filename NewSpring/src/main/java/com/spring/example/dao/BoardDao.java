package com.spring.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.example.vo.BoardListVO;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<BoardListVO> selectBoardList(){
		List<BoardListVO> boardList = sqlSession.selectList("userMapper.selectBoardList");
		return boardList;
	}

	public BoardListVO selectBoard(int bseq) {
		BoardListVO board = sqlSession.selectOne("userMapper.selectBoard", bseq);
		return board;
	}

}
