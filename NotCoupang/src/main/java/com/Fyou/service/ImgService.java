package com.Fyou.service;

import java.util.List;

import com.Fyou.vo.ImgVO;

public interface ImgService {
	
	//테스트 완료
	
	//상품 번호 이용해서 리스팅 (사진 업로드 순서대로 가져왔습니다)	
	public List<ImgVO> images(int goodsNum);
	
	//해당 상품에 맞는 상품번호로 사진 업로드
	public boolean addImages(ImgVO imgUrl);
	
	//상품 번호 이용해서 썸네일 가져오기
	public ImgVO thumbnail(int goodsNum);
}
