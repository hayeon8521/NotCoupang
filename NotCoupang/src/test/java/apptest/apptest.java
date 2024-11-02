package apptest;

import com.Fyou.service.GoodsinfoService;
import com.Fyou.service.GoodsinfoServiceImpl;

public class apptest {
	public static void main(String[] args) {
		
		//ImgService svc = new ImgServiceImpl();
		GoodsinfoService svc = new GoodsinfoServiceImpl();
		
		System.out.println(svc.goodsinfo(1));
		
	}
}
