package com.zyj.service;



import javax.servlet.http.HttpSession;

import com.zyj.common.MyCart;
import com.zyj.entity.User;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:48:35
 * @version 1.0
 */
public interface UserService {


	/**
	 * 注册用户
	 * @param name
	 * @param tel
	 * @param pwd
	 * @param pwd1
	 * @return
	 * @throws Exception
	 */
	public MyCart register(String name, String tel, String pwd , String pwd1) throws Exception;


	/**
	 * 登陆
	 * @param name
	 * @param tel
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public MyCart login(String name, String tel, String pwd, HttpSession session) throws Exception;
	
	
	public void update(User user);
	
	
	public User get(int id);
}
