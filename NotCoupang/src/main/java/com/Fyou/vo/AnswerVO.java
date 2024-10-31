package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private int seqAnswer;
	private int askNum;
	private String answer;
	private String sellerId;
	private Date answerDate;
}
