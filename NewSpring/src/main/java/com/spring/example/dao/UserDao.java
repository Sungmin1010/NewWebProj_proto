package com.spring.example.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.example.vo.userVO;

@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public userVO login(userVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getNick());
		vo = sqlSession.selectOne("userMapper.selectUser", vo);
		return vo;
		
		
		
	}
	
	
	

}
