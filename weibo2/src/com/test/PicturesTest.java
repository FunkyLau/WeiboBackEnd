package com.test;

import java.sql.Timestamp;
import java.util.Date;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.domain.Pictures;
import com.service.BaseService;
import com.service.impl.BaseServiceImpl;

public class PicturesTest {

	@Test
	public void test(){
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		BaseService baseService=(BaseService) context.getBean("baseServiceImpl");
		for(int i=1;i<50;i++){
			Pictures pictures=new Pictures(1,null,null,"./csdn////","头像",new Timestamp(new Date().getTime()));
			baseService.saveOrUpdateObject(pictures);
		}
		
		
		/*String whereSql = " where 1=1";
		Integer i=baseService.getCount(Pictures.class, whereSql);
		System.out.println(i);*/

	}
}
