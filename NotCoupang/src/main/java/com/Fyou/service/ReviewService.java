package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.ReviewVO;

public interface ReviewService {
	
	//해당 상품번호에 해당하는 리뷰 리스트 (테스트 완료)
	public List<ReviewVO> reviews(int goodsNum, int page);
	
	//상품 리뷰 총개수
	public int totalReview(int gno);
	
	//멤버별 리뷰 리스트
	public List<ReviewVO> memberReview(String buyerId);
	
	//리뷰 입력 (테스트 완료)
	public boolean addReview(ReviewVO review);
	
	//리뷰 삭제 (테스트 완료)
	public boolean removeReview(String buyerId);
	
	//리뷰 업데이트 (테스트 완료)
	public boolean modifyReview(ReviewVO review);
	
	
	
	//리뷰 조회(구매자, 상품번호로 조회)
	public ReviewVO reviewOne(ReviewVO review);
	
	//리뷰 삭제(리뷰번호로 삭제/마이페이지)
	public boolean removeMyReview(int seqReview);
	
}
