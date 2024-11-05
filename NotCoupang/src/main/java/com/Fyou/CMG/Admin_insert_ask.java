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
import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public class Admin_insert_ask implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		int list_num = Integer.parseInt(req.getParameter("list_num"));
		AnswerService asvc = new AnswerServiceImpl();
		List<AskVO> list = asvc.selectAskSellerlist(LOGID);
		
		AskVO avo = list.get(list_num);
		System.out.println(avo.toString());
		req.setAttribute("avo", avo);
		AnswerVO asvo = asvc.selectAnswer(avo.getSeqAsk());
		req.setAttribute("asvo", asvo);
		
		req.getRequestDispatcher("CMG/Admin_ask_insert.jsp").forward(req, resp);
	}

}
