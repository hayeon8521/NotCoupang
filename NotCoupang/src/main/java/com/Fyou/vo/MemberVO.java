package com.Fyou.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	private String memberDivision;
	private Date memberDate;
}
