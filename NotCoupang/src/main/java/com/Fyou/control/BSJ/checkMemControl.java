package com.Fyou.control.BSJ;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.MemberVO;

public class checkMemControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정상 구현 확인
		System.out.println("checkMemControl");

		if (req.getMethod().equals("GET")) {
			// 오픈할 페이지 설정
			req.getRequestDispatcher("BuyerTM/checkMemBSJ.tiles").forward(req, resp);

		} else if (req.getMethod().equals("POST")) {

			String u_id = req.getParameter("staticID");
			String u_pw = req.getParameter("inputPassword");

			//System.out.println(u_id + u_pw);

			MemberService svc = new MemberServiceImpl();
			MemberVO mvo = svc.loginCheck(u_id, u_pw);

			//System.out.println(mvo.toString());

			if (mvo != null) {
				System.out.println(mvo.toString());
				resp.sendRedirect("myPage.do?memberId="+u_id);
			} else {
				 //오픈할 페이지 설정
				req.getRequestDispatcher("BuyerTM/checkMemBSJ.tiles").forward(req, resp);
			}
			
		}

		
	}

}
