package com.spring.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.example.biz.UserBiz;
import com.spring.example.vo.userVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserBiz biz;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/login.sp")
	public String login(userVO vo, HttpSession session, HttpServletResponse resp) {
		logger.info("Member Login !!!"+ vo);
		String view = null;
		int res = biz.login(vo, session);
		if(res==1) {
			view =  "memberHome";
		}else {
			resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
				out = resp.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
            out.println("<script>alert('로그인 실패 : 다시 시도해 주세요'); history.go(-1);</script>");
            out.flush();
			
			//view = "home";
		}
		
		return view;
	}
	
	@RequestMapping(value="/memberHome.sp")
	public String memberHome(HttpSession session) {
		logger.info("Member Home");
		if(session.getAttribute("userInfo") != null) {
			return "memberHome";
		}else {
			return "home";
		}
	}
}
