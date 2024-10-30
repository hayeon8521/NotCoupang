package com.Fyou.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;

public class test2 implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// BuyerTM/프론트컨트롤선언파일명.tiles
		// BuyerTM/test2.do => BuyerTM/test2.tiles
		
		//헤드만 필요한 페이지 호출할때 (BuyerTM)
		//req.getRequestDispatcher("BuyerTM/test2.tiles").forward(req, resp);
		
		//해드와 사이드바가 필요할때 (BuyerTAM)
		//req.getRequestDispatcher("BuyerTAM/test2.tiles").forward(req, resp);
		
		//관리자 페잊지
		req.getRequestDispatcher("sellerAM/test2.tiles").forward(req, resp);
	}

}
