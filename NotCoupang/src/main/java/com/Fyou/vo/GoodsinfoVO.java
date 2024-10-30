package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsinfoVO {
	private int seqGoods;
	private String goodsName;
	private int goodsPrice;
	private int goodsInven;
	private String goodsState;
	private String goodsMid;
	private String goodsCatename;
	private Date goodsMdate;
	private Date goodsRdate;
}
