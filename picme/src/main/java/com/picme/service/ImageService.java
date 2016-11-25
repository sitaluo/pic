package com.picme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.picme.common.Constants;
import com.picme.common.Page;
import com.picme.entity.Image;
import com.picme.entity.ImageExample;
import com.picme.mapper.ImageMapper;

@Service
public class ImageService {

	@Autowired
	private ImageMapper imageMapper;
	
	public void add(Image record) throws Exception{
		imageMapper.insert(record);
	}
	
	public Image getById(Image record) throws Exception{
		return imageMapper.selectByPrimaryKey(record.getId());
	}
	public Image getById(Integer uid) {
		return imageMapper.selectByPrimaryKey(uid);
	}
	
	public void update(Image record){
		imageMapper.updateByPrimaryKey(record);
	}
	
	public void delete(Image record) throws Exception{
		imageMapper.deleteByPrimaryKey(record.getId());
	}
	
	public void save(Image record) throws Exception{
		if(record.getId() != null){
			imageMapper.updateByPrimaryKeySelective(record);
		}else{
			imageMapper.insert(record);
		}
	}
	
	public void add(String path,Integer userId,Integer imageType) throws Exception{
		if(path != null && userId != null && imageType != null){
			Image img = new Image();
			img.setPath(path);
			img.setType(imageType);
			img.setUserId(userId);
			imageMapper.insert(img);
		}
	}
	
	public void addAlbum(String path,Integer userId,Integer albumId) throws Exception{
		if(path != null && userId != null){
			Image img = new Image();
			img.setPath(path);
			img.setType(Constants.ImageType.PHOTO_ALBUM);
			img.setUserId(userId);
			img.setAlbumId(albumId);
			imageMapper.insert(img);
		}
	}
	
	public void list(Page<Image> page) throws Exception{
		ImageExample example = new ImageExample();
		page.setTotalCount(imageMapper.countByExample(example));
		page.setResult(imageMapper.selectByExampleWithRowbounds(example,page.getRowBounds()));
	}
	
	public List<Image> listAll() {
		ImageExample example = new ImageExample();
		List<Image> list = imageMapper.selectByExample(example);
		return list;
	}
	
	
	
}
