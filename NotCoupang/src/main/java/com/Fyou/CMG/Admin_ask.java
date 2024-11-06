package com.Fyou.CMG;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AskVO;

public class Admin_ask implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		String page = req.getParameter("page");
		page = (page == null) ? "1" : page;
		
		AnswerService asvc = new AnswerServiceImpl();
		List<AskVO> list = asvc.selectAskSellerlist(LOGID);
		
		req.setAttribute("askList", list);
		req.setAttribute("page", page);
		
		
		req.getRequestDispatcher("CMG/Admin_ask.jsp").forward(req, resp);
	}

}
