package com.Fyou.control.CTB;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.Fyou.commom.Control;
import com.Fyou.service.AnswerService;
import com.Fyou.service.AnswerServiceImpl;
import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public class QnaListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		// 상품리스트 페이지에서 파라미터 변수이름을 뭘로 넘겨줄지 알아야 됨 임시로 이렇게 적었음. 나중에 파라미터 String seqGoods =
		// "1"; 지우고 주석처리된 위에 코드 사용하기
		// String gno = req.getParameter("gno");
		String gno = "35";
		String page = req.getParameter("page");
		String mid = req.getParameter("mid");

		// 문의
		AnswerService asvc = new AnswerServiceImpl();

		// 문의 리스트 넘기기
		List<AskVO> asks = asvc.selectAskGoods(Integer.parseInt(gno), Integer.parseInt(page));
		
		// 답변 리스트 받기
		// 만약 질문에 답변이 없으면 "데이터 없음" 이런식으로 해서 서로 짝맞춤
		List<AnswerVO> answers = new ArrayList<>();
		for (int i = 0; i < asks.size(); i++) {
			// 상품번호에 맞는 각각의 문의 번호를 가져왔음
			int askNum = asks.get(i).getSeqAsk();
			// 가져온 번호로 db에서 검색
			AnswerVO answer = asvc.selectAnswer(askNum);
			if (answer == null) {
				answer = new AnswerVO();
				answer.setAnswer("-문의에 대한 답변이 없습니다-");
				answer.setAnswerDate(null);
				answer.setAskNum(askNum);
				answer.setSellerId(mid);
			}
			answers.add(answer);
		}
		
		JSONObject json = new JSONObject();
		//문의 리스트
		json.put("asks", new JSONArray(asks));
		//답변 리스트
		json.put("answers", new JSONArray(answers));
		
		String jsonString = json.toString();
		resp.getWriter().print(jsonString);
	}

}
