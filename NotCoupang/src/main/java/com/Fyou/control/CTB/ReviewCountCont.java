package com.Fyou.control.CTB;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ReviewCountCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gno = req.getParameter("gno");
		
		//상품 리뷰 총개수 가져오기
		ReviewService rsvc = new ReviewServiceImpl();
		int result = rsvc.totalReview(Integer.parseInt(gno));
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		resp.getWriter().print(json);
	}

}
