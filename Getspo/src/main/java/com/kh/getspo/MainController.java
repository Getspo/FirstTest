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
import util.Common;
import util.Paging;

@Controller
public class MainController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	EventDAO event_dao;
	CategoryDAO category_dao;
	
	public MainController(EventDAO event_dao, CategoryDAO category_dao) {
		this.event_dao = event_dao;
		this.category_dao = category_dao;
	}
	
	@RequestMapping(value={"/", "main.do"})
	   public String Main() {
	      return Common.Main.VIEW_PATH + "main.jsp";
	}
	
}
