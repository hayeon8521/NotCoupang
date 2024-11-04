package com.Fyou.control.BSJ;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ModifyAddressCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 아이디, 배송지 받기
		String address = req.getParameter("address");
		String id = req.getParameter("id");

		Map<String, Object> result = new HashMap<>();

		MemberService svc = new MemberServiceImpl();
		MemberVO mem = new MemberVO();

		mem.setMemberAddress(address);
		mem.setMemberId(id);
		
		System.out.println(address);
		

		if (svc.modifyMember(mem)) {
			result.put("retCode", "OK");
			System.out.println("성공");
		} else {
			result.put("retCode", "FAIL");
			System.out.println("실패");
		}

		// 화면에 결과출력
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

	}

}
