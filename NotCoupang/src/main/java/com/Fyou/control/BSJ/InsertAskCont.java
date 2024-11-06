package com.Fyou.control.BSJ;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AskVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class InsertAskCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
	
		// 문의 내역 추가 (상품번호, 문의내역)을 파라미터로
		String goodsNum = req.getParameter("goodsNum");
		String message = req.getParameter("message");
		 message = URLDecoder.decode(message, "UTF-8");

		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");

		// System.out.println(goodsNum);
		// System.out.println(message);
		// System.out.println("문의내역 추가하고싶어");

		Map<String, Object> result = new HashMap<>();

		AnswerService asvc = new AnswerServiceImpl();
		AskVO avo = new AskVO();
		avo.setBuyerId(LOGID);
		avo.setGoodsNum(Integer.parseInt(goodsNum));
		avo.setAsk(message);
		

		if (asvc.insertAsk(avo)) {
			result.put("retCode", "OK");
			System.out.println("문의 등록 성공");
		} else {
			result.put("retCode", "FAIL");
			System.out.println("문의 등록 실패");
		}

		// 화면에 결과출력
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

	}

}
