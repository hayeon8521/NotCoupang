package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.ReviewVO;

public interface ReviewMapper {
	
	//모든 리뷰
	public List<ReviewVO> reviews();
	
	//해당 상품번호에 해당하는 리뷰 리스트
	public List<ReviewVO> selectReview(int goodsNum);
	
	//리뷰 입력
	public int insertReview(ReviewVO review);
	
	//리뷰 삭제
	public int deleteReview(String buyerId);
	
	//리뷰 업데이트
	public int updateReview(ReviewVO review);
	
}
