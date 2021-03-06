package com.zyj.service;

import java.util.List;

import com.zyj.entity.House;
import com.zyj.entity.Request;
import com.zyj.vo.SearchConditionVo;

public interface HouseService {
	public List<House>  getHousesByLocation(String loc);
	public List<House>	getHousesByUser(int userid);
	public void addHouse(House house);
	public List<House>  getHouseByPage(String loc,int start,int end);
	public List<House> 	getHouseByKey(String key);
	public List<House> getHouseByCondition(SearchConditionVo condition);
	public List<Request> getReqList(int id);
}
