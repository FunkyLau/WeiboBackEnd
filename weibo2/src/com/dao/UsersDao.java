package com.dao;

import com.domain.Users;

public interface UsersDao {
	public Users login(final String email,final String passWord);
	
	public boolean checkPass(final Class clazz,final String property,final String value,final Integer id);
}
