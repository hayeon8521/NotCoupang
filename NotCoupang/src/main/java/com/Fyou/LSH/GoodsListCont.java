package com.Fyou.LSH;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.CategoriService;
import com.Fyou.service.CategoriServiceImpl;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.CategoriVO;
import com.Fyou.vo.GoodsinfoVO;

public class GoodsListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//상품 정보
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		List<GoodsinfoVO> list = gsvc.goodsList();
		//이미지
		ImgService isvc = new ImgServiceImpl();
		
		req.setAttribute("goodsList", list);
		
		
		req.getRequestDispatcher("BuyerTAM/goodsList.tiles").forward(req, resp);

	}

}
