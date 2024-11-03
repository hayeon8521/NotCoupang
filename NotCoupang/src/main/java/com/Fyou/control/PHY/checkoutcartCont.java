package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.ArrayList;
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
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.CartVO;
import com.Fyou.vo.CartmylistVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.MemberVO;

public class checkoutcartCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		System.out.println("여긴 장바구니 구매 페이지");
		//장바구니 리스트 구매일경우
		//"checkout.do?hiddenGoods=값
		
		String hiddenGoods = req.getParameter("hiddenGoods");
		
		if(hiddenGoods != null && hiddenGoods.endsWith("_")) {
			hiddenGoods = hiddenGoods.substring(0, hiddenGoods.length() - 1);
		}
		System.out.println(hiddenGoods);
		
		//최종적으로 (상품번호, 아이디, 재고수량,  상품제목, 상품가격, 상품이미지) 담을 그릇
		List<CartmylistVO> myCartList = new ArrayList<>();
		
		//상품 테이블 소환
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		
		String LOGID = req.getParameter("logID");
		
		//장바구니 구매일경우 진행
		HttpSession session = req.getSession();
		LOGID = (String) session.getAttribute("LOGID");
		
		//장바구니 테이블 소환
		CartService svcC = new CartServiceImpl();
		
		String[] parts = hiddenGoods.split("_");
		for(int i=0; i<parts.length; i++) {
			CartVO cart = svcC.selectOneCart(LOGID, Integer.parseInt(parts[i])); 	//장바구니번호, 상품번호, 멤버아이디, 재고
			GoodsinfoVO goods = svcG.goodsinfo(Integer.parseInt(parts[i]));
			
			myCartList.add(new CartmylistVO(
					cart.getSeqCart(), 
					Integer.parseInt(parts[i]), 
					LOGID, 
					cart.getCount(), 
					goods.getGoodsName(), 
					goods.getGoodsPrice(), 
					goods.getGoodsInven(),
					"여기선 피료없음"));
		}
		
		MemberService svcM = new MemberServiceImpl();
		MemberVO member = svcM.selectMember(LOGID);
		if(member != null) {
			System.out.println(member.toString());
			System.out.println(myCartList.toString());
			//멤버 정보 박아넣기
			req.setAttribute("memberInfo", member);	//1) 구매자 이름, 주소, 연락처, 구매자번호
			req.setAttribute("myCartList", myCartList);
		}else {		
			System.out.println("로그인 정보가 없음");
		}
		
		
		
		req.getRequestDispatcher("OnlyBody/checkOutPHY.tiles").forward(req, resp);
	}
}
