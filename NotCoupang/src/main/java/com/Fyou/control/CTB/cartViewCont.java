package com.Fyou.control.CTB;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;
import com.Fyou.vo.CartVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class cartViewCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//addreplycont참고
		//파라미터 가져오기
		String logid = req.getParameter("logid");
		String gno = req.getParameter("gno");
		String count = req.getParameter("count");
		
		System.out.println(logid +"/" + gno +"/" + count);
		//상품번호, 회원아이다, 수량
		//서비스 호출 + 객체 만들어서 해당 메소드에 집어넣기
		CartService svc = new CartServiceImpl();
		
		CartVO cart = new CartVO();
		cart.setMemberId(logid);
		cart.setGoodsNum(Integer.parseInt(gno));
		cart.setCount(Integer.parseInt(count));
		
		Map<String, String> result = new HashMap<>();
		
		try {
			svc.insertCart(cart);
			result.put("retCode", "OK");
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("retCode", "FAIL");
			
		}
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));
		
		//반환값 가져와야함. 제이슨 문자열로 OK, FAIL만들고 넘기기
	}

}
