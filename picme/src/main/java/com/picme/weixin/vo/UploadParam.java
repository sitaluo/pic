package com.picme.weixin.vo;

public class UploadParam {

	private Integer id;
	private Integer userId;
	private Integer albumId;
	private String openId;
	private Integer order;
	
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAlbumId() {
		return albumId;
	}
	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}
	
}
