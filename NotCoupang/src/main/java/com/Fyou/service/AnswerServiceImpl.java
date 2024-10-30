package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.AnswerMapper;
import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public class AnswerServiceImpl implements AnswerService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	AnswerMapper mapper = sqlSession.getMapper(AnswerMapper.class);

	@Override
	public List<AskVO> selectAskList(String member_id) {
		return mapper.selectAskList(member_id);
	}

	@Override
	public AnswerVO selectAnswer(int seq_ask) {
		return mapper.selectAnswer(seq_ask);
	}

	@Override
	public boolean deleteAsk(int seq_ask) {
		return mapper.deleteAsk(seq_ask) == 1;
	}

	@Override
	public boolean insertAsk(AskVO ask) {
		return mapper.insertAsk(ask) == 1;
	}

	@Override
	public List<AskVO> selectAskGoods(String goods_num) {
		return mapper.selectAskList(goods_num);
	}

}
