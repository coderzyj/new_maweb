package com.zyj.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyj.dao.CityDao;
import com.zyj.entity.City;
import com.zyj.service.CityService;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年12月27日时间:下午10:57:47
 * @version 1.0
 */
@Service
@Transactional
public class CityServiceImpl implements CityService{
	@Autowired
	private CityDao cityDao;
	@Override
	public List<City> getParentCity() {
		// TODO Auto-generated method stub
		return cityDao.getParentCity();
	}

	@Override
	public List<City> getCityByParentName(String parent) {
		// TODO Auto-generated method stub
		return cityDao.getCityByParentName(parent);
	}

	@Override
	public City getCityById(int id) {
		// TODO Auto-generated method stub
		return cityDao.getCityById(id);
	}

}
