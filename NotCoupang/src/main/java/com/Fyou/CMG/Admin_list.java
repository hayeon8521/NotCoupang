package com.Fyou.CMG;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.ImgVO;

public class Admin_list implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		String page = req.getParameter("page");
		page = (page == null) ? "1" : page;
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		ImgService isvc = new ImgServiceImpl();
		List<GoodsinfoVO> list = gsvc.goodsListMID(LOGID); // 세션으로 받는 아이디 입력
		
		req.setAttribute("goodsList", list);
		req.setAttribute("page", page);
		
		String[] img_arr = new String[10];
		int index = 0;
		for (int i = Integer.parseInt(page) * 10 - 10 ; i < ((Integer.parseInt(page) * 10) > list.size() ? list.size() : (Integer.parseInt(page) * 10)) ; i++) {
			int seq_goods = list.get(i).getSeqGoods();
			List<ImgVO> img_list = isvc.images(seq_goods);
			img_arr[index] = img_list.get(0).getImgUrl();
			index++;
		}
		req.setAttribute("img_arr", img_arr);
		
		req.getRequestDispatcher("CMG/Admin_list.jsp").forward(req, resp);

	}

}
