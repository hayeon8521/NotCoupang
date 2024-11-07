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

public class ModifyPwCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// fetch('modifyPw.do?id=' + uId + '&thisPw=' + thisPw+'&newPw=' + newPw)
		String thisPw = req.getParameter("thisPw");
		String newPw = req.getParameter("newPw");
		String id = req.getParameter("id");

		Map<String, Object> result = new HashMap<>();

		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.loginCheck(id, thisPw);

		if (mvo != null) {
			System.out.println("비밀번호 변경 성공");
			MemberVO mem = new MemberVO();
			mem.setMemberPw(newPw);
			mem.setMemberId(id);

			if (svc.modifyMember(mem)) {
				result.put("retCode", "OK");
				System.out.println("성공");
			} else {
				result.put("retCode", "FAIL");
				System.out.println("실패");
			}
		} else {
			System.out.println("비밀번호 변경 실패"); //기존비밀번호 다를때
			result.put("retCode", "FAIL");
		}
		System.out.println(mvo.getMemberPw());

		// 화면에 결과출력
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

	}

}
