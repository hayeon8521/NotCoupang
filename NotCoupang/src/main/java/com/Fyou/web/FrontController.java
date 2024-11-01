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
import com.Fyou.PHY.joingconfigform;
import com.Fyou.PHY.joingform;
import com.Fyou.PHY.logingconfingform;
import com.Fyou.PHY.logingform;
import com.Fyou.PHY.logout;
import com.Fyou.commom.Control;
import com.Fyou.control.BSJ.MyAskControl;
import com.Fyou.control.BSJ.MyOrderListControl;
import com.Fyou.control.BSJ.MyPageControl;
import com.Fyou.control.BSJ.MyReviewControl;
import com.Fyou.control.CTB.cartViewCont;
import com.Fyou.control.CTB.goodsinfoCont;


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
		
		//주문목록 orderList.do /  OrderListControl.java
		map.put("/myOrderList.do", new MyOrderListControl());
		
		//회원정보 조회 및 수정 memberInfo.do / MemberInfoCont.java
		map.put("/myPage.do", new MyPageControl());
		
		//내 리뷰 관리
		map.put("/myReview.do", new MyReviewControl());
		
		//문의내역 
		map.put("/myAsk.do", new MyAskControl());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//서진 사용공간 끝
		
		//신화 사용공간
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//신화 사용공간 끝
		
		//태백 사용공간
		map.put("/goodsinfo.do", new goodsinfoCont());
		map.put("/cartView.do", new cartViewCont());	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//태백 사용공간 끝
		
		//하연 사용공간
		map.put("/login.do", new logingform());
		map.put("/loginconfig.do", new logingconfingform());
		map.put("/logout.do", new logout());
		map.put("/join.do", new joingform());
		map.put("/joinconfig.do", new joingconfigform());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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