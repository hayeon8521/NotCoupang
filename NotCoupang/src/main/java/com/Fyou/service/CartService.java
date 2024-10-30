package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.CartVO;

public interface CartService {
	//카트 조회
	List<CartVO> cartList();
	
	//카트 조회(로그인 id별)
	public List<CartVO> selectCart(String memberId);
	
	//카트 추가
	boolean insertCart(String memberId, int goodsNum);
	
	//카트 삭제

	boolean deleteCart(String memberId, int seqCart);

	boolean updateCart(CartVO cart);
	
	
}
