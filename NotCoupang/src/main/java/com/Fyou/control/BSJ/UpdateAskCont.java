package com.Fyou.control.BSJ;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class UpdateAskCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 문의번호랑 재문의내용 가져오기
		int askNum = Integer.parseInt(req.getParameter("askNum"));
		String updatedContent = req.getParameter("updatedContent");
		System.out.println(askNum);
		System.out.println(askNum);
		System.out.println(updatedContent);
		System.out.println(updatedContent);
		
		Map<String, Object> result = new HashMap<>();
		
		AnswerService asvc = new AnswerServiceImpl();
		if (asvc.updateAsk(updatedContent ,askNum)) {
			result.put("retCode","OK");
			System.out.println("재문의 성공");
		} else {
			result.put("retCode","FAIL");
			System.out.println("재문의 실패");
		}
		
		System.out.println(result.toString());
		
		//화면에 결과출력
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));
		

	}

}
