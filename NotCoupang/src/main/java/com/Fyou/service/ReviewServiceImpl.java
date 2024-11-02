package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.ReviewMapper;
import com.Fyou.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
	
	@Override
	public List<ReviewVO> reviews(int goodsNum, int page) {
		return mapper.selectReview(goodsNum, page);
	}
	
	@Override
	public List<ReviewVO> memberReview(String buyerId) {
		// TODO Auto-generated method stub
		return mapper.memberReview(buyerId);
	}

	@Override
	public boolean addReview(ReviewVO review) {
		return mapper.insertReview(review) == 1;
	}

	@Override
	public boolean removeReview(String buyerId) {
		return mapper.deleteReview(buyerId) == 1;
	}

	@Override
	public boolean modifyReview(ReviewVO review) {
		return mapper.updateReview(review) == 1;
	}

	
	
	 

}
