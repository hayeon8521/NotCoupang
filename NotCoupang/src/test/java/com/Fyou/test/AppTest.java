package com.Fyou.test;

import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;

public class AppTest {
	public static void main(String[] args) {
		
		CartService svc = new CartServiceImpl();
		
		String m_id = "hayeon";
		
<<<<<<< HEAD
		MemberVO member = new MemberVO();
		member.setMemberId("hayeon");
		member.setMemberPw("1234");
		member.setMemberNick("하욘");
		member.setMemberName("표하연");
		member.setMemberPhone("010-8521-6704");
		member.setMemberAddress("대구시 여러분 왕초입니다");
		member.setMemberDivision("buyer");
=======
>>>>>>> refs/heads/BSJ
		
<<<<<<< HEAD
		if(svc.addMember(member)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		MemberVO mb = svc.selectMember(m_id);
		
		System.out.println(mb.toString());
=======
		System.out.println("a");
>>>>>>> refs/heads/BSJ
	}
}
