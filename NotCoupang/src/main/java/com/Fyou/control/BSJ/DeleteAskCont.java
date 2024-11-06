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

public class DeleteAskCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int askNum = Integer.parseInt(req.getParameter("askNum"));
		System.out.println(askNum);
		
		Map<String, Object> result = new HashMap<>();
		
		AnswerService asvc = new AnswerServiceImpl();
		if(asvc.deleteAsk(askNum)){	
			result.put("retCode","OK");
			System.out.println("내 문의 삭제 성공");
		} else {
			result.put("retCode","FAIL");
			System.out.println("내 문의 삭제 실패");
		}
        
      //화면에 결과출력
      		Gson gson = new GsonBuilder().create();
      		resp.getWriter().print(gson.toJson(result));
        
	}

}
		

