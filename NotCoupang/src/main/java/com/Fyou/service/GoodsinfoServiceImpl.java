package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.GoodsinfoMapper;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.SearchVO;


public class GoodsinfoServiceImpl implements GoodsinfoService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	GoodsinfoMapper mapper = sqlSession.getMapper(GoodsinfoMapper.class);

	@Override
	public List<GoodsinfoVO> goodsList() {
		return mapper.goodsList();
	}

	@Override
	public List<GoodsinfoVO> goodsListMID(String goodsMid) {
		return mapper.goodsListSellerMID(goodsMid);
	}

	@Override
	public List<GoodsinfoVO> goodsListTcate(String tcate) {
		return mapper.goodsListSellerTcate(tcate);
	}

	@Override
	public List<GoodsinfoVO> goodsListBcate(String bcate) {
		return mapper.goodsListSellerBcate(bcate);
	}
	
	@Override
	public List<GoodsinfoVO> goodsListKeyword(String keyword) {
		return mapper.goodsListSellerkeyword(keyword);
	}
	
	@Override
	public List<GoodsinfoVO> goodsListKeywordAndTcate(String tCate, String keyword) {
		// TODO Auto-generated method stub
		return mapper.goodsListSellerkeywordAndTcate(tCate, keyword);
	}
	
	@Override
	public boolean registerGoods(GoodsinfoVO goodsinfo) {
		return mapper.insertgoods(goodsinfo) == 1;
	}

	@Override
	public boolean modifyGoods(GoodsinfoVO goodsinfo) {
		return mapper.updategoods(goodsinfo) == 1;
	}

	@Override
	public GoodsinfoVO goodsinfo(int seqGoods) {
		return mapper.goodsinfo(seqGoods);
	}

	@Override
	public boolean goodsdelete(int seq_goods) {
		return mapper.goodsdelete(seq_goods) == 1;
	}

	@Override
	public List<GoodsinfoVO> goodsListKeywordWithPage(SearchVO search) {
		return mapper.goodsListSellerkeywordWithPage(search);
	}

	@Override
	public List<GoodsinfoVO> goodsListBcateWithPage(SearchVO search) {
		return mapper.goodsListSellerBcateWithPage(search);
	}

	@Override
	public List<GoodsinfoVO> goodsListkeywordAndTcateWithPage(SearchVO search) {
		return mapper.goodsListSellerkeywordAndTcateWithPage(search);
	}

	@Override
	public List<GoodsinfoVO> goodsListSellerAllMID(String goodsMid) {
		return mapper.goodsListSellerAllMID(goodsMid);
	}
}