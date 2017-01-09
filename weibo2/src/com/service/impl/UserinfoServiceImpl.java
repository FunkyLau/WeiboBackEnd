package com.service.impl;

import com.dao.UserinfoDao;
import com.service.UserinfoService;

public class UserinfoServiceImpl extends BaseServiceImpl implements UserinfoService {
	private UserinfoDao userinfoDao;

	public void setUserinfoDao(UserinfoDao userinfoDao) {
		this.userinfoDao = userinfoDao;
	}
	
}
