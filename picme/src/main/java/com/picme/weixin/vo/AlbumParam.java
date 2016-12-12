package com.picme.weixin.vo;

import java.util.List;

import com.picme.entity.Image;
import com.picme.entity.PhotoAlbum;

public class AlbumParam extends PhotoAlbum{

	private static final long serialVersionUID = -1742211476256179504L;
	
	private List<Image> imgList;


	public List<Image> getImgList() {
		return imgList;
	}


	public void setImgList(List<Image> imgList) {
		this.imgList = imgList;
	}
}
