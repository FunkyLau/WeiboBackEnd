package com.service.impl;

import com.dao.RelationDao;
import com.service.RelationService;

public class RelationServiceImpl extends BaseServiceImpl implements
		RelationService {
	private RelationDao relationDao;

	public void setRelationDao(RelationDao relationDao) {
		this.relationDao = relationDao;
	}
	
}
