package com.Fyou.CMG;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.ImgVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_insert_detail_image implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest mr = new MultipartRequest(
				req, // 요청정보
				savePath, // 저장경로
				maxSize, // 최대크기
				"utf-8", // 인코딩 방식
				new DefaultFileRenamePolicy() // 리네임 정책
				);
		
		String img_detail = mr.getFilesystemName("img_detail");
		int goods_num = Integer.parseInt(mr.getParameter("goods_num"));
		int list_num = Integer.parseInt(mr.getParameter("list_num"));
		ImgService isvc = new ImgServiceImpl();
		ImgVO ivo = new ImgVO();
		ivo.setGoodsNum(goods_num);
		ivo.setImgUrl(img_detail);
		isvc.addImages(ivo);
		
		resp.sendRedirect("Admin_goodsinfo.do?seq_goods=" + list_num);
	}
}
