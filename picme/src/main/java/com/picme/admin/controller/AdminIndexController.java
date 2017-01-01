package com.picme.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.weixin.vo.AlbumParam;

@Controller
@RequestMapping("admin")
public class AdminIndexController {

	@RequestMapping("") 
    public ModelAndView view(HttpServletRequest request,AlbumParam param) { 
		ModelAndView mv = new ModelAndView("admin/adminIndex");
        return mv;
    }
	
	
}
