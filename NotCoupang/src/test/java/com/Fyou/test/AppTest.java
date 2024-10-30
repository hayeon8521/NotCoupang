package com.Fyou.test;

import java.util.List;

import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public class AppTest {
	public static void main(String[] args) {
		
		AnswerService svc = new AnswerServiceImpl();
		/*
		String member_id = "test";
		List<AskVO> list = svc.selectAskList(member_id);
		
		System.out.println(list.get(0).toString());
		*/
		/*
		int ask_num = 7;
		AnswerVO avo = svc.selectAnswer(ask_num);

		System.out.println(avo.toString());
		*/
		/*
		int seq_ask = 7;
		if (svc.deleteAsk(seq_ask)) {
			System.out.println("success");
		} else {
			System.out.println("fail");
		}
		*/
		
		AskVO ask = new AskVO();
		ask.setGoodsNum(10);
		ask.setAsk("테스트용");
		ask.setBuyerId("test");
		
		if (svc.insertAsk(ask)) {
			System.out.println("success");
		} else {
			System.out.println("fail");
		}
		
	}
}
