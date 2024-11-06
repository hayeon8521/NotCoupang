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
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.CartVO;
import com.Fyou.vo.CartmylistVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.ImgVO;

public class cartViewCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		System.out.println("여긴 장바구니 페이지");
		
		//로그인한 세션ID를 가져옴 (이걸로 장바구니 선택 쿼리 진행)
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		
		//최종적으로 (상품번호, 아이디, 재고수량,  상품제목, 상품가격, 상품이미지) 담을 그릇
		List<CartmylistVO> myCartList = new ArrayList<>();
		
		//장바구니테이블 맵퍼 쿼리 사용하기위해 선언한 객체
		CartService svcC = new CartServiceImpl();
		//상품정보테이블 맵퍼 쿼리 사용하기위해 선언한 객체
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		//이지미테이블 맵퍼 쿼리 사용하기위해서 선언한 객체
		ImgService svcI = new ImgServiceImpl();
		

		//너는 중복 장바구니를 정리하는거야!!! 상품상세에서 거르기 요청 하려하다
		//그냥 내가 만들지뭐 ㅋㅋㅋ
		List<CartVO> cartList2 = svcC.selectCart(LOGID);
		if(cartList2 != null  && !cartList2.isEmpty()) {
			for (CartVO overlaplist : cartList2) {
				List<CartVO> Olist = svcC.selectListCart(LOGID, overlaplist.getGoodsNum());
				if(Olist.size() >= 2) {
					String mameberId = "";
					int counting = 0;
					int goodsnumering = 0;
					for (CartVO Olisting : Olist) {
						mameberId = Olisting.getMemberId();
						counting += Olisting.getCount();
						goodsnumering = Olisting.getGoodsNum();
					}
					CartVO overLapVO = new CartVO();
					overLapVO.setGoodsNum(goodsnumering);
					overLapVO.setMemberId(mameberId);
					overLapVO.setCount(counting);
					
					if(svcC.deleteCart(overLapVO)) {
					}else {
					}
					if(svcC.insertCart(overLapVO)) {
					}else {
					}
				}
			}
		}
		
		
		
		
		//내 아이디의 카트리스트 정보를 가져와서 담음 ( 상품번호, 재고수량 )
		List<CartVO> cartList = svcC.selectCart(LOGID);
		//카트정보 유무에 따라서 화면 처리
		if(cartList != null  && !cartList.isEmpty()) {
			//장바구니 리스트가 있으면 장바구니에 담길 나머지 정보도 가져옴
			for (CartVO item : cartList) {
				//장바구니정보(cartList)로 상품정보를 가져와서 mygoods객체에 담음
				GoodsinfoVO mygoods =  svcG.goodsinfo(item.getGoodsNum());
				//장바구니정보(cartList)로 1번째 이미지썸네일을 가져와서 myimg객체에 담음
				List<ImgVO> myimg = svcI.images(item.getGoodsNum());
				if (myimg != null && !myimg.isEmpty()) {
					ImgVO myfirstImg = myimg.get(0);
					/*
					//내가필요한건
					//장바구니번호(카트리스트)
					System.out.println("장바구니="+item.getSeqCart()); //장바구니 삭제, 수량변경, 선택에 사용
					//상품번호(카트리스트)
					System.out.println("상품번호="+item.getGoodsNum());	//이미지,제목 클릭시 URL 이동에 사용
					//아이디(카트리스트)
					System.out.println("아이디="+LOGID);	//그냥 담아봤음
					//장바구니 재고수량(카트리스트)
					System.out.println("장바구니요청재고="+item.getCount());		//수량바꿀때 찐재고랑 비교필요
					//상품제목(상품리스트)
					System.out.println("상품제목="+mygoods.getGoodsName());	//상품 제목 (화면에뿌려줌)
					//상품가격(상품리스트)
					System.out.println("상품가격="+mygoods.getGoodsPrice());	//상품가격과 * 장바구니 수량 = 총금액
					//상품현재고(상품리스트)
					System.out.println("상품실재고="+mygoods.getGoodsInven());		//상품 재고 비교하여 + 못하게 막기위해
					//상품이미지(이미지리스트)
					System.out.println("상품이미지="+myfirstImg.getImgUrl());		//썸네일에 보여질 상품 이미지
					*/
					myCartList.add(new CartmylistVO(item.getSeqCart(), item.getGoodsNum(), LOGID, item.getCount(),
							mygoods.getGoodsName(), mygoods.getGoodsPrice(), mygoods.getGoodsInven(),
							myfirstImg.getImgUrl()));
					
				}//if (myimg != null && !myimg.isEmpty())
				
			}//for (CartVO item : cartList)
			
			//System.out.println(myCartList.toString());
			req.setAttribute("isdata", "YES");
			req.setAttribute("myCartList", myCartList);
		}else {
			//장바구니가 없을경우 화면 NO장바구니 해주기위해서 jsp에 변수전달
			req.setAttribute("isdata", "NO");
		}
		
		req.getRequestDispatcher("OnlyBody/cartViewPHY.tiles").forward(req, resp);
	}

}