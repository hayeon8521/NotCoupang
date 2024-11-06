package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.OrderMapper;
import com.Fyou.vo.OrderVO;

public class OrderServiceImpl implements OrderService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
	
	
	@Override
	public List<OrderVO> selectOrder(String buyer_id) {
		// TODO Auto-generated method stub
		return mapper.selectOrder(buyer_id);
	}


	@Override
	public int insertOrder(OrderVO order) {
		// TODO Auto-generated method stub
		return mapper.insertOrder(order);
	}


	@Override
	public int deleteOrder(OrderVO order) {
		// TODO Auto-generated method stub
		return mapper.deleteOrder(order);
	}


	@Override
	public int updateOrder(OrderVO order) {
		// TODO Auto-generated method stub
		return mapper.updateOrder(order);
	}

	@Override
	public boolean deleteOrderOne(int seqOrder) {
		return mapper.deleteOrderOne(seqOrder) == 1;
	}

	@Override
	public List<OrderVO> selectSellerOrder(String seller_id) {
		return mapper.selectSellerOrder(seller_id);
	}
}
