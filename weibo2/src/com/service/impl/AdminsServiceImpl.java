package com.service.impl;

import com.dao.AdminsDao;
import com.service.AdminsService;

public class AdminsServiceImpl extends BaseServiceImpl implements AdminsService {

	private AdminsDao adminsDao;
	
	public void setAdminsDao(AdminsDao adminsDao) {
		this.adminsDao = adminsDao;
	}

	@Override
	public boolean login(String name, String pass) {
		// TODO Auto-generated method stub
		return adminsDao.login(name, pass);
	}
	
}
