package com.Fyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Fyou.vo.CartVO;

public interface CartMapper {
	// 카트리스트 출력
	public List<CartVO> cartList();

	// 카트 정보 조회
	public List<CartVO> selectCart(String memberId);

	// 카트 추가
	int insertCart(CartVO cart);

	// 카트 수정
	int updateCart(CartVO cart);

	// 카트 삭제
	int deleteCart(CartVO cart);
	
	//고객 아이디, 상품번호로 1건 정보 조회
	public CartVO selectOneCart(@Param("memberId") String memberId, @Param("goodsNum") int goodsNum);
}