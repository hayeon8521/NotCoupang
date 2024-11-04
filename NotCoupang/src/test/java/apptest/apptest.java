package apptest;

import com.Fyou.service.ReviewService;
import com.Fyou.service.ReviewServiceImpl;

public class apptest {
	public static void main(String[] args) {
		
		//ImgService svc = new ImgServiceImpl();
		//GoodsinfoService svc = new GoodsinfoServiceImpl();
		
		//System.out.println(svc.goodsinfo(1));
		ReviewService svc = new ReviewServiceImpl();
		System.out.println("totalReview: " + svc.totalReview(35));
		
	}
}
