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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Admin_update_detail_image implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		ImgService isvc = new ImgServiceImpl();
		GoodsinfoVO gvo = new GoodsinfoVO();
		ImgVO ivo = new ImgVO();
		
		
		if (req.getMethod().equals("GET")) {
			int seq_img = Integer.parseInt(req.getParameter("seq_img"));
			int list_num = Integer.parseInt(req.getParameter("list_num"));
			int seq_goods = Integer.parseInt(req.getParameter("seq_goods"));
			gvo = gsvc.goodsinfo(seq_goods);
			List<ImgVO> img_list = isvc.images(seq_goods);
			
			req.setAttribute("seq_img", seq_img);
			req.setAttribute("list_num", list_num);
			req.setAttribute("seq_goods", seq_goods);
			req.setAttribute("img_list", img_list);
			req.setAttribute("gvo", gvo);
			req.setAttribute("seq_img", seq_img);
			
			req.getRequestDispatcher("CMG/Admin_img_update.jsp").forward(req, resp);
			
		} else if (req.getMethod().equals("POST")) {
			
			String savePath = req.getServletContext().getRealPath("images");
			int maxSize = 1024 * 1024 * 5;
			MultipartRequest mr = new MultipartRequest(
					req, // 요청정보
					savePath, // 저장경로
					maxSize, // 최대크기
					"utf-8", // 인코딩 방식
					new DefaultFileRenamePolicy() // 리네임 정책
					);
			
			String img_update = mr.getFilesystemName("img_update");
			int seq_img = Integer.parseInt(mr.getParameter("seq_img"));
			int list_num = Integer.parseInt(mr.getParameter("list_num"));
			int seq_goods = Integer.parseInt(mr.getParameter("seq_goods"));
			ivo.setSeqImg(isvc.images(seq_goods).get(seq_img).getSeqImg());
			ivo.setGoodsNum(seq_goods);
			ivo.setImgUrl(img_update);
			isvc.editImage(ivo);
			
			resp.sendRedirect("Admin_goodsinfo.do?seq_goods=" + list_num);
		}
	}
}
