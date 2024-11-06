package com.Fyou.control.BSJ;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AnswerVO;

public class MyAskControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정상 구현 확인
		System.out.println("MyAskControl");

		// 파라미터 선언
				// 검색조건 (1.파라미터 받기)
				String mid = req.getParameter("buyerId");
				
				AnswerVO avo = new AnswerVO();

				AnswerService svc = new AnswerServiceImpl();
				
				
				//System.out.println(list.toString()); //list 제대로 안 찍힘

				
				// 조회해서 어트리뷰트에 값담기
				// 내 리뷰 리스트 넘기기
				//req.setAttribute("memberReview", list);
				
				try {
					req.getRequestDispatcher("BuyerTM/myAskBSJ.tiles").forward(req, resp);
				}catch(Exception e) {
					e.printStackTrace();
				}
				

			}

		}