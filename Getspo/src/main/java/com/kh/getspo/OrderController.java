package com.kh.getspo;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.OrderDAO;
import vo.OrderVO;
import vo.PayVO;

@Controller
public class OrderController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;

	@Autowired
	OrderDAO order_dao;

	public OrderController(OrderDAO order_dao) {
		this.order_dao = order_dao;
	}

	// 이벤트 신청
	@RequestMapping("/order.do")
	public String orderEvent(OrderVO user, Model model) {
		order_dao.orderevent(user);
		
		model.addAttribute("user", user);
		return "mypageform.do";

	}

	// 결제처리
	@RequestMapping("/payment.do")
	@ResponseBody
	public String processPayment(
	    @RequestParam("imp_uid") String impUid,
	    @RequestParam("merchant_uid") String merchantUid,
	    @RequestParam("paid_amount") int paidAmount,
	    @RequestParam("apply_num") String applyNum,
	    @RequestParam("user_idx") int userIdx) {

	    PayVO pay = new PayVO();
	    pay.setImp_uid(impUid);
	    pay.setMerchant_uid(merchantUid);
	    pay.setPay_price(paidAmount);
	    pay.setApply_num(applyNum);
	    pay.setUser_idx(userIdx);
	    pay.setOrder_idx((Integer) null); // order_idx를 null로 설정
	    
	    order_dao.savePay(pay);

	    return "success";
	}
	
	//결제성공후 orderDB저장
	@RequestMapping("/payafter.do")
	public String payAfterOrder(
	    @RequestParam("user_idx") int userIdx,
	    @RequestParam("event_idx") int eventIdx,
	    @RequestParam("order_name") String orderName,
	    @RequestParam("order_tel") String orderTel,
	    @RequestParam("order_email") String orderEmail,
	    @RequestParam("order_addr") String orderAddr,
	    @RequestParam("order_gen") String orderGen,
	    @RequestParam("order_age") int orderAge,
	    @RequestParam("imp_uid") String impUid) {

	    OrderVO order = new OrderVO();
	    order.setUser_idx(userIdx);
	    order.setEvent_idx(eventIdx);
	    order.setOrder_name(orderName);
	    order.setOrder_tel(orderTel);
	    order.setOrder_email(orderEmail);
	    order.setOrder_addr(orderAddr);
	    order.setOrder_gen(orderGen);
	    order.setOrder_age(orderAge);

	    order_dao.orderevent(order);

	    int orderIdx = order.getOrder_idx();

	    // 결제 정보 업데이트
	    order_dao.updatePayOrderIdx(impUid, orderIdx);

	    return "mypageform.do";
	}

}
