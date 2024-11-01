package com.Fyou.CMG;

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
import com.Fyou.vo.ImgVO;

public class Admin_goodsinfo implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq_goods = Integer.parseInt(req.getParameter("seq_goods"));
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		ImgService isvc = new ImgServiceImpl();
		
		List<GoodsinfoVO> list = gsvc.goodsListMID("test");
		GoodsinfoVO gvo = new GoodsinfoVO();
		gvo = list.get(seq_goods);
		seq_goods = gvo.getSeqGoods();
		req.setAttribute("gvo", gvo);
		List<ImgVO> img_list = isvc.images(seq_goods);
		req.setAttribute("img_list", img_list);
		
		
		req.getRequestDispatcher("CMG/Admin_goodsinfo.jsp").forward(req, resp);
	}

}
