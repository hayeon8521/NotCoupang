package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.GoodsinfoVO;

public interface GoodsinfoMapper {
	
	//대분류 카테고리명 이용해서 리스팅
	public List<GoodsinfoVO> goodsListTopCate(String goodsCatename);
}
