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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_insert_control implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		
		
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 1024 * 1024 * 5;
		MultipartRequest mr = new MultipartRequest(
				req, // 요청정보
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
		
		GoodsinfoVO result = new GoodsinfoVO();
		result.setGoodsName(goods_name);
		result.setGoodsPrice(goods_price);
		result.setGoodsInven(goods_inven);
		result.setGoodsState("state");
		result.setGoodsMid(LOGID);
		result.setGoodsCatename(goods_catename);
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		
		if (gsvc.registerGoods(result)) {
			System.out.println("success");
		} else {
			System.out.println("fail");
		}
		
		List<GoodsinfoVO> list = gsvc.goodsListMID(LOGID);
		
		ImgService isvc = new ImgServiceImpl();
		ImgVO ivo = new ImgVO();
		ivo.setGoodsNum(list.get(0).getSeqGoods());
		ivo.setImgUrl(img_thumbnail);
		
		if (isvc.addImages(ivo)) {
			System.out.println("success");
		} else {
			System.out.println("fail");
		}
		resp.sendRedirect("Admin_main.do");
	}	
}
