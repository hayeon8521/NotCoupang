package com.Fyou.control.CTB;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AskVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SendQuestionCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gno = req.getParameter("gno");
		String logid = req.getParameter("logId");
		String question = req.getParameter("qcontent");
		System.out.println("서버에서 받은 값: " + question);
		AskVO ask = new AskVO();
		ask.setBuyerId(logid);
		ask.setGoodsNum(Integer.parseInt(gno));
		ask.setAsk(question);
		
		AnswerService svc = new AnswerServiceImpl();
		
		Map<String, String> result = new HashMap<>();
		
		try {
			svc.insertAsk(ask);
			result.put("retCode", "OK");
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("retCode", "FAIL");
			
		}	
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		resp.getWriter().print(json);
	}

}
