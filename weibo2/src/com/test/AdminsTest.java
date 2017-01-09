package com.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.domain.Admins;
import com.domain.Users;
import com.service.BaseService;
import com.service.UsersService;
import com.service.impl.UsersServiceImpl;

public class AdminsTest {

	@Test
	public void test(){
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		BaseService baseService=(BaseService) context.getBean("baseServiceImpl");
		Admins entity=new Admins(null,"root","root","高级管理员");
		baseService.saveObject(entity);
		
	}
	@Test
	public void test1(){
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		BaseService baseService=(BaseService) context.getBean("baseServiceImpl");
		Users newUsers=(Users) baseService.getObjects(Users.class, "where usersEmail='lp6567@sina.com' and usersPassword='123456'").get(0);
		//System.out.println(baseService.getObjectByProperty(Admins.class,"name","admin"));
		
	}
	@Test
	public void test2(){
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		UsersService usersService = context.getBean("usersServiceImpl",UsersService.class);
		usersService.login("aa","aaaaaa");	
	}
}
