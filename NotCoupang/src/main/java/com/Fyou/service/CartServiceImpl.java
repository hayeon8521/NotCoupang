package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.CartMapper;
import com.Fyou.vo.CartVO;

public class CartServiceImpl implements CartService {

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);

	
	@Override
	public List<CartVO> cartList() {
		return mapper.cartList();
	}
	
	@Override
	public List<CartVO> selectCart(String memberId) {
		return mapper.selectCart(memberId);
	}
	
	@Override
	public boolean insertCart(CartVO cart) {
		return mapper.insertCart(cart) ==1;
	}
	
	@Override
	public boolean deleteCart(CartVO cart) {
		return mapper.deleteCart(cart) == 1;
	}
	
	@Override
	public boolean updateCart(CartVO cart) {
		return mapper.updateCart(cart) == 1;
	}

	@Override
	public CartVO selectOneCart(String memberId, int goodsNum) {
		return mapper.selectOneCart(memberId, goodsNum);
	}

	
	

}
