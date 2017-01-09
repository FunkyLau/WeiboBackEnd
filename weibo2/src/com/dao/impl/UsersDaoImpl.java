package com.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.UsersDao;
import com.domain.Users;

public class UsersDaoImpl extends HibernateDaoSupport implements UsersDao {

	@Override
	public Users login(final String email, final String passWord) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Users>() {

					@Override
					public Users doInHibernate(Session session)
							throws HibernateException, SQLException {
						
						return (Users)session.createCriteria(Users.class)
								.add(Restrictions.eq("usersEmail", email))
								.add(Restrictions.eq("usersPassword", passWord))
								.uniqueResult();
					}
				});
	}

	@Override
	public boolean checkPass(final Class clazz, final String property, final String value,
			final Integer id) {
		
		return getHibernateTemplate().execute(
				new HibernateCallback<Boolean>() {

					@Override
					public Boolean doInHibernate(Session session)
							throws HibernateException, SQLException {
						Object obj = session.createCriteria(clazz)
								.add(Restrictions.eq(property, value))
								.add(Restrictions.eq("usersId", id))
								.uniqueResult();
						if (obj!=null) {
							return true;
						}
						return false;
					}
				});
	}

}
