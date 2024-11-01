package com.Fyou.control.PHY;

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

public class joingconfigform implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		Map<String, Object> result = new HashMap<>();
		
		MemberService svc = new MemberServiceImpl();

		MemberVO member = svc.selectMember(id);
		if(member!=null) {
			result.put("retCode", "OK");
			System.out.println("성공");
		}else {
			result.put("retCode", "FAIL");
			System.out.println("실패");
		}
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));

	}
}