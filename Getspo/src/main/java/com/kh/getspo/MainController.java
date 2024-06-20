package com.kh.getspo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CategoryDAO;
import dao.EventDAO;
import dao.UserDAO;
import service.MailSendService;
import util.Common;
import util.Paging;
import vo.UserVO;

@Controller
public class MainController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	MailSendService mss;
	
	EventDAO event_dao;
	CategoryDAO category_dao;
	UserDAO user_dao;
	
	public MainController(EventDAO event_dao, CategoryDAO category_dao, MailSendService mss, UserDAO user_dao) {
		this.event_dao = event_dao;
		this.category_dao = category_dao;
		this.mss = mss;
		this.user_dao = user_dao;
	}
	
	@RequestMapping(value={"/", "main.do"})
	   public String Main() {
	      return Common.Main.VIEW_PATH + "main.jsp";
	}
	
	@RequestMapping("/signinform.do")
	   public String sign_form() {
	      return Common.Main.VIEW_PATH + "signinform.jsp";
	}
	
	//회원가입폼
	@RequestMapping("/signupform.do")
	  public String signUpForm() {
	      return Common.Main.VIEW_PATH + "signupform.jsp";
	   }
	
	//Ajax로 요청받은 인증처리 메서드
	@RequestMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("인증요청 받음 : " + email);
		String res = mss.joinEmail(email);
		return res;
	}
	
	
	//이메일중복체크
	
	 @RequestMapping("checkDuplicate.do")
	 @ResponseBody 
	 public String dualmail(String email) {
		 System.out.println("email: " + email);
		 String result = user_dao.selectemail(email);
		 String res = "";
		 if (result != null) {
	            res = "true"; // 이메일이 이미 존재할 경우
	        } else {
	        	res = "false"; // 이메일이 존재하지 않을 경우
	        }
		 return res;
	 }
	 
	
	//회원가입
	@RequestMapping("signupInsert.do")
	public String signupInsert(UserVO vo) {
		System.out.println("e:"+ vo.getEmail());
		user_dao.userInsert(vo);
		return "redirect:main.do";
	}
	

	
	
	
	
	
}







