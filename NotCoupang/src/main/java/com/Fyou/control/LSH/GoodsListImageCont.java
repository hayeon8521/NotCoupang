package com.Fyou.control.LSH;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.runtime.directive.Parse;

import com.Fyou.commom.Control;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.ImgVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GoodsListImageCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=UTF-8");
		
        String gno = req.getParameter("gno");
        

        // 이미지
        ImgService isvc = new ImgServiceImpl();

        // 상품의 썸네일 불러오기
        ImgVO thumbnail = isvc.thumbnail(Integer.parseInt(gno));
        

        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(thumbnail);
        resp.getWriter().print(json);

	}

}
