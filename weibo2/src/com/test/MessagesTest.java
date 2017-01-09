package com.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.BaseDao;
import com.dao.impl.BaseDaoImpl;
import com.domain.Admins;
import com.domain.Messages;
import com.domain.Pictures;
import com.service.BaseService;
import com.service.impl.BaseServiceImpl;

public class MessagesTest {
	
	BaseDao baseDao = new BaseDaoImpl();

	@Test
	public void test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:appl*.xml");
		BaseDao baseDao = (BaseDao) ac.getBean("baseDaoImpl");
		List list = baseDao.getObjects(Messages.class, " where 1=1 ", 0, 3,
				"asc", "id");
		System.out.println(list);

		/*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:applicationContext.xml");
		BaseService baseService = (BaseService) context
				.getBean("baseServiceImpl");
		System.out.println(baseService.getObjects(Messages.class, " where 1=1 ", 0, 10,
				"desc", "id"));*/
	}

	/**
	 * private Integer id; private String type; private String info; private
	 * Date time; private Integer collectNum; private Integer commentNum;
	 * private Integer transpondNum; private Integer agreeNum; private Integer
	 * readNum; private String label; private Pictures pictures; private Users
	 * users;
	 */
	@Test
	public void save() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:applicationContext.xml");
		BaseService baseService = (BaseService) context
				.getBean("baseServiceImpl");
		baseService.saveObject(new Messages(1,  null, "csdn", "qxs",null,
				null, null, null, null, null, null, null, null, null, null));

	}
}
