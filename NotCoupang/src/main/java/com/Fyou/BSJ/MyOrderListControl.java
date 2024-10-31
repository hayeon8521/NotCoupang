package com.Fyou.BSJ;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.Fyou.vo.OrderVO;

public class MyOrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정상 구현 확인
		System.out.println("MyOrderListControl");
		
		// 파라미터 선언
		// 검색조건 (1.파라미터 받기)
		String mid = req.getParameter("buyer_id");
		
		OrderService svc = new OrderServiceImpl();
		List<OrderVO> list = svc.selectOrder(mid);
		
		System.out.println(list.toString());
	
		//조회해서 어트리뷰트에 값담기
		//내 주문 리스트 넘기기
		req.setAttribute("selectOrder", list);
		
		
		try {
			req.getRequestDispatcher("BuyerTM/myOrderListBSJ.tiles").forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

