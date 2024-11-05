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
import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;
import com.Fyou.vo.GoodsinfoVO;
import com.Fyou.vo.GoodsmylistVO;
import com.Fyou.vo.ImgVO;
import com.Fyou.vo.SearchVO;

public class GoodsListCont implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        // 최종적으로 보낼 정보 (상품정보 + 이미지 경로)
        List<GoodsmylistVO> goodsmylist = new ArrayList<>();

        String tCate = req.getParameter("cate");
        String bCate = req.getParameter("bcate");
        String kw = req.getParameter("keyword");
        String pageS = req.getParameter("page");
        
        //null 값 처리
        tCate = (tCate == null) ? "" : tCate;
        bCate = (bCate == null) ? "" : bCate;
        kw = (kw == null) ? "" : kw;
        pageS = (pageS == null)? "1" : pageS; 
        
        // 페이지
        int page = Integer.parseInt(pageS);

        // 서비스 초기화
        GoodsinfoService gsvc = new GoodsinfoServiceImpl();
        ImgService isvc = new ImgServiceImpl();
        ReviewService rsvc = new ReviewServiceImpl();
        
        List<GoodsinfoVO> goods;
        
        // 상품 정보 가져오기 (카테고리에 따라 메서드 호출 다르게)
        if (tCate.isEmpty() && bCate.isEmpty()) {								//전체 검색
            goods = gsvc.goodsListKeyword(kw);
        } else if (!tCate.isEmpty() && !bCate.isEmpty()) {						//사이드 바의 소분류 카테고리로 검색
            goods = gsvc.goodsListBcate(bCate); 
        } else {																//검색 창에 대분류 카테고리, 검색어를 이용해 검색
            goods = gsvc.goodsListKeywordAndTcate(tCate, kw);
        } 

        int searchNum = 0;
        //상품 검색 수
        if (goods != null && !goods.isEmpty()) {
        	searchNum = goods.size();
        }
        
        SearchVO search = new SearchVO();
        
        
        // 상품 정보 가져오기 (카테고리에 따라 메서드 호출 다르게)
        if (tCate.isEmpty() && bCate.isEmpty()) {								//전체 검색
        	search.setKeyword(kw);
            search.setPage(page);
            
            goods = gsvc.goodsListKeywordWithPage(search);
        } else if (!tCate.isEmpty() && !bCate.isEmpty()) {						//사이드 바의 소분류 카테고리로 검색
        	search.setBCate(bCate);
        	search.setPage(page);
            goods = gsvc.goodsListBcateWithPage(search); 
        } else {																//검색 창에 대분류 카테고리, 검색어를 이용해 검색
        	
        	search.setKeyword(kw);
        	search.setTCate(tCate);
        	search.setPage(page);
        	
            goods = gsvc.goodsListkeywordAndTcateWithPage(search);
        } 
        
        
        
        

        // 상품 리스트 확인
        if (goods != null && !goods.isEmpty()) {
        	
            for (GoodsinfoVO item : goods) {
                // 이미지 리스트 불러오기
                List<ImgVO> imglist = isvc.images(item.getSeqGoods());
                String imgurl = imglist != null && !imglist.isEmpty() ? imglist.get(0).getImgUrl() : "이미지가 없습니다";

                // 리뷰 수 불러오기
                int goodsReviews = rsvc.totalReview(item.getSeqGoods());

                // 상품 정보를 goodsmylist에 추가
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
                        goodsReviews
                ));
            }
        }
        
        //페이징
        int endPage = (int) Math.ceil(page / 10.0) * 10;
        int startPage = endPage - 9;
        int realEnd = (int) Math.ceil(searchNum / 30.0);
        endPage = endPage > realEnd ? realEnd : endPage;
        boolean prev = (startPage > 1);
        boolean next = (endPage < realEnd);
        


        // 요청 속성
        req.setAttribute("cate", tCate);
        req.setAttribute("bcate", bCate);
        req.setAttribute("keyword", kw);
        req.setAttribute("total", searchNum);
        req.setAttribute("goodsList", goodsmylist);
        
        
        req.setAttribute("page", page);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("prev", prev);
        req.setAttribute("next", next);

        // 결과 페이지로
        req.getRequestDispatcher("BuyerTAM/goodsList.tiles").forward(req, resp);
    }
}