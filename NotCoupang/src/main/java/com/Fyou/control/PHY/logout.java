package com.Fyou.control.PHY;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;

public class logout implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 삭제
		HttpSession session = req.getSession();
		session.invalidate();

		try {
			Thread.sleep(100);
			resp.sendRedirect("login.do");
			//req.getRequestDispatcher("BuyerTM/loginFormPHY.tiles").forward(req, resp);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}
}