package com.spring.example.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.example.vo.UserVO;

@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public UserVO login(UserVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.getNick());
		vo = sqlSession.selectOne("userMapper.selectUser", vo);
		return vo;
		
		
		
	}
	
	
	

}
