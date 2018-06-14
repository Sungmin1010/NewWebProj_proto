package com.spring.example.aopsample;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void create(MessageVO vo) throws Exception {
		sqlSession.insert("messageMapper.create", vo);

	}

	@Override
	public MessageVO readMessage(int mid) throws Exception {
		
		return sqlSession.selectOne("messageMapper.readMessage", mid);
	}

	@Override
	public void updateState(int mid) throws Exception {
		sqlSession.update("messageMapper.updateState", mid);

	}

}
