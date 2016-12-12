package com.picme.common;

import java.util.HashMap;
import java.util.Map;

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
		public static final Integer PHOTOGRAPH = 0;//约拍
		public static final Integer course = 0;//课程
	}
	
	/**
	 * 订单支付状态
	 * @author kevinwu
	 */
	public interface OrderPayState{
		public static final Integer NO_PAY = 0;//待收款
		public static final Integer TO_SURE = 0;//收款待确认
		public static final Integer ALREADY_RECEIPT = 0;//已收款
		public static final Integer REFUND = 0;//已退款
		public static final Integer NOT_NEED_PAY = 0;//无需付款
	}
	
	/**
	 * 影集订单状态
	 	@author kevinwu
	 */
	public enum AlbumOrderState {

		NO_PAY(1,"待收款","订单待付款"),
		TO_SURE(2,"收款待确认","订单收款确认中"),
		SURE(3,"已确认","订单已付款，待收货"),
		COMPLETE(4,"交易完成","交易完成"),
		
		CANCEL_BY_USER(5,"用户取消","订单已取消"),
		CANCEL_BY_CUSTOMER_SERVICE(6,"客服取消","订单已取消"),
		CANCEL_BY_SYSTEM(7,"系统取消","订单已取消"),
		
		APPLY_REFUND(8,"申请退款","订单退款中，已冻结"),
		REFUND_REVIEW(9,"退款审核","订单退款中，已冻结"),
		REFUND_SUCCESS(10,"退款成功","订单已退款"),
		REFUND_FAIL(11,"退款失败","订单退款失败"),
		
		APPLY_RETURN_GOODS(12,"申请退货","订单退货中"),
		RETURN_GOODS_REVIEW(13,"退货审核","订单退货中"),
		RETURN_GOODS_SUCCESS_TO_REFUND(14,"退货成功，待退款","订单退货中"),
		RETURN_GOODS_REFUND_SUCCESS(15,"退货退款成功","订单已退货退款"),
		RETURN_GOODS_FAIL(16,"退货失败","订单退货失败")
		;
		private Integer val;
		private String systemState;
		private String customState;
		
		AlbumOrderState(Integer val,String systemState,String customState){
			this.val = val;
			this.systemState = systemState;
			this.customState = customState;
		}
		
		public static Map<Integer,String> toMap(){
			Map<Integer,String> map = new HashMap<Integer, String>();
			for(AlbumOrderState a: AlbumOrderState.values()){
				map.put(a.getVal(), a.getCustomState());
			}
			return map;
		}
		
		public Integer getVal() {
			return val;
		}
		public void setVal(Integer val) {
			this.val = val;
		}
		public String getSystemState() {
			return systemState;
		}
		public void setSystemState(String systemState) {
			this.systemState = systemState;
		}
		public String getCustomState() {
			return customState;
		}
		public void setCustomState(String customState) {
			this.customState = customState;
		}
		
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
