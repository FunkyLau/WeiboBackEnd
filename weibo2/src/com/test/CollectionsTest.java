package com.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.domain.Collections;
import com.domain.Messages;
import com.domain.Users;
import com.service.BaseService;
import com.service.impl.BaseServiceImpl;
import com.service.impl.UsersServiceImpl;

public class CollectionsTest {
	
	BaseService service;
	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	@Test
	public void save(){
		service = context.getBean("baseServiceImpl",BaseService.class);
		for(int i=0;i<20;i++){
			Collections entity = new Collections(null,null,null,new Timestamp(new Date().getTime()) ,null);
			service.saveObject(entity);
		}
	}
	
	@Test
	public void getAll(){
		List<Collections> list = context.getBean("baseServiceImpl",BaseService.class).getObjects(Collections.class,0,5,"asc","id");
		for(Collections collections : list){
			System.out.println(collections.getCollectionsTime());
		}
	}
	
	@Test
	public void update(){
		
		BaseService bs = context.getBean("baseServiceImpl",BaseService.class);
		Users user = (Users) bs.getObjectById(Users.class, 13);
		user.setUsersPassword("123123");
		bs.saveOrUpdateObject(user);
	}
}
