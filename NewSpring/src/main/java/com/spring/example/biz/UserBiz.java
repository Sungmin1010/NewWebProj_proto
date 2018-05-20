package com.spring.example.biz;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.dao.UserDao;
import com.spring.example.vo.userVO;

@Service
public class UserBiz {
	
	@Autowired
	private UserDao dao;
	
	public int login(userVO vo, HttpSession session) {
		int res;
		userVO dbUserInfo = dao.login(vo);
		if(vo.getPwd().equals(dbUserInfo.getPwd())) {
			//correct pwd
			session.setAttribute("userInfo", dbUserInfo);
			res = 1;
		}else {
			//incorrect pwd
			res = 0;
		}
		return res;
	}
	

	
	
}
