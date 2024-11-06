package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.OrderVO;

public interface OrderService {
	//구매자 구매내역 조회
	public List<OrderVO> selectOrder(String buyer_id);
	//구매 내역 추가
	public int insertOrder(OrderVO order);
	
	//삭제
	public int deleteOrder(OrderVO order);
	//수정
	public int updateOrder(OrderVO order);
	
	public List<OrderVO> selectSellerOrder(String seller_id);
}
