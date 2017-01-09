package com.service.impl;

import com.dao.AtusersDao;
import com.service.AtusersService;

public class AtusersServiceImpl extends BaseServiceImpl implements
		AtusersService {
	private AtusersDao atusersDao;

	public void setAtusersDao(AtusersDao atusersDao) {
		this.atusersDao = atusersDao;
	}
	
}
