package com.spring.example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckIntercepter extends HandlerInterceptorAdapter{
	
	protected Logger log = LoggerFactory.getLogger(SessionCheckIntercepter.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(log.isDebugEnabled()) {
			log.debug("================  STOP  ");
		}
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("니야아아아");
		if(log.isDebugEnabled()) {
			log.debug("================  START  ");
		}
		return super.preHandle(request, response, handler);
	}
	
	

}
