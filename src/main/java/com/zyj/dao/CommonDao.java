package com.zyj.dao;

import java.util.List;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:40:15
 * @version 1.0
 */
public interface CommonDao {
	public Object getById(Class cls, Integer id);
	public Object getByOtherId(Class cls, Integer id,String fieldName);
	public Object getByOther(Class cls, String o1,String o2, String f1, String f2);
	public List<Object> getAll(Class cls);
	public List<Object> getAllByOtherId(Class cls, Integer id,String fieldName);
	public List<Object> getByPage(Class cls, Integer startNum, Integer pageNum);
	public void update(Object obj);
	public void delete(Object obj);
	public void add(Object obj);
	public Integer count(Class cls);
}
