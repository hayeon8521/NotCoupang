package com.Fyou.control.PHY;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;

public class cartViewCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		System.out.println("여긴 장바구니 페이");
		
		
		//req.getRequestDispatcher("OnlyBody/loginFormPHY.tiles").forward(req, resp);
		req.getRequestDispatcher("OnlyBody/cartViewPHY.tiles").forward(req, resp);

	}

}
