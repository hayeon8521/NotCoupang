package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.CategoriVO;

public interface CategoriMapper {
	//대분류 카테고리
	public List<CategoriVO> selectTcate(String Tcate);
	
	//중분류 카테고리
	public List<CategoriVO> selectBcate(String Bcate);
}
