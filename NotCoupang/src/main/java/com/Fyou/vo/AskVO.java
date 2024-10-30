package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AskVO {
	private int seqAsk;
	private int goodsNum;
	private String ask;
	private String buyerId;
	private Date askDate;
}
