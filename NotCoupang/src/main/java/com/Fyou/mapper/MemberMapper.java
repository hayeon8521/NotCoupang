package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.MemberVO;


public interface MemberMapper {
	//멤버리스트 출력(사용할일 없을 예정)
	public List<MemberVO> members();
	//멤버 정보 조회
	public MemberVO selectMember(String member_id);
}
