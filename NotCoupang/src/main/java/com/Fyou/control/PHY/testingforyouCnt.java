package com.Fyou.control.PHY;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fyou.commom.Control;
import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;
import com.Fyou.service.ImgService;
import com.Fyou.service.ImgServiceImpl;
import com.Fyou.vo.CartVO;
import com.Fyou.vo.CartmylistVO;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.GoodsmylistVO;
import com.Fyou.vo.ImgVO;

public class testingforyouCnt implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		//값을 담을 그릇
		List<GoodsmylistVO> goodsmylist = new ArrayList<>();
		
		//1 상품 리스트를 가져온다 (사용가능한 메소드 select 하는건 다됨)
		//goodsList(), goodsListSellerMID(), goodsListSellerTcate(),
		//goodsListSellerBcate(), goodsListSellerkeyword(), goodsListSellerkeywordAndTcate()
		GoodsinfoService svcG = new GoodsinfoServiceImpl();
		List<GoodsinfoVO> goods = svcG.goodsList();
		
		// 이미지 맵퍼 호출 서비스
		ImgService svcI = new ImgServiceImpl();
		
		//상품리스트가 있으면
		if(goods != null  && !goods.isEmpty()) {
			
			//상품리스트에서 상품번호를 가져온다
			for (GoodsinfoVO item : goods) {
				//이게 상품번호
				//System.out.println(item.getSeqGoods());
				
				
				//이걸로 이미지 맵퍼를 호출해서 이미지를 가져온다
				List<ImgVO> imglist =  svcI.images(item.getSeqGoods());
				
				//이미지 데이터 담을 변수
				String imgurl = "";
				
				
				if (imglist != null && !imglist.isEmpty()) {
					//썸네일 이미를 가져온다 (제일 처음꺼)
					ImgVO myfirstImg = imglist.get(0);
					System.out.println(myfirstImg.getImgUrl());	//이게 썸네일 이미지
					imgurl = myfirstImg.getImgUrl();
				}else {
					System.out.println("이미지가 없뜸");
					imgurl = "이미지가 없습니다";
				}
				
				goodsmylist.add(new GoodsmylistVO(
						item.getSeqGoods(),
						item.getGoodsName(),
						item.getGoodsPrice(),
						item.getGoodsInven(),
						item.getGoodsState(),
						item.getGoodsMid(),
						item.getGoodsCatename(),
						item.getGoodsMdate(),
						item.getGoodsRdate(),
						imgurl,
						1234
						));

			}//for (GoodsinfoVO item : goods)
			
			//상품정보에 이미지정보도 잘 넣어졌는지 확인
			for (GoodsmylistVO item2 : goodsmylist) {
				System.out.println(item2.toString());
			}
			
		}//if(goods != null  && !goods.isEmpty())
		
	}
}
