package com.Fyou.control.BSJ;

import java.io.IOException;
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

public class MyReviewModifyCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String modifyText = req.getParameter("modifyText");
		int modGoodsNum = Integer.parseInt(req.getParameter("modGoodsNum"));
		int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));

		Map<String, Object> result = new HashMap<>();
		
		System.out.println(modifyText);
		System.out.println(modGoodsNum);
		
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");

		ReviewVO rvo = new ReviewVO(); 
		rvo.setGoodsNum(modGoodsNum);
		rvo.setReview(modifyText);
		rvo.setBuyerId(LOGID);
		rvo.setSeqReview(reviewNum);
		
		ReviewService rsvc = new ReviewServiceImpl();
		ReviewVO vor = rsvc.reviewOne(rvo);
		if(vor == null) {
			if(rsvc.addReview(rvo)){
				result.put("retCode","OK");
				System.out.println("리뷰 추가 성공");
			} else {
				result.put("retCode","FAIL");
				System.out.println("리뷰 추가 실패");
			}
			//화면에 결과출력
			Gson gson = new GsonBuilder().create();
			resp.getWriter().print(gson.toJson(result));
		}else{
			if(rsvc.modifyReview(rvo)){
				result.put("retCode","OK");
				System.out.println("리뷰 수정 성공");
			} else {
				result.put("retCode","FAIL");
				System.out.println("리뷰 수정 실패");
			}
			//화면에 결과출력
			Gson gson = new GsonBuilder().create();
			resp.getWriter().print(gson.toJson(result));
		}
		
		
	
		//화면에 결과출력
		//Gson gson = new GsonBuilder().create();
		//resp.getWriter().print(gson.toJson(result));
		
		
	}

}
