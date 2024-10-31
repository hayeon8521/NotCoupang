package com.Fyou.control.goodsinfoCTB;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;

public class goodsinfoCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("BuyerTM/goodsinfoCTB.tiles").forward(req, resp);
		
	}

}
