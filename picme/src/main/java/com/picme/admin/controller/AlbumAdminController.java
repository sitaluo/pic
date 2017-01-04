package com.picme.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.picme.common.Constants;
import com.picme.common.FileUtils;
import com.picme.common.ImageUtils;
import com.picme.entity.Image;
import com.picme.entity.PhotoAlbum;
import com.picme.service.ImageService;
import com.picme.service.PhotoAlbumService;
import com.picme.weixin.vo.AlbumParam;

@Controller
@RequestMapping("admin/album")
public class AlbumAdminController {

	@Autowired
	private PhotoAlbumService albumService;
	@Autowired
	private ImageService imageService;
	
	/**
	 * 查看影集
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit") 
    public ModelAndView view(HttpServletRequest request,AlbumParam param) { 
		
		PhotoAlbum album = albumService.getById(param.getId());
		if(album != null){
			BeanUtils.copyProperties(album, param);
		}
		List<Image> imgList = imageService.listAlbumImgs(param.getId());
		param.setImgList(imgList);
		
		ModelAndView mv = new ModelAndView("admin/album/edit");
		mv.addObject("paramTemp",param);
        return mv;
    }
	
	/** 
	 * 批量打包下载文件生成zip文件下载 
	 *  
	 * @param session 
	 */  
	@RequestMapping(value = "/downloadZip", method = RequestMethod.GET)  
	public void downloadFiles(HttpServletRequest request, HttpServletResponse response,Integer albumId)  
	        throws Exception {  
		if(albumId == null || albumId == 0){
			return;
		}
		String realPath1 = request.getSession().getServletContext().getRealPath("/");
		String realPath = request.getSession().getServletContext().getRealPath("static/upload/imgs/");
		PhotoAlbum album = albumService.getById(albumId);
		List<Image> imgList = imageService.listAlbumImgs(albumId);
		FileUtils.deleteFileOfFloder(realPath +"album/temp/");
		List<File> holeSrcImages = new ArrayList<File>();
		for (int i = 0; i < imgList.size(); i++) {
			if(i%2 == 1){
				File file1 = new File(realPath1 + imgList.get(i-1).getPath());
				File file2 = new File(realPath1 + imgList.get(i).getPath());
				ImageUtils.mergeImage(file1, file2, realPath + "album/temp/", "P0"+i+"_P0"+(i+1)+".jpg");
				holeSrcImages.add(file1);
				holeSrcImages.add(file2);
			}
		}
		boolean isHole = Constants.DB_HOLE_COVER_IMAGE_PATH_NAME.equals(album.getCoverImg()) ? true : false;
		if(isHole){
			ImageUtils.merge8Image(holeSrcImages, realPath +"album/temp/", "hole_cover.jpg",realPath +"album/cutImgTemp/");
		}
		
	    String zipFileName = realPath +"album/printZip/" + "temp.zip"; // 压缩后的zip文件 可随意定一个磁盘路径或者相对路径  
	    try {  
	    	FileUtils.zip(realPath +"album/temp/", zipFileName);  
	    } catch (Exception e) {  
	        //logger.error(ex.getMessage());  
	    	e.printStackTrace();
	    }  
	    File temp = new File(zipFileName);  
	    FileUtils.downloadFile(temp, response, true);  
	} 
	    
}
