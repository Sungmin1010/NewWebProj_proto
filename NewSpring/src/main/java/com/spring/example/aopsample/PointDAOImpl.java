package com.spring.example.aopsample;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAOImpl implements PointDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void updatePoint(String uid, int point) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("point", point);
		
		sqlSession.update("messageMapper.updatePoint", paramMap);
	}

}
