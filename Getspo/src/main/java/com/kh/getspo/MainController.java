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
   
   
   
}
