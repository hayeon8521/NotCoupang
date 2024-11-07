package com.Fyou.control.BSJ;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.service.OrderService;
import com.Fyou.service.OrderServiceImpl;
import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.GoodsmylistVO;
import com.Fyou.vo.ImgVO;
import com.Fyou.vo.OrderVO;

public class MyAskControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 정상 구현 확인
		System.out.println("MyAskControl");

		// 파라미터 선언
		// 검색조건 (1.파라미터 받기)
		HttpSession session = req.getSession();
		String LOGID = (String) session.getAttribute("LOGID");
		
		//질문한 리스트를 다가져온다
		AnswerService svcA = new AnswerServiceImpl();
	
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		
		List<AskVO> asklist = svcA.selectBSJAskList(LOGID);
	
		List<GoodsmylistVO> goodsmylist = new ArrayList<>();
		
		//★나중에 주석처리 해야함
		//★나중에 주석처리 해야함
		//★나중에 주석처리 해야함
		LOGID = "testerbsj";
		//★나중에 주석처리 해야함
		//★나중에 주석처리 해야함
		//★나중에 주석처리 해야함
		
		
		for(AskVO temp : asklist) {
			temp.getSeqAsk();	//질문번호
			temp.getAsk();		//질문내용
			temp.getGoodsNum();	//상품번호
			temp.getAskDate();	//문의작성일
			System.out.println("질문내용"+temp.getAsk());
			GoodsinfoVO goodsitem =  svcG.goodsinfo(temp.getGoodsNum());
			goodsitem.getGoodsName();	//상품이름
			goodsitem.getGoodsPrice();	//상품가격
//			goodsitem.getGoodsInven();	//상품재고
			System.out.println("상품정보"+goodsitem.getGoodsName());
			
			//상품번호로 썸네일이미지 가져오기
			ImgService Isvc = new ImgServiceImpl();
			List<ImgVO> Ivo = Isvc.images(temp.getGoodsNum());
			
			ImgVO voI = Ivo.get(0);
			System.out.println(voI.getImgUrl()); //썸네일 이미지 주소
			String imgurl = voI.getImgUrl();
			
			AnswerVO answerlist = svcA.selectAnswer(temp.getSeqAsk());
			String aser = "";
			Date aserdate = temp.getAskDate();
			if(answerlist != null) {
				aser = answerlist.getAnswer();
				aserdate = answerlist.getAnswerDate();
			}
			
			
			goodsmylist.add(new GoodsmylistVO(
						temp.getSeqAsk(), //문의번호 (숫자)              확인
						goodsitem.getGoodsName(), //상품이름 (스트링) 확인
						goodsitem.getGoodsPrice(), //가격 (숫자)   확인
						goodsitem.getGoodsInven(), //수량(숫자)  확인
						temp.getAsk(),//문의내역 (스트링)                 확인
						aser,//답변내용 (스트링)                            확인
						"123",//	(스트링)                                     확인
						temp.getAskDate(),//문의작성일 (데이트)       확인
						aserdate,//답변날짜 (데이트)              확인
						imgurl, //이미지url (스트링)                  확인
						goodsitem.getSeqGoods() //리뷰번호 (숫자)                                        확인
						));
		}
		
		
		
		/*
		List<GoodsmylistVO> goodsmylist = new ArrayList<>();
		
		OrderService svc = new OrderServiceImpl();
		List<OrderVO> list = svc.selectOrder(LOGID);
		
		System.out.println(list.toString());
			
			
		for(OrderVO temp : list) {
			temp.getGoodsNum();  //상품번호
			temp.getCount();     //상품수량
			temp.getPrice();     //상품가격
			temp.getOrderDate(); //주문날짜
			temp.getSeqOrder();   //주문번호
			temp.getOrderDate();
			
			//상품번호로 상품제목 가져오기
			GoodsinfoVO gvo = new GoodsinfoVO();
			GoodsinfoService gsvc = new GoodsinfoServiceImpl();
			gvo = gsvc.goodsinfo(temp.getGoodsNum());
			System.out.println(gvo.toString());
			System.out.println(gvo.getGoodsName()); //상품제목
	
			
			//상품번호로 썸네일이미지 가져오기
			ImgService Isvc = new ImgServiceImpl();
			List<ImgVO> Ivo = Isvc.images(temp.getGoodsNum());
			
			ImgVO voI = Ivo.get(0);
			System.out.println(voI.getImgUrl()); //썸네일 이미지 주소
			String imgurl = voI.getImgUrl();
			
			AnswerService asvc = new AnswerServiceImpl(); 
			String askBSJ = "";
			Date askDateBSJ = temp.getOrderDate();
			int seqAskBSJ = 0;
			

			AskVO avo3 = new AskVO();
			avo3.setBuyerId(LOGID);
			avo3.setGoodsNum(temp.getGoodsNum());
			AskVO avo = asvc.selectMyAskList(avo3);
			

			if(avo != null) {
				//내가 문의한 내용을 가져옴
				askBSJ = avo.getAsk();//문의내용
				askDateBSJ = avo.getAskDate();//문의작성일
				seqAskBSJ = avo.getSeqAsk();//문의번호
			}else {
				//답변이 없는 경우
			}
			
			System.out.println(askBSJ);
			System.out.println(askBSJ);
			System.out.println(askBSJ);
			
			
			//문의 번호로 답변 가져오기
			String answerBSJ = "";
			Date answerDateBSJ = temp.getOrderDate();
			if(seqAskBSJ != 0) {
				AnswerVO avo2 = asvc.selectAnswer(avo.getSeqAsk());
				if(avo2 != null) {
					//답변보여주기
					answerBSJ = avo2.getAnswer(); //답변
					answerDateBSJ = avo2.getAnswerDate();//답변날짜
				}else {
					//답변이 없는경우
				}
			}
			
			goodsmylist.add(new GoodsmylistVO(
					seqAskBSJ, //문의번호
					gvo.getGoodsName(), //상품이름
					temp.getPrice(), //가격
					temp.getCount(), //수량
					askBSJ,//문의내역
					answerBSJ,//답변내용
					"123",//
					askDateBSJ,//문의작성일
					answerDateBSJ,//답변날짜
					imgurl, //이미지url
					1 //리뷰번호
					));
			
			//System.out.println(asvc.toString());
			}
		*/
	
		req.setAttribute("goodsmylist", goodsmylist);
		
		try {
			req.getRequestDispatcher("BuyerTM/myAskBSJ.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}