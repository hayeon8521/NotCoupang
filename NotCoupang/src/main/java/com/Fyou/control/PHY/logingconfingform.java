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
		
		//원래는 디비가 너무 많아서 조회하는데 시간이 걸리는거 인데 것멋들어진 느낌으로 쿠팡이랑 똑같이 표현한다고 넣음
		try {
			Thread.sleep(200);
		}catch (InterruptedException e) {
			e.printStackTrace();
		}
		
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