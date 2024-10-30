package com.Fyou.test;

import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.vo.GoodsinfoVO;

public class AppTest {

	public static void main(String[] args) {
		
		GoodsinfoService svc = new GoodsinfoServiceImpl();
		

		GoodsinfoVO gv = new GoodsinfoVO();
		//gv.setGoodsName("찐으루 좋은 자전거");
		//gv.setGoodsPrice(99999);
		//gv.setGoodsInven(55);
		gv.setGoodsState("end");
		//gv.setGoodsCatename("냉장고");
		gv.setSeqGoods(49);
		
		if(svc.modifyGoods(gv)) {
			System.out.println("a");
		}else {
			System.out.println("no");
		}
		
		
		
		
		/*
		MemberService svc = new MemberServiceImpl();
		String id = "test";
		String pw = "test123";
		MemberVO member = svc.loginCheck(id, pw);
		System.out.println(member.toString());
		
		
		
		MemberVO member = new MemberVO();
		member.setMemberPw("test123");
		member.setMemberNick("코딩코딩");
		member.setMemberName("백종원");
		member.setMemberPhone("010-8521-6704");
		member.setMemberAddress("대구 광역시 여러분 왕초 입니다");
		member.setMemberId("test");
		
		if(svc.modifyMember(member)) {
			System.out.println("sessoe");
		}else {
			System.out.println("fial");
		}
		*/
		
	}
}