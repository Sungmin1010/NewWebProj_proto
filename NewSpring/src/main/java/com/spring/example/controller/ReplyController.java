package com.spring.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.example.biz.ReplyBiz;
import com.spring.example.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	private ReplyBiz biz;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			biz.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{bseq}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bseq") int bseq){
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(biz.listReply(bseq), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	@RequestMapping(value="/{rseq}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rseq") int rseq, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setRseq(rseq);
			biz.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/{rseq}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rseq") int rseq){
		ResponseEntity<String> entity = null;
		try {
			biz.removeReply(rseq);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

}
