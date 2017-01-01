package com.picme.weixin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.picme.entity.Image;
import com.picme.entity.PhotoAlbum;
import com.picme.service.ImageService;
import com.picme.service.PhotoAlbumService;
import com.picme.weixin.vo.AlbumParam;

@Controller
@RequestMapping(value="weixin/album")
public class AlbumController {

	@Autowired
	private PhotoAlbumService albumService;
	@Autowired
	private ImageService imageService;
	/**
	 * 查看影集
	 * @param request
	 * @return
	 */
	@RequestMapping("/view") 
    public ModelAndView view(HttpServletRequest request,AlbumParam param) { 
		
		PhotoAlbum album = albumService.getById(param.getId());
		if(album != null){
			BeanUtils.copyProperties(album, param);
		}
		List<Image> imgList = imageService.listAlbumImgs(param.getId());
		param.setImgList(imgList);
		
		ModelAndView mv = new ModelAndView("weixin/album/view");
		mv.addObject("paramTemp",param);
        return mv;
    }
	
	  
}
