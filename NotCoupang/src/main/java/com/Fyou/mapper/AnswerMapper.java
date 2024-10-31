package com.Fyou.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Fyou.vo.AnswerVO;
import com.Fyou.vo.AskVO;

public interface AnswerMapper {
	// 유저 ID로 문의한 전체 페이징 리스트 반환
	public List<AskVO> selectAskList(@Param("buyer_id") String buyer_id, @Param("page") int page);
	// 문의 번호로 문의 답변 작성
	public AnswerVO selectAnswer(int seq_ask);
	// 문의 번호로 문의 내역 삭제
	public int deleteAsk(int seq_ask);
	// 문의 내역 추가
	public int insertAsk(AskVO ask);
	// 개별 상품의 문의 전체 리스트 반환
	public List<AskVO> selectAskGoods(String goods_num);
}
