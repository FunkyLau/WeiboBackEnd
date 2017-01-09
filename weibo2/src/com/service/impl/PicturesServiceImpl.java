package com.service.impl;

import com.dao.PicturesDao;
import com.service.PicturesService;

public class PicturesServiceImpl extends BaseServiceImpl implements
		PicturesService {
	private PicturesDao picturesDao;

	public void setPicturesDao(PicturesDao picturesDao) {
		this.picturesDao = picturesDao;
	}
	
}
