package com.service;

import com.domain.Users;

public interface UsersService {
	public Users login(final String email,final String password);
	public boolean checkPass(final Class clazz,final String property,final String value,final Integer id);
}
