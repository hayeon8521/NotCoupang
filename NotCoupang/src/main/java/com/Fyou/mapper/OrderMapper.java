package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.OrderVO;
import com.Fyou.vo.SellerCateVO;

public interface OrderMapper {
	//전체 구매 내역 리스트
	public List<OrderVO> orderList();
	
	//해당하는 구매자의 구매 내역을 출력
	public List<OrderVO> selectOrder(String buyer_id);
	
	//구매자가 구매 시 구매 내역을 추가
	public int insertOrder(OrderVO order);
	
	//사용할지는 모르는 것들
	//삭제
	public int deleteOrder(OrderVO order);
	//수정(기준은 임의로 구매자 상품들 전체)
	public int updateOrder(OrderVO order);
	
	//주문번호로 내 주문 삭제(마이페이지용)
	public int deleteOrderOne(int seqOrder);
	
	//판매자 ID를 통한 판매 내역 전체 조회
	public List<OrderVO> selectSellerOrder(String seller_id);
	
	//판매자 ID를 통한 판매 내역 카테고리별 조회
	public List<SellerCateVO> selectSellerCate(String seller_id);
}
