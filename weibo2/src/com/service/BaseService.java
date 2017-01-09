package com.service;
import java.io.Serializable;
import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.Session;
public interface BaseService {
	/**
	 * 根据参数id删除指定的实体对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public Object getObjectById(Class clazz, Serializable id);

	/**
	 * 根据参数id获取指定的实体对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	public Object loadObjectById(Class clazz, Serializable id);

	/**
	 * 获取所有指定的实体对象
	 * 
	 * @param clazz
	 * @return
	 */
	public List getAllObjects(Class clazz);


	/**
	 * 保存指定的实体对象
	 * 
	 * @param entity
	 */
	public void saveObject(Object entity);

	/**
	 * 保存或更新指定的实体对象
	 * 
	 * @param entity
	 */
	public boolean saveOrUpdateObject(Object entity);

	/**
	 * 
	 * @param entity
	 */
	public void mergeObject(Object entity);

	/**
	 * 删除指定的实体对象
	 * 
	 * @param entity
	 */
	public void deleteObject(Object entity);

	/**
	 * 根据参数id删除指定的实体对象
	 * 
	 * @param clazz
	 * @param id
	 */
	public void deleteObjectById(Class clazz, Serializable id);

	/**
	 * 获取指定开始位置到指定结束位置的指定的实体数据,并按照传递的参数排序
	 * @param clazz
	 * @param from
	 * @param size
	 * @param order
	 * @param sort
	 * @return
	 */
	public List getObjects(final Class clazz, final int from, final int size, final String order,final String sort);

	/**
	 * 根据sql语句查询指定的实体
	 * 
	 * @param clazz
	 * @param sql
	 * @return
	 */
	public List getObjects(final Class clazz,  final String sql);

	/**
	 *  获取指定的实体对象数据,带有查询条件,指定开始位置和结束位置
	 * @param clazz
	 * @param whereSql
	 * @param from
	 * @param size
	 * @param order
	 * @param sort
	 * @return
	 */
	 
	public List getObjects(final Class clazz, final  String whereSql,
			 final int from,  final int size,final String order,final String sort);

	/**
	 * 获取带有查询条件的实体对象数据的总数
	 * 
	 * @param clazz
	 * @param whereSql
	 * @return
	 */
	public int getCount(final Class clazz,  final String whereSql);
	
	

	/**
	 * 根据sql语句查询实体数据的总数
	 * 
	 * @param sql
	 * @return
	 */
	public int getCount(final String sql);

	/**
	 * 查询指定实体对象数据的总数
	 * 
	 * @param clazz
	 * @return
	 */
	public int getAllCount(final Class clazz);
	
	/**
	 * 批量删除操作
	 * 单独删除
	 * @param whereSql
	 */
	public boolean deleteObjects(final Class clazz,final String whereSql);
	
	/**
	 * 验证此字段是否存在
	 * @param clazz
	 * @param property
	 * @param value
	 * @return
	 */
	public boolean checkProperty(final Class clazz,final String property,final String value,final Integer id);

	/**
	 * 根据某一字段查找实体集合
	 * @param clazz
	 * @param property
	 * @return
	 */
	public Object getObjectByProperty(final Class clazz, final String property,final String whereSql);
}
