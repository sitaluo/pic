package com.picme.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.common.Constants;
import com.picme.entity.Order;
import com.picme.service.OrderService;
import com.picme.service.PhotoAlbumService;
import com.picme.weixin.vo.OrderParam;

@Controller
@RequestMapping("admin/order")
public class OrderAdminController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private PhotoAlbumService photoAlbumService;
	
	@RequestMapping("/list")  
    public ModelAndView myOrder(HttpServletRequest request,OrderParam param) throws Exception { 
		ModelAndView mv = new ModelAndView("admin/order/list");
		List<Order> orderList = orderService.listAll();
		mv.addObject("orderList",orderList);
        return mv; 
    }
	
	@RequestMapping("/edit")
    public ModelAndView info(HttpServletRequest request,Integer orderId) throws Exception { 
		ModelAndView mv = new ModelAndView("admin/order/edit");
		Order order = orderService.getById(orderId);
		Map<Integer,String> orderStateMap = Constants.AlbumOrderState.toMap();
		mv.addObject("orderStateMap",orderStateMap);
		mv.addObject("order",order);
        return mv; 
    }
	
}
