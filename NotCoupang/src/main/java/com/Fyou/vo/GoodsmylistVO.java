package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsmylistVO {
	private int seqGoods;
	private String goodsName;
	private int goodsPrice;
	private int goodsInven;
	private String goodsState;
	private String goodsMid;
	private String goodsCatename;
	private Date goodsMdate;
	private Date goodsRdate;
	private String imgUrl;
	
	 public GoodsmylistVO(int seqGoods, String goodsName, int goodsPrice, int goodsInven, 
             String goodsState, String goodsMid, String goodsCatename, 
             Date goodsMdate, Date goodsRdate, String imgUrl) {
	this.seqGoods = seqGoods;
	this.goodsName = goodsName;
	this.goodsPrice = goodsPrice;
	this.goodsInven = goodsInven;
	this.goodsState = goodsState;
	this.goodsMid = goodsMid;
	this.goodsCatename = goodsCatename;
	this.goodsMdate = goodsMdate;
	this.goodsRdate = goodsRdate;
	this.imgUrl = imgUrl;
	}
	
}
