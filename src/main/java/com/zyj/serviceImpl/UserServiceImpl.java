package com.zyj.serviceImpl;

import com.zyj.common.AccountValidatorUtil;
import com.zyj.common.MyCart;
import com.zyj.dao.CommonDao;
import com.zyj.entity.User;
import com.zyj.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:50:21
 * @version 1.0
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{
	private Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private CommonDao commonDao;

	/**
	 * 注册用户
	 * @param name
	 * @param tel
	 * @param pwd
	 * @param pwd1
	 * @return
	 * @throws Exception
	 */
	@Override
	public MyCart register(String name, String tel, String pwd, String pwd1) throws Exception {
		if(StringUtils.isBlank(name)){
			return new MyCart("false","用户名/手机不能为空");
		}
		if(StringUtils.isBlank(pwd)){
			return new MyCart("false","密码不能为空");
		}
		if(!AccountValidatorUtil.isUsername(name)){
			return new MyCart("false","用户名格式5-20位数字字母");
		}
		if(!AccountValidatorUtil.isMobile(tel)){
			return new MyCart("false","手机号格式为11为数字");
		}
		if(!pwd.equals(pwd1)){
			return new MyCart("false","密码不一致");
		}
		if(!AccountValidatorUtil.isPassword(pwd)){
			return new MyCart("false","密码格式6-20位数字字母");
		}
		User user=new User();
		user.setUsername(name);
		user.setPassword(pwd);
		user.setPhone(tel);
		commonDao.add(user);
		return new MyCart("true","/login.jsp");
	}

	@Override
	public MyCart login(String name, String tel, String pwd, HttpSession session) throws Exception {
		User user = (User) commonDao.getByOther(User.class, name,tel, "username","phone");
		if(user == null) {
			return new MyCart("false","用户名或手机错误");
		}else{
			if (user.getPassword().equals(pwd)) {
				session.setAttribute("user",user);
				//session.setAttribute("id",user.getId());
				if(user.getId()<=4){
					session.setAttribute("admin","admin");
				}
				return new MyCart("true","/home.jsp");
			}else{
				return new MyCart("false","密码错误");
			}
		}

	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		commonDao.update(user);
	}
}
