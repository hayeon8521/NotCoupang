package com.Fyou.control.PHY;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;

public class joingogoCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		//id, pw, fname, nick, fdivistion, phone, addres
		String memberId = req.getParameter("id");
		String memberPw = req.getParameter("pw");
		String memberName = req.getParameter("fname");
		String memberNick = req.getParameter("nick");
		String memberDivision = req.getParameter("fdivistion");
		String memberPhone = req.getParameter("phone");
		String memberAddress = req.getParameter("addres");
		
		MemberService svc = new MemberServiceImpl();
		
		MemberVO member = new MemberVO();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberName(memberName);
		member.setMemberNick(memberNick);
		member.setMemberDivision(memberDivision);
		member.setMemberPhone(memberPhone);
		member.setMemberAddress(memberAddress);
		System.out.println(member.toString());
		
		if(svc.addMember(member)) {
			System.out.println("회원가입 완료");
			//http://localhost/NotCoupang/login.do
			resp.sendRedirect("login.do");
		}else {
			System.out.println("회원가입 실패");
			//http://localhost/NotCoupang/join.do?division=buyer
			resp.sendRedirect("join.do?division="+memberDivision);
		}
	}

}
