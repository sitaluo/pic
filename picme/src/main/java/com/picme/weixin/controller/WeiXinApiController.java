package com.picme.weixin.controller;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.common.BusinessNoUtils;
import com.picme.common.Constants;
import com.picme.common.JsApiSign;
import com.picme.common.WeiXinApiUtils;
import com.picme.entity.PhotoAlbum;
import com.picme.entity.User;
import com.picme.service.PhotoAlbumService;
import com.picme.service.UserService;
import com.picme.weixin.entity.WeiXinUser;

@Controller
@RequestMapping(value="weixin")
public class WeiXinApiController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PhotoAlbumService photoAlbumService;
	//@Autowired
	//private OrderService orderService;
	
	/**
	 * 用户同意授权后 
如果用户同意授权，页面将跳转至 redirect_uri/?code=CODE&state=STATE。
若用户禁止授权，则重定向后不会带上code参数，仅会带上state参数redirect_uri?state=STATE
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/code")
	public ModelAndView code(String code, String state,HttpSession session,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("weixin/index");
		//根据code获得微信用户信息
		WeiXinUser weiXinUser = WeiXinApiUtils.getWeiXinUserInfo(code);
		User user = userService.fromWeiXinUser(weiXinUser);
		mv.addObject("weiXinUser",weiXinUser);
		if(user == null ){
			user = userService.getById(1);//TODO 删除
		}
		session.setAttribute(Constants.CURRENT_USER_KEY, user);
		
		Map<String,String> jsApiSign = JsApiSign.sign( request.getRequestURL().toString());
		
		session.setAttribute("jsApiSign", jsApiSign);
		return mv;
	}	
	
	@RequestMapping("/selectCover" )   
    public ModelAndView toUpload(HttpServletRequest request) { 
		ModelAndView mv = new ModelAndView("weixin/selectCover");
		
        return mv; 
    }
	/**
	 * 影集排版
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/typeSetting" )   
    public ModelAndView typeSetting(HttpServletRequest request,String coverImg) throws Exception { 
		ModelAndView mv = new ModelAndView("weixin/typeSetting");
		
		PhotoAlbum album = new PhotoAlbum();
		album.setNo(BusinessNoUtils.getPhotoAlbumNo());
		album.setCoverImg("static/upload/sysImgs/"+coverImg+".jpg");
		album.setBottomImg("static/upload/sysImgs/1.jpg");
		User user = (User) request.getSession().getAttribute(Constants.CURRENT_USER_KEY);
		album.setUserId(user.getId());
		album.setPrice(new BigDecimal(188));//TODO
		photoAlbumService.save(album);
		
		Map<String,String> jsApiSign = JsApiSign.sign(request.getRequestURL().toString()+"?"+request.getQueryString());
		mv.addObject("jsApiSign", jsApiSign);
		mv.addObject("coverImg",coverImg);
		mv.addObject("album",album);
        return mv; 
    }
	
	
	/**
	 * 影集排版test
	 * @param request
	 * @return
	 */
	@RequestMapping("/typeSetting2" )   
    public ModelAndView typeSetting2(HttpServletRequest request) { 
		ModelAndView mv = new ModelAndView("weixin/typeSetting2");
		Map<String,String> jsApiSign = JsApiSign.sign(request.getRequestURL().toString());
		mv.addObject("jsApiSign", jsApiSign);
        return mv; 
    }
	
	@RequestMapping("/testsort" )   
    public ModelAndView testsort(HttpServletRequest request) { 
		ModelAndView mv = new ModelAndView("weixin/testsort");
        return mv; 
    }
	
}
