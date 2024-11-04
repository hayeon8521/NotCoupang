package com.Fyou.CMG;

import java.io.IOException;

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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_goodsedit_control implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest mr = new MultipartRequest(req, // 요청정보
				savePath, // 저장경로
				maxSize, // 최대크기
				"utf-8", // 인코딩 방식
				new DefaultFileRenamePolicy() // 리네임 정책
		);
		
		String goods_name = mr.getParameter("goods_name");
		int goods_price = Integer.parseInt(mr.getParameter("goods_price"));
		int goods_inven = Integer.parseInt(mr.getParameter("goods_inven"));
		String goods_catename = mr.getParameter("goods_catename");
		String img_thumbnail = mr.getFilesystemName("img_thumbnail");
		int seq_img = Integer.parseInt(mr.getParameter("seq_img"));
		int seq_goods = Integer.parseInt(mr.getParameter("seq_goods"));
		String goods_state = mr.getParameter("goods_state");
		int list_num = Integer.parseInt(mr.getParameter("list_num"));
		
		if (img_thumbnail != null) {
			ImgService isvc = new ImgServiceImpl();
			ImgVO ivo = new ImgVO();
			ivo.setSeqImg(seq_img);
			ivo.setGoodsNum(seq_goods);
			ivo.setImgUrl(img_thumbnail);
			
			isvc.editImage(ivo);
		}
		
		GoodsinfoVO gvo = new GoodsinfoVO();
		gvo.setSeqGoods(seq_goods);
		gvo.setGoodsName(goods_name);
		gvo.setGoodsPrice(goods_price);
		gvo.setGoodsInven(goods_inven);
		gvo.setGoodsState(goods_state);
		gvo.setGoodsCatename(goods_catename);
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		
		gsvc.modifyGoods(gvo);
		
		req.getRequestDispatcher("Admin_goodsinfo.do?seq_goods=" + list_num).forward(req, resp);
	}

}
