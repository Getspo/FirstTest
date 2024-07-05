package com.kh.getspo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import dao.EventDAO;
import util.Common;
import util.Paging;
import vo.EventVO;
import vo.UserVO;

@Controller
public class EventController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;

	@Autowired
	EventDAO event_dao;

	public EventController(EventDAO event_dao) {
		this.event_dao = event_dao;
	}
	
			

	//행사 전체보기
	@RequestMapping("/event_list.do")
	public String event_list(Model model, String page) {
		int nowPage = 1;
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		// 한 페이지당 게시물 수
		int rowTotal = event_dao.allevents().size(); // 전체 게시글 수
		int totalPage = (int) Math.ceil((double) rowTotal / Common.Board.BLOCKLIST); // 전체 페이지 수 계산

		// 시작과 끝 인덱스 계산
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = Math.min(start + Common.Board.BLOCKLIST - 1, rowTotal); // 끝 인덱스를 전체 게시글 수를 넘지 않도록 조정

		// 실제 이벤트 데이터를 생성
		// 전체 이벤트 목록에서 현재 페이지에 해당하는 데이터만 가져오기 위해 subList 사용
		List<EventVO> events = event_dao.allevents();

		// 페이징 처리 문자열 생성
		String pageMenu = Paging.getPaging("event_list.do", nowPage, rowTotal, Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE);

		// 모델에 데이터 추가
		model.addAttribute("events", events);
		model.addAttribute("totalEvent", rowTotal);// 전체 이벤트 수
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("nowPage", nowPage); // 현재 페이지 번호 추가

		// JSP 페이지로 포워딩
		return Common.Event.VIEW_PATH + "event_list.jsp";
	}

	//행사 상세보기 페이지
	@RequestMapping("/event_detail.do")
	public String eventDetail(@RequestParam("event_idx") int event_idx, Model model) {
		// 해당 이벤트정보 가져오기
		EventVO event = event_dao.eventByIdx(event_idx);

		// 이벤트에 신청된 수 계산
		int appliecount = event_dao.applieCount(event_idx);

		// 잔여 수량 계산
		int remainticket = event.getEvent_max_joiner() - appliecount;

		// 세션에서 조회한 이벤트 번호 목록 가져오기
		List<Integer> viewedEvents = null; // 세션에서 가져올 이벤트 번호 목록을 담을 변수 선언
		Object obj = session.getAttribute("viewedEvents"); // 세션에서 "viewedEvents"라는 이름으로 저장된 객체 가져오기
		if (obj instanceof List) { // 가져온 객체가 List<Integer> 타입인지 확인
			viewedEvents = (List<Integer>) obj; // 만약 List<Integer> 타입이면 캐스팅하여 변수에 할당
		}

		if (viewedEvents == null) { // 만약 세션에서 가져온 객체가 null이면 (세션에 "viewedEvents"가 없는 경우)
			viewedEvents = new ArrayList<>(); // 새로운 ArrayList<Integer> 객체를 생성하여 변수에 할당 (새로운 세션에 저장할 준비)
		}

		// 이벤트가 이미 조회되었는지 확인
		if (!viewedEvents.contains(event_idx)) { // 현재 조회하려는 이벤트 번호가 이미 세션에 있는지 확인
			// 조회수 증가
			event_dao.update_viewcount(event_idx); // 이벤트의 조회수를 증가시키는 메서드 호출
			// 조회한 이벤트 번호를 세션에 추가
			viewedEvents.add(event_idx); // 조회한 이벤트 번호를 세션에 추가
			session.setAttribute("viewedEvents", viewedEvents); // 업데이트된 조회 이벤트 목록을 세션에 다시 저장
		}

		// 바인딩
		model.addAttribute("event", event);
		model.addAttribute("remainticket", remainticket);

		return Common.Event.VIEW_PATH + "event_detail.jsp";
	}

	//행사 개설 페이지
	@RequestMapping("/event_new.do")
	public String event_form() {
		return Common.Event.VIEW_PATH + "event_new.jsp";
	}

	//행사 개설하기
	@RequestMapping("/event_insert.do")
	public String event_insert(@ModelAttribute EventVO vo,
			@RequestParam("start_date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
			@RequestParam("start_time") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime startTime,
			@RequestParam("end_date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
			@RequestParam("end_time") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime endTime,
			@RequestParam("apply_start_date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate applyStartDate,
			@RequestParam("apply_start_time") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime applyStartTime,
			@RequestParam("apply_end_date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate applyEndDate,
			@RequestParam("apply_end_time") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime applyEndTime,
			@RequestParam("event_content") String event_content) {

		try {
			UserVO user = (UserVO) session.getAttribute("user");
			if (user != null) {
				vo.setUser_idx(user.getUser_idx());

				// 이벤트 시작 종료 시간 설정
				LocalDateTime eventHStart = LocalDateTime.of(startDate, startTime);
				LocalDateTime eventHEnd = LocalDateTime.of(endDate, endTime);
				LocalDateTime eventRStart = LocalDateTime.of(applyStartDate, applyStartTime);
				LocalDateTime eventREnd = LocalDateTime.of(applyEndDate, applyEndTime);

				vo.setEvent_h_start(eventHStart);
				vo.setEvent_h_end(eventHEnd);
				vo.setEvent_r_start(eventRStart);
				vo.setEvent_r_end(eventREnd);
				vo.setEvent_content(event_content);

				// 파일업로드 경로설정
				String webPath = "/resources/upload/";
				// upload까지의 절대경로
				String savePath = app.getRealPath(webPath);
				System.out.println(savePath);

				// 업로드 된 파일 정보
				MultipartFile photo = vo.getPhoto();

				String filename = "no_file";
				if (photo != null && !photo.isEmpty()) {
					filename = photo.getOriginalFilename();

					// 파일을 저장할 경로 생성
					File saveFile = new File(savePath, filename);

					if (!saveFile.exists()) {
						saveFile.mkdirs();
					} else {
						// 동일파일명이 존재하는 경우 업로드 시간을 추가하여 중복을 방지
						long time = System.currentTimeMillis();
						filename = String.format("%d_%s", time, filename);
						saveFile = new File(savePath, filename);
					}

					try {
						photo.transferTo(saveFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

				vo.setEvent_thumbnail(filename);

				event_dao.eventInsert(vo);

				return "hostMain.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:hostMain.do";
	}
	
	//썸머노트
	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot + "resources/fileupload/";
		System.out.println("파일루트 경로: " + fileRoot);

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try (InputStream fileStream = multipartFile.getInputStream()) {
			// 파일 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", request.getContextPath() + "/resources/fileupload/" + savedFileName); 																								
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			// 저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject.toString();
	}

	//행사 신청하기
	@RequestMapping("/event_apply.do")
	public String event_apply() {
		return Common.Event.VIEW_PATH + "event_apply.jsp";
	}

}
