package com.Fyou.CMG;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AnswerVO;

public class Admin_answer_insert_control implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		int seq_ask = Integer.parseInt(req.getParameter("seq_ask"));
		String insert_ask = req.getParameter("insert_ask");
		AnswerVO asvo = new AnswerVO();
		asvo.setAnswer(insert_ask);
		asvo.setAskNum(seq_ask);
		asvo.setSellerId(LOGID);
		System.out.println(asvo.toString());
		
		AnswerService asvc = new AnswerServiceImpl();
		asvc.insertAnswer(asvo);
		
		req.getRequestDispatcher("Admin_ask.do").forward(req, resp);
	}

}
