package com.Fyou.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class MyReviewDelCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
        System.out.println(reviewNum);
        
        Map<String, Object> result = new HashMap<>();
        
        ReviewService rsvc = new ReviewServiceImpl();
        
        if(rsvc.removeMyReview(reviewNum)){	
			result.put("retCode","OK");
			System.out.println("내 리뷰 삭제 성공");
		} else {
			result.put("retCode","FAIL");
			System.out.println("내 리뷰 삭제 실패");
		}
        
      //화면에 결과출력
      		Gson gson = new GsonBuilder().create();
      		resp.getWriter().print(gson.toJson(result));
        
	}

}
