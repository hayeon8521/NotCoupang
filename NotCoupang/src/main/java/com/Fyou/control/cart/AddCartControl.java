package com.Fyou.control.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;
import com.Fyou.vo.CartVO;

public class AddCartControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
				CartVO cart = new CartVO();
				int seqCart = Integer.parseInt(req.getParameter("seqCart"));
				int goodsNum = Integer.parseInt(req.getParameter("goodsNum"));
				String memberId = req.getParameter("memberId");
			    int count = Integer.parseInt(req.getParameter("count"));
			    String cartDate = req.getParameter("cartDate");
				
				cart.setSeqCart(seqCart);
				cart.setGoodsNum(goodsNum);
				cart.setMemberId(memberId);
				cart.setCount(count);
				cart.setCartDate(cartDate);
				
				CartService svc = new CartServiceImpl();
				try {
					//svc.insertCart(memberId, goodsNum);
					// {"retCode":"OK"}
					resp.getWriter().print("{\"retCode\":\"OK\"}");
				} catch (Exception e) {
					// {"retCode":"FAIL"}
					resp.getWriter().print("{\"retCode\":\"FAIL\"}");
				}

			}

		}

