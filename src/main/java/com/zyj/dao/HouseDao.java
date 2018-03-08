package com.zyj.dao;

import java.util.List;

import com.zyj.entity.House;
import com.zyj.vo.SearchConditionVo;

public interface HouseDao {
	public List<House>  getHousesByLocation(String loc);
	public List<House>	getHousesByUser(int userid);
	public House getHouseById(int id);
	public void addHouse(House house);
	public List<House>  getHouseByPage(String loc,int start,int end);
	public List<House> 	getHouseByKey(String key);
	public List<House>	getHouseByCondition(SearchConditionVo condition);
}
