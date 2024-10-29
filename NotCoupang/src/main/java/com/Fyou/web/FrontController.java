package com.Fyou.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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