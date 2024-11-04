package com.Fyou.control.LSH;

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
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.GoodsmylistVO;
import com.Fyou.vo.ImgVO;

public class GoodsListCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		//최종적으로 보낼 정보(상품정보 + 이미지 경로)
		List<GoodsmylistVO> goodsmylist = new ArrayList<>();
		
		String tCate = req.getParameter("cate");
		String kw   = req.getParameter("keyword");

		//상품 정보
		GoodsinfoService gsvc = new GoodsinfoServiceImpl();
		//이미지
		ImgService isvc = new ImgServiceImpl();
		
		//카테고리 유무 확인
		if(tCate==null||tCate.equals("")) {
			List<GoodsinfoVO> goods = gsvc.goodsListKeyword(kw);
			
			//상품리스트 확인
			if(goods != null  && !goods.isEmpty()) {
				for (GoodsinfoVO item : goods) {
					
					//상품번호를 이용해 이미지 리스트 불러오기
					List<ImgVO> imglist =  isvc.images(item.getSeqGoods());
					
					//이미지 데이터 담을 변수
					String imgurl = "";
					
					
					//이미지 리스트 확인
					if (imglist != null && !imglist.isEmpty()) {
						//썸네일 이미지를 가져온다 (가장 처음 이미지=썸네일용)
						ImgVO myfirstImg = imglist.get(0);
						System.out.println(myfirstImg.getImgUrl());	//이게 썸네일 이미지
						imgurl = myfirstImg.getImgUrl();
					}else {
						System.out.println("이미지가 없음");
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
							imgurl
							));
				}	//for (GoodsinfoVO item : goods)
				
			}
			
			req.setAttribute("cate", tCate);
			req.setAttribute("keyword", kw);
			req.setAttribute("goodsList", goodsmylist);
		}else {
			
			List<GoodsinfoVO> goods = gsvc.goodsListKeywordAndTcate(tCate, kw);
			//상품리스트 확인
			if(goods != null  && !goods.isEmpty()) {
				for (GoodsinfoVO item : goods) {
					
					//상품번호를 이용해 이미지 리스트 불러오기
					List<ImgVO> imglist =  isvc.images(item.getSeqGoods());
					
					//이미지 데이터 담을 변수
					String imgurl = "";
					
					
					//이미지 리스트 확인
					if (imglist != null && !imglist.isEmpty()) {
						//썸네일 이미지를 가져온다 (가장 처음 이미지=썸네일용)
						ImgVO myfirstImg = imglist.get(0);
						System.out.println(myfirstImg.getImgUrl());	//이게 썸네일 이미지
						imgurl = myfirstImg.getImgUrl();
					}else {
						System.out.println("이미지가 없음");
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
							imgurl
							));
				}	//for (GoodsinfoVO item : goods)
				
			}
			
			req.setAttribute("cate", tCate);
			req.setAttribute("keyword", kw);
			req.setAttribute("goodsList", goodsmylist);
		}
		

		
		
		
		req.getRequestDispatcher("BuyerTAM/goodsList.tiles").forward(req, resp);

	}

}
