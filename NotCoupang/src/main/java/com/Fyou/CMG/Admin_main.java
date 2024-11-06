package com.Fyou.CMG;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.MonthVO;
import com.Fyou.vo.OrderVO;
import com.Fyou.vo.SellerCateVO;

public class Admin_main implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
	    String LOGID = (String) session.getAttribute("LOGID");
		OrderService osvc = new OrderServiceImpl();
		
		List<OrderVO> order_list = osvc.selectSellerOrder(LOGID);
		
		int total_sales = 0;
		DateFormat dateformat_MM = new SimpleDateFormat("MM");
		MonthVO month_sales = new MonthVO();
		int date_time = 0;
		for (int i = 0 ; i < order_list.size(); i++) {
			total_sales = total_sales + order_list.get(i).getCount() * order_list.get(i).getPrice();
			date_time = Integer.parseInt(dateformat_MM.format(order_list.get(i).getOrderDate()));
			if (date_time == 1) {
				month_sales.setM01(month_sales.getM01() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 2) {
				month_sales.setM02(month_sales.getM02() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 3) {
				month_sales.setM03(month_sales.getM03() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 4) {
				month_sales.setM04(month_sales.getM04() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 5) {
				month_sales.setM05(month_sales.getM05() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 6) {
				month_sales.setM06(month_sales.getM06() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 7) {
				month_sales.setM07(month_sales.getM07() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 8) {
				month_sales.setM08(month_sales.getM08() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 9) {
				month_sales.setM09(month_sales.getM09() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 10) {
				month_sales.setM10(month_sales.getM10() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 11) {
				month_sales.setM11(month_sales.getM11() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			} else if (date_time == 12) {
				month_sales.setM12(month_sales.getM12() + order_list.get(i).getCount() * order_list.get(i).getPrice());
			}
		}
		
		int month_value = LocalDate.now().getMonthValue();
		int now_month_sales = 0;
		if (month_value == 1) {
			now_month_sales = month_sales.getM01();
		} else if (month_value == 2) {
			now_month_sales = month_sales.getM02();
		} else if (month_value == 3) {
			now_month_sales = month_sales.getM03();
		} else if (month_value == 4) {
			now_month_sales = month_sales.getM04();
		} else if (month_value == 5) {
			now_month_sales = month_sales.getM05();
		} else if (month_value == 6) {
			now_month_sales = month_sales.getM06();
		} else if (month_value == 7) {
			now_month_sales = month_sales.getM07();
		} else if (month_value == 8) {
			now_month_sales = month_sales.getM08();
		} else if (month_value == 9) {
			now_month_sales = month_sales.getM09();
		} else if (month_value == 10) {
			now_month_sales = month_sales.getM10();
		} else if (month_value == 11) {
			now_month_sales = month_sales.getM11();
		} else if (month_value == 12) {
			now_month_sales = month_sales.getM12();
		}
		
		List<SellerCateVO> seller_cate_list = osvc.selectSellerCate(LOGID);
		
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();		
		List<GoodsinfoVO> goods_all_list = gsvc.goodsListSellerAllMID(LOGID);
		int state = 0;
		int stop_end = 0;
		for (int i = 0 ; i < goods_all_list.size() ; i++) {
			if (goods_all_list.get(i).getGoodsState().equals("state")) {
				state++;
			} else {
				stop_end++;
			}
		}
		
		req.setAttribute("order_list", order_list);
		req.setAttribute("total_sales", total_sales);
		req.setAttribute("month_sales", month_sales);
		req.setAttribute("now_month_sales", now_month_sales);
		req.setAttribute("seller_cate_list", seller_cate_list);
		req.setAttribute("state", state);
		req.setAttribute("stop_end", stop_end);
						
		req.getRequestDispatcher("CMG/Admin_main.jsp").forward(req, resp);
	}

}
