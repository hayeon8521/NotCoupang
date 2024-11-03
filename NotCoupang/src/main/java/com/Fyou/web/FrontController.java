package com.Fyou.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.CMG.Admin_goodsinfo;
import com.Fyou.CMG.Admin_insert;
import com.Fyou.CMG.Admin_insert_control;
import com.Fyou.CMG.Admin_list;
import com.Fyou.CMG.Admin_main;
import com.Fyou.commom.Control;
import com.Fyou.control.BSJ.MyAskControl;
import com.Fyou.control.BSJ.MyOrderListControl;
import com.Fyou.control.BSJ.MyPageControl;
import com.Fyou.control.BSJ.MyReviewControl;
import com.Fyou.control.CTB.AskCountCont;
import com.Fyou.control.CTB.CartViewCont;
import com.Fyou.control.CTB.GoodsinfoCont;
import com.Fyou.control.CTB.QnaListCont;
import com.Fyou.control.CTB.ReviewCountCont;
import com.Fyou.control.CTB.ReviewListCont;
import com.Fyou.control.LSH.GoodsListCont;
import com.Fyou.control.LSH.welcomeCont;
import com.Fyou.control.PHY.cartViewCNTCont;
import com.Fyou.control.PHY.cartViewCont;
import com.Fyou.control.PHY.joingconfigform;
import com.Fyou.control.PHY.joingform;
import com.Fyou.control.PHY.joingogoCont;
import com.Fyou.control.PHY.logingconfingform;
import com.Fyou.control.PHY.logingform;
import com.Fyou.control.PHY.logout;

//@WebServlet("*.do")
public class FrontController extends HttpServlet {

	Map<String, Control> map;
	
    public FrontController() {
    	map = new HashMap<>();
    }
    
    @Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/test.do", new test());	//테스트용도
		map.put("/testlist.do", new testlist());	//테스트용도
		map.put("/test2.do", new test2());	//테스트용도
		
		
		
		
		
		//민규 사용공간
		
		
		map.put("/Admin_main.do", new Admin_main());
		map.put("/Admin_insert.do", new Admin_insert());
		map.put("/Admin_insert_control.do", new Admin_insert_control());
		map.put("/Admin_list.do", new Admin_list());
		map.put("/Admin_goodsinfo.do", new Admin_goodsinfo());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//민규 사용공간 끝
		
		//서진 사용공간
		//회원 마이페이지 관련
		
		//주문목록 
		map.put("/myOrderList.do", new MyOrderListControl());
		
		//회원정보 조회 및 수정 
		map.put("/myPage.do", new MyPageControl());
		
		//내 리뷰 관리
		map.put("/myReview.do", new MyReviewControl());
		
		//문의내역 
		map.put("/myAsk.do", new MyAskControl());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//서진 사용공간 끝
		
		//신화 사용공간
		map.put("/welcome.do", new welcomeCont());
		map.put("/goodsList.do", new GoodsListCont());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//신화 사용공간 끝
		
		//태백 사용공간
		
		//상세페이지 정보
		map.put("/goodsinfo.do", new GoodsinfoCont());
		//장바구니 담기
		map.put("/cartView.do", new CartViewCont());	
		//리뷰 리스트
		map.put("/reviewList.do", new ReviewListCont());
		//리뷰 개수(페이징 관련)
		map.put("/reviewCount.do", new ReviewCountCont());
		//문의 답변 리스트
		map.put("/qnaList.do", new QnaListCont());
		//문의 개수
		map.put("/askCount.do", new AskCountCont());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//태백 사용공간 끝
		
		//하연 사용공간
		map.put("/login.do", new logingform());		//로그인 페이지
		map.put("/loginconfig.do", new logingconfingform());	//로그인 확인 페이지
		map.put("/logout.do", new logout());				//로그아웃 페이지
		map.put("/join.do", new joingform());				//회원가입페이지
		map.put("/joinconfig.do", new joingconfigform());	//아이디 중복 확인페이지
		map.put("/joingogo.do", new joingogoCont());		//회원가입 확인 처리 페이지
		map.put("/cartViewing.do", new cartViewCont());		//장바구니 페이지
		map.put("/cartViewcount.do", new cartViewCNTCont());		//장바구니 상품 수량변경
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//하연 사용공간 끝
    }
    
    @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String page = uri.substring(context.length());		
		Control control = map.get(page);
		control.exec(req, resp);
	}	
}