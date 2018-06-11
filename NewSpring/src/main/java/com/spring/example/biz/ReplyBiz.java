package com.spring.example.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.Paging;
import com.spring.example.dao.ReplyDao;
import com.spring.example.vo.ReplyVO;

@Service
public class ReplyBiz {

	@Autowired
	private ReplyDao dao;
	
	public void addReply(ReplyVO vo) {
		dao.create(vo);
		
	}

	public List<ReplyVO> listReply(int bseq) {
		
		return dao.list(bseq);
	}

	public void modifyReply(ReplyVO vo) {
		dao.update(vo);
		
	}

	public void removeReply(int rseq) {
		dao.delete(rseq);
		
	}
	
	//paging
	public List<ReplyVO> listReplyPage(int bseq, Paging cri){
		return dao.listPage(bseq, cri);
	}
	public int count(int bseq) {
		return dao.count(bseq);
	}

}
