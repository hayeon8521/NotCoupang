package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class logingconfingform implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		Map<String, Object> result = new HashMap<>();
		
		MemberService svc = new MemberServiceImpl();
		
		HttpSession session = req.getSession();

		MemberVO member = svc.loginCheck(id, pw);
		if(member!=null) {
			session.setAttribute("LOGID", member.getMemberId());
			session.setAttribute("LOGNAME", member.getMemberName());
			session.setAttribute("MEMBERDIVISION", member.getMemberDivision());
			result.put("retCode", member.getMemberDivision());
			System.out.println("성공");
		}else {
			result.put("retCode", "FAIL");
			System.out.println("실패");
		}
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));
	}
}