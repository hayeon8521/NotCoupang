package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNum;
	private int goodsNum;
	private String review;
	private String buyerId;
	private Date reviewDate;
}
