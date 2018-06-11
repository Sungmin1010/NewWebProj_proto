package com.spring.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.example.Paging;
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
	
	//paging
	public List<ReplyVO> listPage(int bseq, Paging cri){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bseq", bseq);
		paramMap.put("cri", cri);
		return sqlSession.selectList("userMapper.listPage", paramMap);
	}
	public int count(int bseq) {
		return sqlSession.selectOne("userMapper.countReply", bseq);
		
	}
	
	

}
