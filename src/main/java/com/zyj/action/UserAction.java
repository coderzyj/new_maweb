package com.zyj.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;










import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zyj.common.Util;
import com.zyj.entity.User;
import com.zyj.service.UserService;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午12:07:19
 * @version 1.0
 */
@Controller
@ParentPackage("struts-default")
@Namespace("/user")
@Scope("prototype")
public class UserAction extends ActionSupport{
	@Autowired
	private UserService userService;
	private User user=new User();
	@Action(value = "login")
	public String login() throws Exception {
		System.out.println("login");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		Util.returnJson(response,userService.login(name, name, pwd, request.getSession()));
		return null;
	}
	/**
	 * 注册
	 * @return
	 * @throws Exception
	 */
	@Action(value = "register")
	public String register() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String pwd = request.getParameter("pwd");
		String pwd1 = request.getParameter("pwd1");
		Util.returnJson(response,userService.register(name, tel, pwd, pwd1));
		return null;
	}
	/**
	 * 注销
	 * @return
	 * @throws Exception
	 */
	
	@Action(value = "logout",results={
			@Result(name="logout",location="/login.jsp" )})
	public String logout()throws Exception{
		ActionContext.getContext().getSession().clear();
		
		return "logout";
	}
	
	@Action(value = "showuserinfo",results={
			@Result(name="showuserinfo",location="/WEB-INF/personal/personinfo.jsp")
	})
	public String showUserInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		return "showuserinfo";
	}
	@Action(value = "updateuserinfo",results={
			@Result(name="updateuserinfo",location="/WEB-INF/personal/personinfo.jsp")
	})
	public String updateUserInfo(){
		
		
		return "updateuserinfo";
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
