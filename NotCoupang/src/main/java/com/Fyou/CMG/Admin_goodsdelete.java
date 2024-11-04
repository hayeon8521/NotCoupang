package com.Fyou.CMG;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;

public class Admin_goodsdelete implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq_goods = Integer.parseInt(req.getParameter("seq_goods"));
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		gsvc.goodsdelete(seq_goods);
		
		req.getRequestDispatcher("Admin_list.do").forward(req, resp);
	}

}
