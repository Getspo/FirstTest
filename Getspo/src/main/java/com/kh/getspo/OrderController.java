package com.kh.getspo;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
      @RequestMapping("/orderevent.do")
      public String orderEventTwo(OrderVO user, Model model) {
         order_dao.orderevent(user);
         
         model.addAttribute("user", user);
         return "mypageform.do";

      }
      
      @RequestMapping(value = "/order.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
      @ResponseBody
      public String orderEvent(OrderVO order) {
          int res = order_dao.orderevent(order);
          String result = "no";
          if (res > 0) {
              String orderIdx = String.valueOf(order.getOrder_idx());
              result = orderIdx;
          }
          System.out.println("Order Event Response: " + result); // 추가된 로그
          return result;
      }

      @RequestMapping(value = "/payment.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
      @ResponseBody
      public String processPayment(
              @RequestParam("imp_uid") String impUid,
              @RequestParam("merchant_uid") String merchantUid,
              @RequestParam("paid_amount") int paidAmount,
              @RequestParam("apply_num") String applyNum,
              @RequestParam("user_idx") Integer userIdx,
              @RequestParam("order_idx") Integer orderIdx) {
         

          System.out.println("Received user_idx: " + userIdx); // 로그 추가
          System.out.println("Received order_idx: " + orderIdx); // 로그 추가

          PayVO pay = new PayVO();
          pay.setImp_uid(impUid);
          pay.setMerchant_uid(merchantUid);
          pay.setPay_price(paidAmount);
          pay.setApply_num(applyNum);
          pay.setUser_idx(userIdx);
          pay.setOrder_idx(orderIdx);

          try {
              order_dao.savePay(pay);
              System.out.println("Payment Processed Successfully"); // 추가된 로그
              return "success";
          } catch (Exception e) {
              e.printStackTrace();
              System.out.println("Payment Processing Failed: " + e.getMessage()); // 추가된 로그
              return "fail";
          }
      }


   
   

}
