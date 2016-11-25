package com.picme.service;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.picme.common.Page;
import com.picme.entity.User;
import com.picme.entity.UserExample;
import com.picme.mapper.UserMapper;
import com.picme.weixin.entity.WeiXinUser;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	public void add(User record) throws Exception{
		userMapper.insert(record);
	}
	
	public User getById(User record) throws Exception{
		return userMapper.selectByPrimaryKey(record.getId());
	}
	public User getById(Integer uid) {
		return userMapper.selectByPrimaryKey(uid);
	}
	
	public void update(User record){
		userMapper.updateByPrimaryKey(record);
	}
	
	public void delete(User record) throws Exception{
		userMapper.deleteByPrimaryKey(record.getId());
	}
	
	public void save(User record) throws Exception{
		if(record.getId() != null){
			userMapper.updateByPrimaryKeySelective(record);
		}else{
			userMapper.insert(record);
		}
	}
	
	public User saveByOpenId(User record) throws Exception{
		User user = this.getByOpenId(record.getOpenId());
		if(user != null){
			record.setId(user.getId());
			userMapper.updateByPrimaryKeySelective(record);
			user.setNickName(URLDecoder.decode(record.getNickName(), "utf-8")); 
			return user;
		}else{
			userMapper.insert(record);
			record.setNickName(URLDecoder.decode(record.getNickName(), "utf-8")); 
			return record;
		}
	}
	
	
	public void list(Page<User> page) throws Exception{
		UserExample example = new UserExample();
		page.setTotalCount(userMapper.countByExample(example));
		page.setResult(userMapper.selectByExampleWithRowbounds(example,page.getRowBounds()));
	}
	
	public User getByUserName(String userName){
		UserExample example = new UserExample();
		UserExample.Criteria cri = example.createCriteria();
		cri.andNameEqualTo(userName);
		List<User> userList = userMapper.selectByExample(example);
		if(userList != null &&  userList.size() > 0){
			return userList.get(0);
		}
		return null;
	}
	
	public User getByOpenId(String openId){
		if(openId == null){
			return null;
		}
		UserExample example = new UserExample();
		UserExample.Criteria cri = example.createCriteria();
		cri.andOpenIdEqualTo(openId);
		List<User> userList = userMapper.selectByExample(example);
		if(userList != null &&  userList.size() > 0){
			return userList.get(0);
		}
		return null;
	}
	
	public List<User> listAll() {
		UserExample example = new UserExample();
		List<User> list = userMapper.selectByExample(example);
		return list;
	}
	
	public User fromWeiXinUser(WeiXinUser wuser) throws Exception{
		User rtUser = null;
		if(wuser != null){
			User user = new User();
			BeanUtils.copyProperties(wuser, user);
			user.setOpenId(wuser.getOpenid());
			user.setNickName(URLEncoder.encode(wuser.getNickname(), "utf-8"));
			user.setFromType("weixin");
			rtUser = this.saveByOpenId(user);
		}
		return rtUser;
	}
	
	
}
