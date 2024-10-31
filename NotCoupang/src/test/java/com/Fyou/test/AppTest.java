package com.Fyou.test;

<<<<<<< HEAD
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.Fyou.vo.ReviewVO;

public class AppTest {
	public static void main(String[] args) {
		
		ReviewService svc = new ReviewServiceImpl();
		
		ReviewVO review = new ReviewVO();
		
//		review.setGoodsNum(1);
//		review.setReview("add Review CTB");
//		review.setBuyerId("testCTB");
//		
//		if(svc.addReview(review)) {
//			System.out.println("입력OK");
//		} else {
//			System.out.println("입력안됨");
//		}
		
//		if(svc.removeReview("testCTB")) {
//			System.out.println("삭제OK");
//		} else {
//			System.out.println("삭제안됨");
//		}
		
		review.setGoodsNum(1);
		review.setReview("Review CTB modify");
		review.setBuyerId("testCTB");
		
		if(svc.modifyReview(review)) {
			System.out.println("삭제OK");
		} else {
			System.out.println("삭제안됨");
		}
		
		System.out.println(svc.selectReview(1));
		
		
=======
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
>>>>>>> branch 'master' of https://github.com/hayeon8521/jspbasiccode.git
	}
}
