package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.ImgVO;

public interface ImgMapper {
	
	//상품 번호 이용해서 리스팅 (사진 업로드 순서대로 가져왔습니다)
	public List<ImgVO> images(int goodsNum);
	
	//해당 상품에 맞는 상품번호로 사진 업로드
	public int insertImages(ImgVO imgUrl);
	

	//상품 번호 이용해서 썸네일 이미지 불러오기
	public ImgVO thumbnail(int goodsNum);

	//사진 업데이트를 위한 seq_img update
	public int updateImage(ImgVO imgUrl);
	
	//사진 삭제를 위한 seq_img delete
	public int deleteImage(int seq_img);

}
