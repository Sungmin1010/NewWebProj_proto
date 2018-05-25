package com.spring.example.biz;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.example.dao.UserDao;
import com.spring.example.vo.UserVO;

@Service
public class UserBiz {
	
	@Autowired
	private UserDao dao;
	
	public int login(UserVO vo, HttpSession session) {
		int res;
		UserVO dbUserInfo = dao.login(vo);
		try {
			
			if(vo.getPwd().equals(dbUserInfo.getPwd())) {
				//correct pwd
				System.out.println(dbUserInfo);
				session.setAttribute("userInfo", dbUserInfo);
				res = 1;
			}else {
				//incorrect pwd
				res = 0;
			}
			
		}catch(NullPointerException e) {
			res=0;
		}
		
		return res;
	}
	

	
	
}
