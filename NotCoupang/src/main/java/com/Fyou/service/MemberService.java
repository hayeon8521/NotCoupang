package com.Fyou.service;

import com.Fyou.vo.MemberVO;

public interface MemberService {
	//멤버 정보조회
	public MemberVO selectMember(String member_id);
	
	//회원 가입
	boolean addMember(MemberVO member);
	
	//회원 정보 변경
	boolean modifyMember(MemberVO member);
	
	//로그인
	MemberVO loginCheck(String id, String pw);
}