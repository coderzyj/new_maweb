package com.zyj.action;

import java.io.IOException;
import java.util.List;

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
import com.zyj.entity.City;
import com.zyj.service.CityService;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年12月27日时间:下午10:42:24
 * @version 1.0
 */
@Controller
@ParentPackage("struts-default")
@Namespace("/city")
@Scope("prototype")
public class CityAction extends ActionSupport{
	@Autowired
	private CityService cityService;
	@Action(value = "parentcity",results={
			@Result(name="getsuccess",location="/login.jsp" )})
	public String getParentCity()
	{
		HttpServletRequest request= ServletActionContext.getRequest();
		List<City> cities=cityService.getParentCity();
		request.setAttribute("cities", cities);
		return "getsuccess"; 
	}
	
	@Action(value = "getsoncity")
	public String getSonCity() throws IOException
	{
		System.out.println("进来了");
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String parent=request.getParameter("parent");
		List<City> city=cityService.getCityByParentName(parent);
		System.out.println(city.get(0).getName());
		Util.returnJson(response, city);
		return null;
	}
}
