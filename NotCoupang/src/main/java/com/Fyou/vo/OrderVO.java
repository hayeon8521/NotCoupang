package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private String buyerId;
	private int goodsNum;
	private int count;
	private int price;
	private Date orderDate;
	
	//주문번호 추가
	private int seqOrder;
}
