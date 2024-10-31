package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.GoodsinfoVO;

public interface GoodsinfoService {
	
	//조건 없는 리스팅
	List<GoodsinfoVO> goodsList();
	
	//셀러아이디 리스팅
	List<GoodsinfoVO> goodsListMID(String goodsMid);
	
	//대분류 리스팅
	List<GoodsinfoVO> goodsListTcate(String tcate);
	
	//소분류 리스팅
	List<GoodsinfoVO> goodsListBcate(String bcate);
	
	//키워드 검색 리스팅
	List<GoodsinfoVO> goodsListKeyword(String keyword);
	
	//상품등록
	boolean registerGoods(GoodsinfoVO goodsinfo);
	
	//상품 수정 및 상태 변경
	boolean modifyGoods(GoodsinfoVO goodsinfo);
	
	//상품 상세정보 가져오기
	GoodsinfoVO goodsinfo(int seqGoods);

}