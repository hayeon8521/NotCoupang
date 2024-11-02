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

public class cartViewCNTCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//상품정보, 재고수량을 가져와서 장바구니를 업데이트
		//http://localhost/NotCoupang/cartViewcount.do?goodsNum=12&thiscount=234
		//data: { goodsNum: parts[0], thiscount: thiscount },
		String goodsNum = req.getParameter("goodsNum");
		String count = req.getParameter("thiscount");
		int countInt = Integer.parseInt(count);
		String pm = req.getParameter("pm");
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		Map<String, Object> result = new HashMap<>();
		
		//겉멋 (원래는 없어도 DB가 많아서 나와야함)
		try {
			Thread.sleep(200);
		}catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		if(pm.equals("P")) {
			countInt = countInt+1;
		}else if(pm.equals("M")) {
			countInt = countInt-1;
		}
		
		CartService svc = new CartServiceImpl();
		CartVO cart = new CartVO();
		cart.setGoodsNum(Integer.parseInt(goodsNum));
		cart.setMemberId(LOGID);
		cart.setCount(countInt);
		
		if(svc.updateCart(cart)) {
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
