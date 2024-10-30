package com.Fyou.test;

import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.Fyou.vo.ReviewVO;

public class AppTest {
	public static void main(String[] args) {
		
		ReviewService svc = new ReviewServiceImpl();
		
		ReviewVO review = new ReviewVO();
		
//		review.setGoodsNum(1);
//		review.setReview("add Review CTB");
//		review.setBuyerId("testCTB");
//		
//		if(svc.addReview(review)) {
//			System.out.println("입력OK");
//		} else {
//			System.out.println("입력안됨");
//		}
		
//		if(svc.removeReview("testCTB")) {
//			System.out.println("삭제OK");
//		} else {
//			System.out.println("삭제안됨");
//		}
		
		review.setGoodsNum(1);
		review.setReview("Review CTB modify");
		review.setBuyerId("testCTB");
		
		if(svc.modifyReview(review)) {
			System.out.println("삭제OK");
		} else {
			System.out.println("삭제안됨");
		}
		
		System.out.println(svc.selectReview(1));
		
		
	}
}
