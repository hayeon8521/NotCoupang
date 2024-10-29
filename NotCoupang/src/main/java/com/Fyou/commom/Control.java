package com.Fyou.commom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Control {
	//HttpServletRequest 요청정보 객체
	//XHttpServletResponse 응답처리 객체
	void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
