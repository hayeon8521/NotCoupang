package com.Fyou.control.CTB;

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

public class GoodsinfoCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//상품
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		
		//초기 페이지
		//상품리스트 페이지에서 파라미터 변수이름을 뭘로 넘겨줄지 알아야 됨 임시로 이렇게 적었음. 나중에 파라미터 String seqGoods = "1"; 지우고 주석처리된 위에 코드 사용하기
		String gno = req.getParameter("gno");
		
		//상품 정보 객체 넘기기
		GoodsinfoVO goods = gsvc.goodsinfo(Integer.parseInt(gno));
		req.setAttribute("goodsinfo", goods);	
		
		req.getRequestDispatcher("BuyerTM/goodsinfoCTB.tiles").forward(req, resp);
		
	}

}
