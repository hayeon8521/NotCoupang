package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.MemberService;
import com.Fyou.service.MemberServiceImpl;
import com.Fyou.vo.CartmylistVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.MemberVO;

public class checkoutCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		System.out.println("여긴 즉시구매하기 페이지");
		//단품 구매일경우
		//"checkout.do?logid="+ logID +"&gno="+ gno +"&count="+ count +"&price=" + price;
		//http://localhost/NotCoupang/checkout.do?logid=test&gno=11&count=5&price=15000
		
		//최종적으로 (상품번호, 아이디, 재고수량,  상품제목, 상품가격, 상품이미지) 담을 그릇
		List<CartmylistVO> myCartList = new ArrayList<>();
		
		//상품 테이블 소환
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		
		String LOGID = req.getParameter("logid");
		if(LOGID != null) {
			//바로구매일경우 진행
			String gno = req.getParameter("gno");
			String count = req.getParameter("count");
			String price = req.getParameter("price");
			
			GoodsinfoVO goods = svcG.goodsinfo(Integer.parseInt(gno));
			
			myCartList.add(new CartmylistVO(
					123, 
					Integer.parseInt(gno), 
					LOGID, 
					Integer.parseInt(count), 
					goods.getGoodsName(), 
					Integer.parseInt(price), 
					999,
					"여기선 피료없음"));
			
		}else {
			System.out.println("ID가 없음");
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
		
		//뿌려질 정보들
		//1) 구매자 이름, 주소, 연락처, 구매자번호
		//1) 상품이름, 상품수량, 상품금액, 상품번호
		
		//결제 완료
		//1) 장바구니 삭제 // 2)상품재고수정 // 3)구매정보 저장
		
		
		
		//결과 뷰
		req.getRequestDispatcher("OnlyBody/checkOutPHY.tiles").forward(req, resp);
	}
}