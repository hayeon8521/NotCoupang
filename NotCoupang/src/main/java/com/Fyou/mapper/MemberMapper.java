package com.Fyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Fyou.vo.MemberVO;


public interface MemberMapper {
	//멤버 정보 조회 [완료]
	public MemberVO selectMember(String member_id);
	//회원 가입 [완료]
	public int insertMember(MemberVO member);
	//회원정보 수정 [완료]
	public int updateMember(MemberVO member);
	//로그인 [완료]
	public MemberVO loginMember(@Param("id") String id, @Param("pw") String pw);
	
	//멤버리스트 출력 <- 관리자가 없어 사용 안함
	public List<MemberVO> members();
	//회원 탈퇴 <- 탈퇴기능 없어 사용 안함
	public int deleteMember(String memberId);
}
