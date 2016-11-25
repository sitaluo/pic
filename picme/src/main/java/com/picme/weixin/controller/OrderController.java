package com.picme.weixin.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.common.BusinessNoUtils;
import com.picme.common.Constants;
import com.picme.entity.Order;
import com.picme.entity.PhotoAlbum;
import com.picme.service.OrderService;
import com.picme.service.PhotoAlbumService;

@Controller
@RequestMapping(value="weixin/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private PhotoAlbumService photoAlbumService;
	/**
	 * 支付选择 新建订单
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/payType")   
    public ModelAndView payType(HttpServletRequest request,Integer albumId,Integer orderId,Integer addressId) throws Exception { 
		ModelAndView mv = new ModelAndView("weixin/order/payType");
		Order order = null;
		if(orderId != null){
			//已存在订单重新支付
			order = orderService.getById(orderId);
		}else{
			//新建订单支付
			Integer num = 1;
			PhotoAlbum album = photoAlbumService.getById(albumId);
			Double totalPrice = album.getPrice().doubleValue() * num;
			
			order = new Order();
			order.setAlbumId(albumId);
			order.setAlbumNo(album.getNo());
			order.setUserId(albumId);
			order.setAddressId(addressId);
			order.setOrderNo(BusinessNoUtils.getCommonBusinessNo());
			order.setGoodsType(Constants.GoodsType.PHOTO_ALBUM);
			order.setNum(num);
			order.setState(Constants.OrderState.NO_PAY);
			order.setTotalPrice(new BigDecimal(totalPrice));
			orderService.save(order);
		}
		mv.addObject("order",order);
        return mv; 
    }
	
	/**
	 * 确认订单
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/sureOrder")   
    public ModelAndView sureOrder(HttpServletRequest request,Integer albumId,Integer orderId) throws Exception { 
		ModelAndView mv = new ModelAndView("weixin/order/sure");
		Order order = null;
		mv.addObject("order",order);
        return mv; 
    }
}
