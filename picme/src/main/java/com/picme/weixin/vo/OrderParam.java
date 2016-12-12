package com.picme.weixin.vo;

import com.picme.entity.Order;

@SuppressWarnings("serial")
public class OrderParam extends Order{

	private String phone;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
