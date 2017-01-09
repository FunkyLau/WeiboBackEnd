package com.service.impl;

import java.io.Serializable;
import java.util.List;
import com.dao.BaseDao;
import com.service.BaseService;

public class BaseServiceImpl implements BaseService {

	private BaseDao baseDao;
	public void setBaseDao(BaseDao baseDao){
		this.baseDao = baseDao;
	}
	@Override
	public Object getObjectById(Class clazz, Serializable id) {
		
		return baseDao.getObjectById(clazz, id);
	}

	@Override
	public Object loadObjectById(Class clazz, Serializable id) {
		
		return baseDao.loadObjectById(clazz, id);
	}

	@Override
	public List getAllObjects(Class clazz) {
		
		return baseDao.getAllObjects(clazz);
	}

	@Override
	public void saveObject(Object entity) {
		baseDao.saveObject(entity);

	}

	@Override
	public boolean saveOrUpdateObject(Object entity) {
		
		return baseDao.saveOrUpdateObject(entity);
	}

	@Override
	public void mergeObject(Object entity) {
		//合并两个session中的同一个对象
		baseDao.mergeObject(entity);

	}

	@Override
	public void deleteObject(Object entity) {
		baseDao.deleteObject(entity);

	}

	@Override
	public void deleteObjectById(Class clazz, Serializable id) {
		baseDao.deleteObjectById(clazz, id);

	}

	@Override
	public List getObjects(Class clazz, int from, int size, String order,
			String sort) {
		
		return baseDao.getObjects(clazz, from, size, order, sort);
	}

	@Override
	public List getObjects(Class clazz, String sql) {
		
		return baseDao.getObjects(clazz, sql);
	}

	@Override
	public List getObjects(Class clazz, String whereSql, int from, int size,
			String order, String sort) {
		
		return baseDao.getObjects(clazz, whereSql, from, size, order, sort);
	}

	@Override
	public int getCount(Class clazz, String whereSql) {
		
		return baseDao.getCount(clazz, whereSql);
	}

	@Override
	public int getCount(String sql) {
		
		return baseDao.getCount(sql);
	}

	@Override
	public int getAllCount(Class clazz) {
		
		return baseDao.getAllCount(clazz);
	}

	@Override
	public boolean deleteObjects(Class clazz, String whereSql) {
		
		return baseDao.deleteObjects(clazz, whereSql);
	}

	@Override
	public boolean checkProperty(Class clazz, String property, String value,
			Integer id) {
		
		return baseDao.checkProperty(clazz, property, value, id);
	}

	@Override
	public Object getObjectByProperty(Class clazz, String property,
			String whereSql) {
		
		return baseDao.getObjectByProperty(clazz, property, whereSql);
	}

}
