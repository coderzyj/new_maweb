package com.zyj.daoImpl;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zyj.dao.CommonDao;

import java.util.List;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:40:55
 * @version 1.0
 */
@Repository
public class CommonDaoImpl implements CommonDao{

	private Log log = LogFactory.getLog(this.getClass());

	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}


	@Override
	public Object getById(Class cls, Integer id) {
		return getSession().get(cls,id);
	}

	@Override
	public Object getByOtherId(Class cls, Integer id,String filedName) {
		String hql="from "+cls.getName()+" a  where a."+filedName+"=?";
		log.info(hql);
		return getSession().createQuery(hql).setInteger(0,id).uniqueResult();
	}

	@Override
	public Object getByOther(Class cls, String o1,String o2, String f1, String f2) {
		String hql="from "+cls.getName()+" a  where a."+f1+"=?  or a."+f2+"=?";
		log.info(hql);
		return getSession().createQuery(hql).setString(0,o1).setString(1,o2).uniqueResult();
	}

	@Override
	public List<Object> getAll(Class cls) {
		String hql="from "+cls.getName();
		return (List<Object>)getSession().createQuery(hql).list();
	}

	@Override
	public List<Object> getAllByOtherId(Class cls, Integer id, String fieldName) {
		String hql="from "+cls.getName()+" a  where a."+fieldName+"=?";
		log.info(hql);
		return getSession().createQuery(hql).setParameter(0,id).list();
	}

	@Override
	public List<Object> getByPage(Class cls, Integer startNum, Integer pageNum) {
		String hql="from "+cls.getName();
		return (List<Object>)getSession().createQuery(hql).setFirstResult((startNum-1)*pageNum).setMaxResults(pageNum).list();
	}

	@Override
	public void update(Object obj) {
		 getSession().update(obj);
	}

	@Override
	public void delete(Object obj) {
		getSession().delete(obj);
	}

	@Override
	public void add(Object obj) {
		getSession().save(obj);
	}

	@Override
	public Integer count(Class cls) {
		String hql="select count(*) from "+cls.getName();
		Long count = (Long) getSession().createQuery(hql).uniqueResult();
		return count.intValue();
	}
}
