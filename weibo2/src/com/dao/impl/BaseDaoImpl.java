package com.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.BaseDao;

public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {

	@Override
	public Object getObjectById(Class clazz, Serializable id) {
		return getHibernateTemplate().get(clazz, id);
	}

	@Override
	public Object loadObjectById(Class clazz, Serializable id) {
		return getHibernateTemplate().load(clazz, id);
	}

	@Override
	public List getAllObjects(Class clazz) {
		return getHibernateTemplate().find("from "+clazz.getName());
	}

	@Override
	public void saveObject(Object entity) {
		getHibernateTemplate().save(entity);

	}

	@Override
	public boolean saveOrUpdateObject(Object entity) {
		boolean flag = false;
		try{
			getHibernateTemplate().saveOrUpdate(entity);
			flag = true;
		}catch(Exception e){
			flag = false;
		}
		return flag;

	}

	@Override
	public void mergeObject(Object entity) {
		getHibernateTemplate().merge(entity);

	}

	@Override
	public void deleteObject(Object entity) {
		getHibernateTemplate().delete(entity);

	}

	@Override
	public void deleteObjectById(Class clazz, Serializable id) {
		getHibernateTemplate().delete(getHibernateTemplate().get(clazz, id));

	}

	@Override
	public List getObjects(final Class clazz, final int from, final int size,final String order,
		final String sort) {
		return getHibernateTemplate().execute(
				new HibernateCallback<List>(){
					public List doInHibernate(Session session)throws HibernateException,SQLException{
						//分页，设置第一页和每页长度
						return session.createQuery("from "+clazz.getName()).setFirstResult(from).setMaxResults(size).list();
					}
				});
	}

	@Override
	public List getObjects(final Class clazz,final String sql) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<List>(){
					public List doInHibernate(Session session)throws HibernateException,SQLException{
						return session.createQuery("from "+clazz.getName()+" "+sql).list();
					}
				});
	}

	@Override
	public List getObjects(final Class clazz, final String whereSql, final int from, final int size,
			final String order, final String sort) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<List>() {

					@Override
					public List doInHibernate(Session session)
							throws HibernateException, SQLException {
						List list = new ArrayList();
						list = session.createQuery("from "+clazz.getName()+whereSql+" order by "+sort+" "+order)
								.setFirstResult(from)
								.setMaxResults(size)
								.list();
						return list;
					}
					
				});
	}

	@Override
	public int getCount(final Class clazz, final String whereSql) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Integer>() {

					@Override
					public Integer doInHibernate(Session session)
							throws HibernateException, SQLException {
						
						return Integer.valueOf(session.createQuery("select count(*) from "+clazz.getName()+whereSql).uniqueResult()+"");
					}
					
				});
	}

	@Override
	public int getCount(final String sql) {
		
		return 0;
	}

	@Override
	public int getAllCount(final Class clazz) {
		
		return 0;
	}

	@Override
	public boolean deleteObjects(final Class clazz, final String whereSql) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Boolean>() {

					@Override
					public Boolean doInHibernate(Session session)
							throws HibernateException, SQLException {
						session.createQuery("delete from "+clazz.getName()+" where " + clazz.getName() +"Id" + " in ("+whereSql+")").executeUpdate();
						return true;
					}
				});
	}

	@Override
	public boolean checkProperty(final Class clazz, final String property, final String value,
			final Integer id) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Boolean>() {

					@Override
					public Boolean doInHibernate(Session session)
							throws HibernateException, SQLException {
						try{
							Object obj = null;
							if (id!=null) {
								obj = session.createCriteria(clazz)
										.add(Restrictions.eq(property, value))
										.add(Restrictions.eq(clazz.getName()+"Id", id))
										.uniqueResult();
								
							}else{
								obj = session.createCriteria(clazz).add(Restrictions.eq(property, value)).uniqueResult();
							}
							if (obj != null) {
								return false;
							}else{
								return true;
							}
						}catch(Exception e){
							
						}
						return false;
					}
				});
	}

	@Override
	public Object getObjectByProperty(final Class clazz, final String property,
			final String whereSql) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						
						return session.createCriteria(clazz.getName()).add(Restrictions.eq(property, whereSql)).uniqueResult();
					}
				});
	}

}
