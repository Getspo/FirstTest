package com.kh.getspo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import service.MailSendService;
import util.Common;
import vo.UserVO;

@Controller
public class UserController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	MailSendService mss;

	@Autowired
	UserDAO user_dao;

	public UserController(MailSendService mss, UserDAO user_dao) {
		this.mss = mss;
		this.user_dao = user_dao;
	}

	// 로그인페이지이동
	@RequestMapping("/signinform.do")
	public String sign_form() {
		return Common.Sign.VIEW_PATH + "signinform.jsp";
	}

	// 비회원페이지이동
	@RequestMapping("/nonmemberconfirm.do")
	public String nonmem_form() {
		return Common.Sign.VIEW_PATH + "nonmembersignin.jsp";
	}

	// 회원가입폼
	@RequestMapping("/signupform.do")
	public String signUpForm() {
		return Common.Sign.VIEW_PATH + "signupform.jsp";
	}

	// 아이디 찾기 폼
	@RequestMapping("/forgotid.do")
	public String forgotId() {	
		return Common.Sign.VIEW_PATH + "forgotid.jsp";
	}
	
	// 아이디 찾기
	@RequestMapping("/findid.do")
	@ResponseBody
	public String forgotId(@RequestParam String name, @RequestParam String email) {
		UserVO vo = new UserVO();
		vo.setUser_name(name);
		vo.setUser_email(email);
		
		String result = "";
		String resultStr = "";
		
	    UserVO res = user_dao.findUserId(vo);
	    if (res == null) { // 이름이 없을 시
	        result = "no_name";
	        resultStr = String.format("[{\"result\":\"%s\"}]", result);
	    	return resultStr;
	    } else if (!res.getUser_email().equals(vo.getUser_email())) { // 이메일 틀릴 시
	        result = "no_email";
	        resultStr = String.format("[{\"result\":\"%s\"}]", result);
	    	return resultStr;
	    } else {	    	    
		    result = "clear";
		    resultStr = String.format("[{\"result\":\"%s\", \"user_id\":\"%s\"}]", result, res.getUser_id());
	    }
	  
	  
	    return resultStr;   
	}

	// 비밀번호 찾기 폼
	@RequestMapping("/forgotpassword.do")
	public String forgotPassword() {
		return Common.Sign.VIEW_PATH + "forgotpassword.jsp";
	}
	
	
	 // 비번재설정링크 이메일
	 @RequestMapping("/sendRestEmail.do")
	 @ResponseBody
	 public String sendResetEmail(@RequestParam String id, @RequestParam String name, @RequestParam String email){ 
		  UserVO vo = new UserVO();
		  vo.setUser_id(id);
		  vo.setUser_name(name);
		  vo.setUser_email(email);
		 
		  String result = "";
	
		  UserVO user = user_dao.findUser(vo);  		  
		  if (user == null) {
		        result = "no_user";
		    } else if (!user.getUser_email().equals(vo.getUser_email())) { // 이메일 틀릴시
		        result = "no_email";
		    } else if (!user.getUser_id().equals(vo.getUser_id())) { // 아이디 틀릴시
		        result = "no_id";
		    } else if (!user.getUser_name().equals(vo.getUser_name())) { // 이름 틀릴시
		        result = "no_name";
		    } else {
		        mss.resetPwdEmail(vo);
		        result = "clear";
		    }

		    String resultStr = String.format("[{\"result\":\"%s\"}]", result);
		    return resultStr;
		 
	}
	 
	  // 비번재설정 폼
	  @RequestMapping("/resetPwd_form.do")
	  public String resetPwd_form(@RequestParam("user_id") String userId, Model model) {
	      model.addAttribute("user_id", userId);
	      return Common.Sign.VIEW_PATH + "resetpassword.jsp";
	  }	 
	 

	// Ajax로 요청받은 인증처리 메서드
	@RequestMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("인증요청 받음 : " + email);
		String res = mss.joinEmail(email);
		return res;
	}

	// 아이디중복체크
	@RequestMapping("checkDuplicate.do")
	@ResponseBody
	public String dualid(String id) {
		System.out.println("id: " + id);
		String result = user_dao.selectId(id);
		String res = "";
		if (result != null) {
			res = "true"; // 아이디가 이미 존재할 경우
		} else {
			res = "false"; // 아이디가 존재하지 않을 경우
		}
		return res;
	}
	

	// 회원가입
	@RequestMapping("signupInsert.do")
	public String signupInsert(UserVO vo) {
		user_dao.userInsert(vo);
		return "redirect:signinform.do";
	}

	// 로그인
	@RequestMapping("/login.do")
	@ResponseBody
	public String loginUser(@RequestParam String id, @RequestParam String pwd) {
		UserVO vo = new UserVO();
		vo.setUser_id(id);
		vo.setUser_pwd(pwd);

		UserVO user = user_dao.userlogin(vo);

		String res = "";

		// 아이디가 없을 시
		if (user == null) {
			res = "no_id";
			return res;
		}
		// 비밀번호가 틀릴 시
		if (!user.getUser_pwd().equals(pwd)) {
			res = "no_pwd";
			return res;
		}

		// 아이디와 비밀번호가 문제 없다면 세션에 vo객체 저장
		// 로그인 성공 시 세션에 사용자 정보 저장
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		// 로그인 성공
		res = "clear";
		return res;

	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String userlogout() {
		session.removeAttribute("user");
		return "redirect:main.do";
	}

}
