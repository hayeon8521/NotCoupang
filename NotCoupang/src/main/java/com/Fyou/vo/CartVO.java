package com.Fyou.vo;

import lombok.Data;

@Data
public class CartVO {

	private int seqCart; //장바구니 번호
	private int goodsNum; //상품 번호
	private String memberId; //회원 아이디
	private int count; //수량
	private String cartDate; //담은날짜
}

//생성자
