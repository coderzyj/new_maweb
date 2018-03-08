package com.zyj.service;

import java.util.List;

import com.zyj.entity.City;

public interface CityService {
	public City getCityById(int id);
	public List<City> getParentCity();
	public List<City> getCityByParentName(String parent);
}
