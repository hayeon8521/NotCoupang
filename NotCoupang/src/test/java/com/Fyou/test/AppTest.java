package com.Fyou.test;

import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;

public class AppTest {
	public static void main(String[] args) {
		
		MemberService svc = new MemberServiceImpl();
		
		String m_id = "test";
		
		MemberVO member = svc.selectMember(m_id);
		
		System.out.println("a");
		System.out.println(member.toString());
	}
}
