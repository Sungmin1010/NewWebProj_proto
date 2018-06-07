package com.spring.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.example.vo.ReplyVO;

@Repository
public class ReplyDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public void create(ReplyVO vo) {
		sqlSession.insert("userMapper.insertReply", vo);
		
	}

	public List<ReplyVO> list(int bseq) {
		
		return sqlSession.selectList("userMapper.list", bseq);
	}

	public void update(ReplyVO vo) {
		sqlSession.update("userMapper.update", vo);
		
	}

	public void delete(int rseq) {
		sqlSession.update("userMapper.delete", rseq);
		
	}
	
	

}
