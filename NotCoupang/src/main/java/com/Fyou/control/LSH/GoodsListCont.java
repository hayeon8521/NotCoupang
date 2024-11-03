package com.Fyou.control.LSH;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.GoodsinfoVO;

public class GoodsListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String tCate = req.getParameter("cate");
		String kw   = req.getParameter("keyword");

		//상품 정보
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		
		
		if(tCate==null||tCate.equals("")) {
			List<GoodsinfoVO> list = gsvc.goodsListKeyword(kw);
			req.setAttribute("goodsList", list);
		}else {
			List<GoodsinfoVO> list = gsvc.goodsListKeywordAndTcate(tCate, kw);
			req.setAttribute("goodsList", list);
		}
		
		//System.out.println(tCate);
		//이미지
		ImgService isvc = new ImgServiceImpl();
		
		
		
		req.getRequestDispatcher("BuyerTAM/goodsList.tiles").forward(req, resp);

	}

}
