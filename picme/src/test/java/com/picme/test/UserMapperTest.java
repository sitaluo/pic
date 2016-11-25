package com.picme.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.picme.entity.Image;
import com.picme.entity.ImageExample;
import com.picme.entity.User;
import com.picme.entity.UserExample;
import com.picme.mapper.ImageMapper;
import com.picme.mapper.UserMapper;


public class UserMapperTest {

	private static ApplicationContext applicationContext;

	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	}

	@Test
	public void testFindUserById() throws Exception {
		UserMapper userMapper =  (UserMapper) applicationContext.getBean("userMapper");
		
		UserExample example = new UserExample();
		UserExample.Criteria cri = example.createCriteria();
		//cri.andOpenIdEqualTo("asdas");
		List<User> userList = userMapper.selectByExample(example);
		System.out.println(userList);
	}

	@Test
	public void testFindUserById2() throws Exception {
		ImageMapper imageMapper =  (ImageMapper) applicationContext.getBean("imageMapper");
		
		ImageExample example = new ImageExample();
		ImageExample.Criteria cri = example.createCriteria();
		//cri.andOpenIdEqualTo("asdas");
		List<Image> userList = imageMapper.selectByExample(example);
		System.out.println(userList);
	}
}
