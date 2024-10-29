package com.Fyou.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class testlist implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService svc = new MemberServiceImpl();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/json;charset=utf-8");
		
		String m_id = "test";
		
		MemberVO member = svc.selectMember(m_id);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(member);
		resp.getWriter().print(json);
	}

}
