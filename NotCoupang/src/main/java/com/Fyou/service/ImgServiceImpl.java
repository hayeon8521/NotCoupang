package com.Fyou.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Fyou.commom.DataSource;
import com.Fyou.mapper.ImgMapper;
import com.Fyou.vo.ImgVO;

public class ImgServiceImpl implements ImgService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ImgMapper mapper = sqlSession.getMapper(ImgMapper.class);
	

	@Override
	public List<ImgVO> images(int goodsNum) {
		return mapper.images(goodsNum);
	}

	@Override
	public boolean addImages(ImgVO imgUrl) {
		return mapper.insertImages(imgUrl) == 1;
	}

	@Override
	public boolean editImage(ImgVO imgUrl) {
		return mapper.updateImage(imgUrl) == 1;
	}

	@Override
	public boolean deleteImage(int seq_img) {
		return mapper.deleteImage(seq_img) == 1;
	}
	
	
}
