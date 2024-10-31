package com.Fyou.mapper;

import java.util.List;

import com.Fyou.vo.GoodsinfoVO;

public interface GoodsinfoMapper {

	//★페이징은 나중에 구현 예정입니다요오오오 ㅠㅠ

	//리스팅 ( state가 end가 아닌 것만 무조건 )
	//1) 조건없이 전체리스팅
	//2) 셀러아이디로 리스팅 ( 관리자페이지 상품목록 )
	//3) 대분류 카데고리 리스팅
	//4) 소분류 카테고리 리스팅
	//5) 키워드로 리스팅 (해당조건은 전체상품중에 검색)

	//1)조건없이 전체 리스팅 [완료]
	List<GoodsinfoVO> goodsList();

	//2번 4번 통합이 가능하나 따로 때놨음 (전체 골격 및 페이징 보고 처리예정)
	//2)셀러아이디로 리스팅 [완료]
	List<GoodsinfoVO> goodsListSellerMID(String goodsMid);

	//3) 대분류 카데고리 리스팅 [완료]
	List<GoodsinfoVO> goodsListSellerTcate(String tcate);

	//4) 소분류 카테고리 리스팅 [완료]
	List<GoodsinfoVO> goodsListSellerBcate(String bcate);

	//5) 키워드로 리스팅
	List<GoodsinfoVO> goodsListSellerkeyword(String keyword);

	//6)상품등록
	int insertgoods(GoodsinfoVO goods);

	//7) 상품수정 등록일과 시퀀스, 판매자 말고는 다 변경가능하게 (관리자페이지 상품수정)
	//8) 상태를 'end'로 변경 업데이트 치면 (관리자 페이지에만 안보이게)
	int updategoods(GoodsinfoVO goods);


	//페이징 글목록
	//List<GoodsinfoVO> listWithPage(SearchDTO search);
}
