package com.spring.example.aopsample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private PointDAO pointDAO;
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MessageVO readMessage(String uid, int mid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
