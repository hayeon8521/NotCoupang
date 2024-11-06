package com.Fyou.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class DelOrderCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 주문번호 받아서 주문목록 삭제하는 곳
		String orderNum = req.getParameter("orderNum");
		
		Map<String, Object> result = new HashMap<>();
		
		OrderService svc = new OrderServiceImpl();
		//OrderVO ovo = new OrderVO(); //화면에 출력시 객체 생성
		
		
		System.out.println(orderNum);
		
		if (svc.deleteOrderOne(Integer.parseInt(orderNum))) {  //삭제성공시
			result.put("retCode", "OK");
			System.out.println("주문 목록 삭제 성공");
		} else {
			result.put("retCode", "FAIL");
			System.out.println("주문 목록 삭제 실패");
		}

		// 화면에 결과출력
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

		

	}

}
