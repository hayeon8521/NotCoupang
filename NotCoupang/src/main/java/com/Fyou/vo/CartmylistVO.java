package com.Fyou.vo;

import lombok.Data;

@Data
public class CartmylistVO {
	//★★ 장바구니 페이지에서 최종 가공된 정보를이 담기는 객체
	private int seqCart;      //장바구니번호
	private int goodsNum;	//상품번호
	private String memberId;	//사용자ID
	private int cartCount; 		  //장바구니에 담은 재고
	private String goodsName;	//상품 제목
	private int goodsPrice;		//현재상품가격
	private int goodsInven;		//상품 현재 재고(총재고)
	private String imgUrl;		//상품 썸네일
	
	// 모든 필드를 받는 생성자 추가
    public CartmylistVO(int seqCart, int goodsNum, String memberId, int cartCount, String goodsName, int goodsPrice, int goodsInven, String imgUrl) {
        this.seqCart = seqCart;
        this.goodsNum = goodsNum;
        this.memberId = memberId;
        this.cartCount = cartCount;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsInven = goodsInven;
        this.imgUrl = imgUrl;
    }
}
