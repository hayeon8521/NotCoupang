package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.Fyou.vo.CartVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.OrderVO;

public class thankyouCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		
		String hiddenGoods = req.getParameter("hiddenGoods");
		if(hiddenGoods != null && hiddenGoods.endsWith("_")) {
			hiddenGoods = hiddenGoods.substring(0, hiddenGoods.length() - 1);
		}
		
		System.out.println(hiddenGoods);
		
		//장바구니 서비스
		CartService svcC = new CartServiceImpl();
		//상품정보 서비스
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		//주문완료 서비스
		OrderService svcO = new OrderServiceImpl();
		
		String[] parts = hiddenGoods.split("_");
		for(int i=0; i<parts.length; i++) {
			//장바구니정보가져오기
			//CartVO cart = svcC.selectOneCart(LOGID, Integer.parseInt(parts[i]));
			
			//장바구니에 동일 중복값이 있으면 제일 마지막 정보만 가져와서 cart객체에 넣자!!
			//(삭제는 아쉽게도 장바구니에있는 중복 상품도 삭제) 더만들고 싶은데 오늘 시간 데드라인
			CartVO cart = new CartVO();
			List<CartVO> cartlist =svcC.selectListCart(LOGID, Integer.parseInt(parts[i]));
			if (!cartlist.isEmpty()) {
			    cart = cartlist.get(cartlist.size() - 1);
			} else {
			    System.out.println("텅텅 비어있어 너 망한거야!");
			}
			
			
			//상품정보 당기기
			GoodsinfoVO goods = svcG.goodsinfo(cart.getGoodsNum());
			OrderVO order = new OrderVO();
			order.setBuyerId(LOGID);
			order.setGoodsNum(cart.getGoodsNum());
			order.setCount(cart.getCount());
			order.setPrice(goods.getGoodsPrice());
			
			
			//재고수량 업데이트
			GoodsinfoVO updatdgoods = new GoodsinfoVO();
			updatdgoods.setGoodsInven(goods.getGoodsInven()-cart.getCount());
			updatdgoods.setSeqGoods(cart.getGoodsNum());
			
			//상품재고 업데이트
			svcG.modifyGoods(updatdgoods);
			
			//구매내역 삽입
			svcO.insertOrder(order);
			
			//장바구니삭제
			svcC.deleteCart(cart);
		}
		req.getRequestDispatcher("BuyerTM/thank-youPHY.tiles").forward(req, resp);
	}
}