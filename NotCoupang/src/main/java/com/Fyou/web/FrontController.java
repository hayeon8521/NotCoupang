package com.Fyou.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.PHY.joingconfigform;
import com.Fyou.PHY.joingform;
import com.Fyou.PHY.logingconfingform;
import com.Fyou.PHY.logingform;
import com.Fyou.PHY.logout;
import com.Fyou.commom.Control;


//@WebServlet("*.do")
public class FrontController extends HttpServlet {

	Map<String, Control> map;
	
    public FrontController() {
    	map = new HashMap<>();
    }
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/test.do", new test());	//테스트용도
		map.put("/testlist.do", new testlist());	//테스트용도
		map.put("/test2.do", new test2());	//테스트용도
		
		
		
		
		
		//민규 사용공간
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//민규 사용공간 끝
		
		//서진 사용공간
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//서진 사용공간 끝
		
		//신화 사용공간
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//신화 사용공간 끝
		
		//태백 사용공간
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//태백 사용공간 끝
		
		//하연 사용공간
		map.put("/login.do", new logingform());
		map.put("/loginconfig.do", new logingconfingform());
		map.put("/logout.do", new logout());
		map.put("/join.do", new joingform());
		map.put("/joinconfig.do", new joingconfigform());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//하연 사용공간 끝
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String page = uri.substring(context.length());		
		Control control = map.get(page);
		control.exec(req, resp);
	}	
}