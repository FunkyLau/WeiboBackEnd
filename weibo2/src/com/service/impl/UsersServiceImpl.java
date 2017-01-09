package com.service.impl;

import com.dao.UsersDao;
import com.domain.Users;
import com.service.UsersService;

public class UsersServiceImpl extends BaseServiceImpl implements UsersService {
	private UsersDao usersDao;

	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	@Override
	public Users login(String email, String password) {
		return usersDao.login(email, password);
		
	}

	@Override
	public boolean checkPass(Class clazz, String property, String value,
			Integer id) {
		
		return usersDao.checkPass(clazz, property, value, id);
	}
	
}
