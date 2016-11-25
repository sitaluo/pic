package com.picme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.picme.common.Page;
import com.picme.entity.Address;
import com.picme.entity.AddressExample;
import com.picme.mapper.AddressMapper;

@Service
public class AddressService {

	@Autowired
	private AddressMapper addressMapper; 
	
	public void add(Address record) throws Exception{
		addressMapper.insert(record);
	}
	
	public Address getById(Address record) throws Exception{
		return addressMapper.selectByPrimaryKey(record.getId());
	}
	public Address getById(Integer uid) {
		return addressMapper.selectByPrimaryKey(uid);
	}
	
	public void update(Address record){
		addressMapper.updateByPrimaryKey(record);
	}
	
	public void delete(Address record) throws Exception{
		addressMapper.deleteByPrimaryKey(record.getId());
	}
	
	public void save(Address record) throws Exception{
		if(record.getId() != null){
			addressMapper.updateByPrimaryKeySelective(record);
		}else{
			addressMapper.insert(record);
		}
	}
	
	public void list(Page<Address> page) throws Exception{
		AddressExample example = new AddressExample();
		page.setTotalCount(addressMapper.countByExample(example));
		page.setResult(addressMapper.selectByExampleWithRowbounds(example,page.getRowBounds()));
	}
	
	public List<Address> listAll() {
		AddressExample example = new AddressExample();
		List<Address> list = addressMapper.selectByExample(example);
		return list;
	}
	
	public List<Address> listByUserId(Integer userId) {
		if(userId == null){
			return null;
		}
		AddressExample example = new AddressExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<Address> list = addressMapper.selectByExample(example);
		return list;
	}
	
	
	
}
