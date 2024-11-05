package com.Fyou.control.BSJ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.GoodsmylistVO;
import com.Fyou.vo.ImgVO;
import com.Fyou.vo.OrderVO;

public class MyOrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정상 구현 확인
		System.out.println("MyOrderListControl");
		
		//값을 담을 그릇
		List<GoodsmylistVO> goodsmylist = new ArrayList<>();
		
		// 파라미터 선언
		// 검색조건 (1.파라미터 받기)
		String mid = req.getParameter("buyerId");
		
		OrderService svc = new OrderServiceImpl();
		List<OrderVO> list = svc.selectOrder(mid);
		
		System.out.println(list.toString());
		
		for(OrderVO temp : list) {
			temp.getGoodsNum();  //상품번호
			temp.getCount();     //상품수량
			temp.getPrice();     //상품가격
			temp.getOrderDate(); //주문날짜
			temp.getSeqOrder();   //주문번호
			
			//상품번호로 상품제목 가져오기
			GoodsinfoVO gvo = new GoodsinfoVO();
			GoodsinfoService gsvc = new GoodsinfoServiceImpl();
			gvo = gsvc.goodsinfo(temp.getGoodsNum());
			System.out.println(gvo.toString());
			System.out.println(gvo.getGoodsName()); //상품제목
			
			//상품번호로 썸네일이미지 가져오기
			ImgService Isvc = new ImgServiceImpl();
			List<ImgVO> Ivo = Isvc.images(temp.getGoodsNum());
			//System.out.println(Ivo.toString());
			
			ImgVO voI = Ivo.get(0);
			System.out.println(voI.getImgUrl()); //썸네일 이미지 주소
//확인용			
//			for(ImgVO temp1 : Ivo) {
//				System.out.println(temp1.getImgUrl());
//			}
			
			String imgurl = voI.getImgUrl();
			
			goodsmylist.add(new GoodsmylistVO(
					temp.getGoodsNum(), //상품번호
					gvo.getGoodsName(), //상품이름
					temp.getPrice(), //가격
					temp.getCount(), //수량
					String.valueOf(temp.getSeqOrder()),//주문번호
					"Mid",
					"Catename",
					temp.getOrderDate(),
					temp.getOrderDate(),
					imgurl,
					1234
					));
			
		}
		
		System.out.println(goodsmylist.toString());
		
		
		
	
		//조회해서 어트리뷰트에 값담기
		//내 주문 리스트 넘기기
		//req.setAttribute("selectOrder", list);
		
		req.setAttribute("goodsmylist", goodsmylist);
		
		try {
			req.getRequestDispatcher("BuyerTM/myOrderListBSJ.tiles").forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}

