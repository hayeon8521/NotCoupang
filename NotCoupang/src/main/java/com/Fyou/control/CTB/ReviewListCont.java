package com.Fyou.control.CTB;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.Fyou.vo.ReviewVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ReviewListCont implements Control {
	//작동 확인 완료
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String gno= req.getParameter("gno");
		String page= req.getParameter("page");
		
		//리뷰
		ReviewService rsvc = new ReviewServiceImpl();
		//리뷰 리스트 넘기기
		List<ReviewVO> reviews = rsvc.reviews(Integer.parseInt(gno), Integer.parseInt(page));
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(reviews);
		resp.getWriter().print(json);
	}

}
