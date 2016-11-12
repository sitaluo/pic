package com.picme.weixin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.common.WeiXinApiUtils;
import com.picme.weixin.entity.WeiXinUser;

@Controller
@RequestMapping(value="weixin")
public class WeiXinApiController {
	
	/**
	 * 用户同意授权后 
如果用户同意授权，页面将跳转至 redirect_uri/?code=CODE&state=STATE。
若用户禁止授权，则重定向后不会带上code参数，仅会带上state参数redirect_uri?state=STATE
	 * @return
	 */
	@RequestMapping("/code")
	public ModelAndView code(String code, String state) {
		ModelAndView mv = new ModelAndView("weixin/test1");
		//根据code获得微信用户信息
		WeiXinUser weiXinUser = WeiXinApiUtils.getWeiXinUserInfo(code);
		mv.addObject("weiXinUser",weiXinUser);
		return mv;
	}	
	
}
