package com.Fyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Fyou.vo.MemberVO;


public interface MemberMapper {
	//멤버리스트 출력(사용할일 없을 예정)
	public List<MemberVO> members();
	//멤버 정보 조회
	public MemberVO selectMember(String member_id);
	//회원 가입
	public int insertMember(MemberVO member);
	//회원정보 수정
	public int updateMember(MemberVO member);
	//회원 탈퇴 (미구현)
	public int deleteMember(String memberId);
	//로그인
	//어노테이션으로 param을 사용함으로써 맵퍼xml에서 데이터 받을때 순서 상관없이 매핑되어 받을수 있게함!!
	public MemberVO loginMember(@Param("id") String id, @Param("pw") String pw);
}
