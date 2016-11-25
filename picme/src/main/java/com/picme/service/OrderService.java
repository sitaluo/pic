package com.picme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.picme.common.Page;
import com.picme.entity.Order;
import com.picme.entity.OrderExample;
import com.picme.mapper.OrderMapper;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;  
	
	public void add(Order record) throws Exception{
		orderMapper.insert(record);
	}
	
	public Order getById(Order record) throws Exception{
		return orderMapper.selectByPrimaryKey(record.getId());
	}
	public Order getById(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}
	
	public void update(Order record){
		orderMapper.updateByPrimaryKey(record);
	}
	
	public void delete(Order record) throws Exception{
		orderMapper.deleteByPrimaryKey(record.getId());
	}
	
	public void save(Order record) throws Exception{
		if(record.getId() != null){
			orderMapper.updateByPrimaryKeySelective(record);
		}else{
			orderMapper.insert(record);
		}
	}
	
	public void list(Page<Order> page) throws Exception{
		OrderExample example = new OrderExample();
		page.setTotalCount(orderMapper.countByExample(example));
		page.setResult(orderMapper.selectByExampleWithRowbounds(example,page.getRowBounds()));
	}
	
	public List<Order> listAll() {
		OrderExample example = new OrderExample();
		List<Order> list = orderMapper.selectByExample(example);
		return list;
	}
	
	public List<Order> listByUserId(Integer userId) {
		if(userId == null){
			return null;
		}
		OrderExample example = new OrderExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<Order> list = orderMapper.selectByExample(example);
		return list;
	}
	
	
	
}
