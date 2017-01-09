package com.service.impl;

import com.dao.PrivateLetterDao;
import com.service.PrivateletterService;

public class PrivateletterServiceImpl extends BaseServiceImpl implements
		PrivateletterService {
	private PrivateLetterDao privateletterDao;

	public void setPrivateletterDao(PrivateLetterDao privateletterDao) {
		this.privateletterDao = privateletterDao;
	}
}
