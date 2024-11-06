package com.Fyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Fyou.vo.ReviewVO;

public interface ReviewMapper {
	
	//모든 리뷰
	public List<ReviewVO> reviews();
	
	//총 리뷰 개수
	public int totalReview(@Param("gno")int gno);
	
	//해당 상품번호에 해당하는 리뷰 리스트
	public List<ReviewVO> selectReview(@Param("gno")int gno, @Param("page")int page);
	
	//리뷰 입력
	public int insertReview(ReviewVO review);
	
	//리뷰 삭제
	public int deleteReview(String buyerId);
	
	//리뷰 업데이트
	public int updateReview(ReviewVO review);

	//구매자가 전체리뷰를 봄
	public List<ReviewVO> memberReview(String buyerId);
	
	
	
	
	//회원아이디와 상품번호로 리뷰내역 조회
	public ReviewVO reviewOne(ReviewVO review);
	
	
}