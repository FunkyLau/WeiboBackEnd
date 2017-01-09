package com.service.impl;

import com.dao.CollectionsDao;
import com.service.CollectionsService;

public class CollectionsServiceImpl extends BaseServiceImpl implements
		CollectionsService {
	private CollectionsDao collectionsDao;

	public void setCollectionsDao(CollectionsDao collectionsDao) {
		this.collectionsDao = collectionsDao;
	}
	
}
