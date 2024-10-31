package com.Fyou.control.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.CartService;
import com.Fyou.service.CartServiceImpl;
import com.Fyou.vo.CartVO;

public class CartListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 파라메타로 전달
		
				String id = req.getParameter("memberId");
				
				// 글목록 보여주기. 조회 후 jsp 전달.
				CartService svc = new CartServiceImpl();
				List<CartVO> list = svc.selectCart(id);
				System.out.println(list.toString());
				
				//요청정보에 attiribute사용
				req.setAttribute("memberId", id);

				/*
				//jsp 페이지.
				req.getRequestDispatcher("board/cartList.tiles").forward(req, resp);
				*/

			}

		}