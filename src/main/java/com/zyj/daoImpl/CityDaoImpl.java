package com.zyj.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.zyj.dao.CityDao;
import com.zyj.entity.City;
@Repository
public class CityDaoImpl implements CityDao{
	private SessionFactory sessionFactory;
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<City> getParentCity() {
		// TODO Auto-generated method stub
		String hql="from City c where c.type=?";
		return (List<City>)getSession().createQuery(hql).setParameter(0, 1).list();
	}

	@Override
	public List<City> getCityByParentName(String parent) {
		// TODO Auto-generated method stub
		String hql="from City c where c.city.name=?";
		return (List<City>)getSession().createQuery(hql).setParameter(0, parent).list();
	}

	@Override
	public City getCityById(int id) {
		// TODO Auto-generated method stub
		
		return (City) getSession().get(City.class, id);
	}

}
