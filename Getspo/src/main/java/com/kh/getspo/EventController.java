package com.kh.getspo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EventDAO;
import util.Common;
import util.Paging;


@Controller
public class EventController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@Autowired
	EventDAO event_dao;
	
	public EventController(EventDAO event_dao) {
		this.event_dao = event_dao;	
	}
	
	//이벤트 리스트
	@RequestMapping("/event_list.do")
	public String event_list(Model model, String page) {
	    int nowPage = 1;
	    if (page != null && !page.isEmpty()) {
	        nowPage = Integer.parseInt(page);
	    }
	    // 한 페이지당 게시물 수
	    int rowTotal = 12; // 전체 게시글 수
	    int totalPage = (int) Math.ceil((double) rowTotal / Common.Board.BLOCKLIST); // 전체 페이지 수 계산

	    // 시작과 끝 인덱스 계산
	    int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
	    int end =  Math.min(start + Common.Board.BLOCKLIST - 1, rowTotal); // 끝 인덱스를 전체 게시글 수를 넘지 않도록 조정

	    // 가상의 이벤트 데이터를 생성
	    List<Map<String, Object>> events = new ArrayList();
	    for (int i = start; i <= end; i++) {
	        Map<String, Object> event = new HashMap();
	        event.put("link", "https://event-us.kr/chowon/event/86283?utm_source=eventus&amp;utm_medium=organic&amp;utm_campaign=search-result");
	        event.put("imgSrc", "https://eventusstorage.blob.core.windows.net/evs/Image/chowon/86283/ProjectInfo/Cover/36da934c25b9494d8e8f8766834dac79.png");
	        event.put("alt", "[크리스천 토크콘서트] 7월 초원의밤 with 염미솔, 반승환 : 크리스천의 재정관");
	        event.put("openDay", "07월19일(금)");
	        event.put("location", "마포구");
	        event.put("title", "[크리스천 토크콘서트] 7월 초원의밤 with 염미솔, 반승환 : 크리스천의 재정관");
	        event.put("price", "15,000원~");
	        event.put("viewCount", "2,286");
	        events.add(event);
	    }

	    int row_total = 12; // 전체 이벤트 수 (가상의 값)
	    // 페이징 처리 문자열 생성
	    String pageMenu = Paging.getPaging("event_list.do", nowPage, row_total, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);

	    // 모델에 데이터 추가
	    model.addAttribute("events", events);
	    model.addAttribute("totalEvent", row_total);
	    model.addAttribute("pageMenu", pageMenu);
	    model.addAttribute("nowPage", nowPage); // 현재 페이지 번호 추가

	    // JSP 페이지로 포워딩
	    return Common.Event.VIEW_PATH + "event_list.jsp";
	}
	

 	//이벤트디테일 페이지
 	@RequestMapping("/event_detail.do")
 	public String eventDetail() {
 	    return Common.Event.VIEW_PATH + "event_detail.jsp";
 	}	

 	//이벤트개설 폼
 	@RequestMapping("/event_new.do")
 	public String event_form() {
 		return Common.Event.VIEW_PATH + "event_new.jsp";
 	}	


}
