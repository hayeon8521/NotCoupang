package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.CategoriMapper;
import com.Fyou.vo.CategoriVO;

public class CategoriServiceImpl implements CategoriService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CategoriMapper mapper = sqlSession.getMapper(CategoriMapper.class);
	@Override
	public List<CategoriVO> Tcates(String Tcate) {
		return mapper.selectTcate(Tcate);
	}

	@Override
	public List<CategoriVO> Bcates(String Bcate) {
		return mapper.selectBcate(Bcate);
	}

	@Override
	public List<CategoriVO> listOfTcate() {
		// TODO Auto-generated method stub
		return mapper.listOfTcate();
	}
	
	
}
