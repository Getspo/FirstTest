package com.kh.aop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.aop.service.TestService;

@Controller
public class TestController {
	
	TestService testService;
	
	//setter injection
	public void setTestService(TestService testService) {
		this.testService = testService;
	}
	
	@RequestMapping(value= {"/","/test.do"})
	public String test() {
		testService.test(); //디비 접근좀요
		return "/WEB-INF/views/test.jsp";
	}
}
