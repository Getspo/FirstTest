package com.kh.getspo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CategoryDAO;
import dao.EventDAO;
import dao.UserDAO;
import util.Common;


@Controller
public class MainController {
	@Autowired
	UserDAO user_dao;
	@Autowired
	EventDAO event_dao;
	@Autowired
	CategoryDAO category_dao;
	
	public MainController(UserDAO user_dao, EventDAO event_dao, CategoryDAO category_dao) {
		this.user_dao = user_dao;
		this.event_dao = event_dao;
		this.category_dao = category_dao;
	}
     
   //메인페이지
   @RequestMapping(value={"/", "main.do"})
      public String Main() {
         return Common.Main.VIEW_PATH + "main.jsp";
   }
   
   //호스트페이지
 	@RequestMapping("/hostMain.do")
 	public String hostMain() {
 	    return Common.Host.VIEW_PATH + "host.jsp";
 	}
 	
	
    //호스트이벤트관리
  	@RequestMapping("/host_event_management.do")
  	public String host_event_management() {
  	    return Common.Host.VIEW_PATH + "host_event_management.jsp";
  	}
  	
    //호스트이벤트수정
  	@RequestMapping("/host_event_modify.do")
  	public String host_event_modify() {
  	    return Common.Host.VIEW_PATH + "host_event_modify.jsp";
  	}
 		
 		
 	
   
 	
 	//마이페이지이동
 	@RequestMapping("/mypageform.do")
 	public String mypage_form() {
 		return Common.Mypage.VIEW_PATH + "mypage.jsp";
 	}
 	
   
}
