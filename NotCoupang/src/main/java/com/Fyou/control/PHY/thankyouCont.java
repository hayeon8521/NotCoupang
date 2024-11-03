package com.Fyou.control.PHY;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;

public class thankyouCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		
		String hiddenGoods = req.getParameter("hiddenGoods");
		if(hiddenGoods != null && hiddenGoods.endsWith("_")) {
			hiddenGoods = hiddenGoods.substring(0, hiddenGoods.length() - 1);
		}
		
		System.out.println(hiddenGoods);
		String[] parts = hiddenGoods.split("_");
		for(int i=0; i<parts.length; i++) {
			//장바구니정보가져오기
			//해당정보 구매기록 남기기
			//장바구니삭제
		}
		
		req.getRequestDispatcher("BuyerTM/thank-youPHY.tiles").forward(req, resp);
	}
}