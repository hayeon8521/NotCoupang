package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;
import com.Fyou.vo.CartVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class cartDeleteCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//http://localhost/NotCoupang/cartDelete.do?goodsNum=123
		String goodsNum = req.getParameter("goodsNum");
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		Map<String, Object> result = new HashMap<>();
		
		//겉멋 (원래는 없어도 DB가 많아서 나와야함)
		try {
			Thread.sleep(200);
		}catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		CartService svc = new CartServiceImpl();
		CartVO cart = new CartVO();
		cart.setGoodsNum(Integer.parseInt(goodsNum));
		cart.setMemberId(LOGID);
		
		if(svc.deleteCart(cart)) {
			result.put("retCode", "OK");
			System.out.println("성공");
		}else {
			result.put("retCode", "FAIL");
			System.out.println("실패");
		}
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

	}

}
