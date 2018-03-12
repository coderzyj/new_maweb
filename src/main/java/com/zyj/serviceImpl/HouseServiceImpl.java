package com.zyj.serviceImpl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyj.dao.HouseDao;
import com.zyj.entity.House;
import com.zyj.entity.Request;
import com.zyj.service.HouseService;
import com.zyj.vo.SearchConditionVo;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年12月16日时间:下午6:18:08
 * @version 1.0
 */
@Service
@Transactional
public class HouseServiceImpl implements HouseService{
	
    private HouseDao houseDao;
	@Resource(name="houseDaoImpl")
	public void setHouseDao(HouseDao houseDao) {
		this.houseDao = houseDao;
	}

	@Override
	public List<House> getHousesByLocation(String loc) {
		// TODO Auto-generated method stub
		return houseDao.getHousesByLocation(loc);
	}

	@Override
	public List<House> getHousesByUser(int userid) {
		// TODO Auto-generated method stub
		return houseDao.getHousesByUser(userid);
	}

	@Override
	public void addHouse(House house) {
		// TODO Auto-generated method stub
		houseDao.addHouse(house);
	}

	@Override
	public List<House> getHouseByPage(String loc, int start, int end) {
		// TODO Auto-generated method stub
		return houseDao.getHouseByPage(loc, start, end);
	}

	@Override
	public List<House> getHouseByKey(String key) {
		// TODO Auto-generated method stub
		return houseDao.getHouseByKey(key);
	}

	@Override
	public List<House> getHouseByCondition(SearchConditionVo condition) {
		// TODO Auto-generated method stub
		return houseDao.getHouseByCondition(condition);
	}

	@Override
	public List<Request> getReqList(int id) {
		// TODO Auto-generated method stub
		return houseDao.getReqList(id);
	}

}
