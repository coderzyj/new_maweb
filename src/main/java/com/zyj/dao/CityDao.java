package com.zyj.dao;

import java.util.List;

import com.zyj.entity.City;

public interface CityDao {
	public City getCityById(int id);
	public List<City> getParentCity();
	public List<City> getCityByParentName(String parent);
}
