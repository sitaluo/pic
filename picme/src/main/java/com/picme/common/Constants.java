package com.picme.common;

public interface Constants {

	public static final String CURRENT_USER_KEY = "current_user";
	
	public interface ImageType{
		public static final Integer PHOTO_ALBUM = 1;//影集制作 相片
	}
	
	public interface CommonState{
		public static final Integer NORMAL = 1;//正常
		public static final Integer ABNORMAL = 0;//禁用 无效
	}
	
	public interface GoodsType{
		public static final Integer PHOTO_ALBUM = 0;//影集制作
	}
	
	public interface OrderState{
		//0待支付 5 支付完成 10卖家发货 15买家收货 20 订单完成
		public static final Integer NO_PAY = 0;//
		public static final Integer PAY_COMPLETE = 0;
		public static final Integer DELIVERY = 0;
		public static final Integer RECEIPT = 0;
		public static final Integer ORDER_COMPLETE = 0;
	}
	
	
}
