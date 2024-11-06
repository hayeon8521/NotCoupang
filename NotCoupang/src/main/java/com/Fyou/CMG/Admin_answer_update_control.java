package com.Fyou.CMG;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AnswerVO;

public class Admin_answer_update_control implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int seq_ask = Integer.parseInt(req.getParameter("seq_ask"));
		String insert_ask = req.getParameter("insert_ask");
		
		AnswerService asvc = new AnswerServiceImpl();
		asvc.updateAnswer(seq_ask, insert_ask);
		
		req.getRequestDispatcher("Admin_ask.do").forward(req, resp);

	}

}
