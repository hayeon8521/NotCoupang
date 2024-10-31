package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public interface AnswerService {
	public List<AskVO> selectAskList(String member_id, int page);
	public AnswerVO selectAnswer(int seq_ask);
	public boolean deleteAsk(int seq_ask);
	public boolean insertAsk(AskVO ask);
	public List<AskVO> selectAskGoods(String goods_num);
}
