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

public class MyReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 내 리뷰
		// 정상 구현 확인
		System.out.println("MyReviewControl");
		
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		
		ReviewService rsvc = new ReviewServiceImpl();
		rsvc.memberReview(LOGID);
		

		

		// 조회해서 어트리뷰트에 값담기
		// 내 리뷰 리스트 넘기기
		//req.setAttribute("memberReview", list);
		
		try {
			req.getRequestDispatcher("BuyerTM/myReviewBSJ.tiles").forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
