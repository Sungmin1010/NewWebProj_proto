package com.spring.example;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.example.biz.UserBiz;
import com.spring.example.util.MediaUtils;
import com.spring.example.util.UploadFileUtils;
import com.spring.example.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;

	
	@Autowired
	private UserBiz biz;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.warn("this is warn");
		logger.error("this is error");
		logger.debug("this is debug");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		if(session.getAttribute("userInfo") != null) {
			logger.info("you are already have userInfo");
			session.removeAttribute("userInfo");
		}
		
		String formattedDate = dateFormat.format(date);
		logger.debug("인터셉터 테스트");
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, HttpServletResponse resp) {
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
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String memberHome(HttpSession session) {
		logger.info("Member Home {}",session.getAttribute("userInfo"));
		if(session.getAttribute("userInfo") != null) {
			return "memberHome";
		}else {
			return "home";
		}
	}
	
	//file upload controller
	@RequestMapping(value="/user/edit", method=RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		
		//String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName",savedName);
		
		return "uploadResult";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(
										uploadPath, 
										file.getOriginalFilename(), 
										file.getBytes())
				, HttpStatus.CREATED);
		
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_"+originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
				
	}
	
		//show or download file 
	@ResponseBody
	@RequestMapping("/user/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME : " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);
			
			//step: change HttpHeader ContentType
			if(mType != null) {
				//image file(show image)
				headers.setContentType(mType);
			}else {
				//another format file(download file)
				fileName = fileName.substring(fileName.indexOf("_")+1);//original file Name
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\""); 
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
			return entity;
		
	}
	
		//delete File
	@ResponseBody
	@RequestMapping(value="/user/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: " + fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) {
			String front = fileName.substring(0, 12);  //file directory
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping(value="/user/edit", method=RequestMethod.GET)
	public String uploadForm() {
		return "editProfileImg";
	}
	
	
}
