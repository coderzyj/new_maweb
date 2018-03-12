package com.zyj.daoImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zyj.dao.HouseDao;
import com.zyj.entity.House;
import com.zyj.entity.Request;
import com.zyj.vo.SearchConditionVo;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年12月16日时间:下午6:10:33
 * @version 1.0
 */

@Repository

public class HouseDaoImpl implements HouseDao{
	
	private SessionFactory sessionFactory;
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<House> getHousesByLocation(String loc) {
		// TODO Auto-generated method stub
		String hql="from House h where h.location=?";
		return (List<House>)getSession().createQuery(hql).setParameter(0, loc).list();
	}

	@Override
	public List<House> getHousesByUser(int userid) {
		// TODO Auto-generated method stub
		String hql="from  House h where h.user.id=?";
		return (List<House>)getSession().createQuery(hql).setParameter(0, userid).list();
	}

	@Override
	public void addHouse(House house) {
		// TODO Auto-generated method stub
		getSession().save(house);
	}

	@Override
	public House getHouseById(int id) {
		// TODO Auto-generated method stub
		//String hql="from House o where o.id=?";
		//return (House) getSession().createQuery(hql).setParameter(0, id).uniqueResult();
		return (House) getSession().get(House.class,id);
	}

	@Override
	public List<House> getHouseByPage(String loc, int start, int end) {
		// TODO Auto-generated method stub
		String hql="from House h where h.location=?";
		
		return (List<House>)getSession().createQuery(hql).setParameter(0, loc).setFirstResult(start).setMaxResults(end).list();
	}

	@Override
	public List<House> getHouseByKey(String key) {
		// TODO Auto-generated method stub
		String hql="from House h where h.location = ? or h.village = ? or h.leasemode = ?";
		return  (List<House>)getSession().createQuery(hql).setParameter(0, key).setParameter(1, key).setParameter(2, key).list();
	}

	@Override
	public List<House> getHouseByCondition(SearchConditionVo condition) {
		// TODO Auto-generated method stub
		StringBuffer hql=new StringBuffer();
		
		hql=getLastSql(hql,condition);
		System.out.println(hql.toString());
		return (List<House>)getSession().createQuery(hql.toString()).setParameter(0, condition.getLocation()).list();
	}
	StringBuffer getLastSql(StringBuffer hql,SearchConditionVo condition)
	{
		hql.append("from House h where h.location = ?");

		switch(condition.getDeloc()){
			case "":
				break;
			case "0":
				break;
			case "全部":
				break;
			default:
				hql.append(" and h.deloc= '").append(condition.getDeloc()).append("'");
				break;
		}

		switch(condition.getPricearea()){
			case "0":
				break;
			case "10":
				break;
			case "11":
				hql.append(" and h.rent<=500");
				break;
			case "12":
				hql.append(" and h.rent>500 and h.rent<=800");
				break;
			case "13":
				hql.append(" and h.rent>800 and h.rent<=1000");
				break;
			case "14":
				hql.append(" and h.rent>1000 and h.rent<=1500");
				break;
			case "15":
				hql.append(" and h.rent>1500 and h.rent<=2000");
				break;
			case "16":
				hql.append(" and h.rent>2000 and h.rent<=3000");
				break;
			case "17":
				hql.append(" and h.rent>3000 and h.rent<=5000");
				break;
			case "18":
				hql.append(" and h.rent>5000");
				break;
		}
		switch(condition.getHousekind())
		{
			case "0":
				break;
			case "20":
				break;
			case "21":
				hql.append(" and h.shi=1");
				break;
			case "22":
				hql.append(" and h.shi=2");
				break;
			case "23":
				hql.append(" and h.shi=3");
				break;
			case "24":
				hql.append(" and h.shi=4");
				break;
			case "25":
				hql.append(" and h.shi>=5");
				break;

		}
		return hql;
	}

	@Override
	public List<Request> getReqList(int id) {
		// TODO Auto-generated method stub
		String hql="from Request r where r.house.id=?";
		
		return (List<Request>)getSession().createQuery(hql).setParameter(0, id).list();
	}
}
