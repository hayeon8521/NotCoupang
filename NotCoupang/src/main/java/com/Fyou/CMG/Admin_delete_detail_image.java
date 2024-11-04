package com.Fyou.CMG;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.ImgVO;

public class Admin_delete_detail_image implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq_img = Integer.parseInt(req.getParameter("seq_img"));
		int list_num = Integer.parseInt(req.getParameter("list_num"));
		int seq_goods = Integer.parseInt(req.getParameter("seq_goods"));
		ImgService isvc = new ImgServiceImpl();
		List<ImgVO> img_list = isvc.images(seq_goods);
		isvc.deleteImage(img_list.get(seq_img).getSeqImg());
		
		resp.sendRedirect("Admin_goodsinfo.do?seq_goods=" + list_num);
	}

}
