package com.picme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.picme.common.Page;
import com.picme.entity.PhotoAlbum;
import com.picme.entity.PhotoAlbumExample;
import com.picme.mapper.PhotoAlbumMapper;

@Service
public class PhotoAlbumService {

	@Autowired
	private PhotoAlbumMapper photoAlbumMapper;  
	
	public void add(PhotoAlbum record) throws Exception{
		photoAlbumMapper.insert(record);
	}
	
	public PhotoAlbum getById(PhotoAlbum record) throws Exception{
		return photoAlbumMapper.selectByPrimaryKey(record.getId());
	}
	public PhotoAlbum getById(Integer id) {
		return photoAlbumMapper.selectByPrimaryKey(id);
	}
	
	public void update(PhotoAlbum record){
		photoAlbumMapper.updateByPrimaryKey(record);
	}
	
	public void delete(PhotoAlbum record) throws Exception{
		photoAlbumMapper.deleteByPrimaryKey(record.getId());
	}
	
	public void save(PhotoAlbum record) throws Exception{
		if(record.getId() != null){
			photoAlbumMapper.updateByPrimaryKeySelective(record);
		}else{
			photoAlbumMapper.insert(record);
		}
	}
	
	
	public void list(Page<PhotoAlbum> page) throws Exception{
		PhotoAlbumExample example = new PhotoAlbumExample();
		page.setTotalCount(photoAlbumMapper.countByExample(example));
		page.setResult(photoAlbumMapper.selectByExampleWithRowbounds(example,page.getRowBounds()));
	}
	
	public List<PhotoAlbum> listAll() {
		PhotoAlbumExample example = new PhotoAlbumExample();
		List<PhotoAlbum> list = photoAlbumMapper.selectByExample(example);
		return list;
	}
	
	public List<PhotoAlbum> listByUserId(Integer userId) {
		if(userId == null){
			return null;
		}
		PhotoAlbumExample example = new PhotoAlbumExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<PhotoAlbum> list = photoAlbumMapper.selectByExample(example);
		return list;
	}
	
	
	
}
