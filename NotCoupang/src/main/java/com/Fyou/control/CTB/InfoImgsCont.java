package com.Fyou.control.CTB;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.ImgVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class InfoImgsCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gno = req.getParameter("gno");

		// 이미지
		ImgService isvc = new ImgServiceImpl();

		// 이미지 리스트 넘기기
		List<ImgVO> imgs = isvc.images(Integer.parseInt(gno));
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(imgs);
		resp.getWriter().print(json);
	
	}

}
