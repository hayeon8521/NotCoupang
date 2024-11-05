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
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.Fyou.vo.ReviewVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class InsertReviewCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 리뷰내역 추가하는 곳~~
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");

		String goodsNum = req.getParameter("goodsNum");
		String message = req.getParameter("message");
		 message = URLDecoder.decode(message, "UTF-8");

		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");

		//System.out.println(goodsNum);
		//System.out.println(message);
		//System.out.println("리뷰 추가하고싶어");
		
		Map<String, Object> result = new HashMap<>();
		
		ReviewVO rvo = new ReviewVO(); 
		//서비스 먼저
		ReviewService rsvc = new ReviewServiceImpl();
		rvo.setGoodsNum(Integer.parseInt(goodsNum));
		rvo.setReview(message);
		rvo.setBuyerId(LOGID);
		ReviewVO vor = rsvc.reviewOne(rvo); //쿼리실행한 결과값을 새로운 객체에 담아줌
		
		//System.out.println(vor); //작성된 리뷰가 없어서 객체가 null로 나옴
		
		if(vor == null) {
			System.out.println("리뷰 작성 가능");
			if(rsvc.addReview(rvo)) {
				result.put("retCode", "OK");
				System.out.println("리뷰 등록 성공");
			} else {
				result.put("retCode", "FAIL");
				System.out.println("리뷰 등록 실패");
			}
		}else {
			result.put("retCode", "OVERLAP");
			System.out.println("등록된 리뷰가 이미 있습니다");
		}
		
		// 화면에 결과출력
				Gson gson = new GsonBuilder().create();
				resp.getWriter().print(gson.toJson(result));
		
	}

}
