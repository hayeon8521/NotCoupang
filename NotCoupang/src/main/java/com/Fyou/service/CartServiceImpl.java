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
		// TODO Auto-generated method stub
		return mapper.cartList();
	}

	@Override
	public List<CartVO> selectCart(String memberId) {
		// TODO Auto-generated method stub
		return (List<CartVO>) mapper.selectCart(memberId);
	}


	@Override
	public boolean deleteCart(String memberId, int seqCart) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertCart(String memberId, int goodsNum) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean updateCart(CartVO cart) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
		
	

}
