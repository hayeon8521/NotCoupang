package com.Fyou.CMG;

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
import com.Fyou.vo.ImgVO;

public class Admin_goodsedit implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int seq_goods = Integer.parseInt(req.getParameter("seq_goods"));
		int list_num = Integer.parseInt(req.getParameter("list_num"));
		req.setAttribute("seq_goods", seq_goods);
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		GoodsinfoVO gvo = gsvc.goodsinfo(seq_goods);
		ImgService isvc = new ImgServiceImpl();
		List<ImgVO> img_list = isvc.images(seq_goods);
		CategoriService csvc = new CategoriServiceImpl();
		CategoriVO cate_list = csvc.Bcates(gvo.getGoodsCatename()).get(0);
		System.out.println(cate_list.toString());
		
		req.setAttribute("gvo", gvo);
		req.setAttribute("ivo", img_list.get(0));
		req.setAttribute("list_num", list_num);
		req.setAttribute("cate_list", cate_list);
		
		req.getRequestDispatcher("CMG/Admin_goodsedit.jsp").forward(req, resp);

	}

}
