package com.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.AdminsDao;
import com.domain.Admins;

public class AdminsDaoImpl extends HibernateDaoSupport implements AdminsDao {

	@Override
	public boolean login(final String name, final String pass) {
		boolean flag = false;
		//返回list
		Admins admins = getHibernateTemplate().execute(
				new HibernateCallback<Admins>(){
					public Admins doInHibernate(Session session)throws HibernateException,SQLException{
						return (Admins)session.createCriteria(Admins.class)
								.add(Restrictions.eq("adminsName", name))
								.add(Restrictions.eq("adminsPass", pass))
								.uniqueResult();
					}
					
				});
		if (admins!=null) {
			flag=true;
		}
		return flag;
	}

}
