package com.zyj.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zyj.common.Constant;
import com.zyj.common.Util;
import com.zyj.entity.House;
import com.zyj.entity.Request;
import com.zyj.entity.User;
import com.zyj.service.HouseService;
import com.zyj.vo.SearchConditionVo;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年12月16日时间:下午1:21:32
 * @version 1.0
 */
@Controller
@ParentPackage("struts-default")
@Namespace("/house")
@Scope("prototype")
public class HouseAction extends ActionSupport{
	@Autowired
	private HouseService houseService;
	



	@Action(value="showhouse")
	public String  ShowAllhouse()throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String loc=request.getParameter("city");
		System.out.println(loc);
		List<House> house=houseService.getHousesByLocation(loc);
		/*for(int i=0;i<house.size();i++){
			System.out.println(house.get(i).getIntroduce());
		}*/
		System.out.println(house.size());
		Util.returnJson(response, house);
		//System.out.println(houseService.getHousesByLocation("上海").get(0).getIntroduce());
		return null;
	}
	
	public String getHouseByPage() throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String loc=request.getParameter("city");
		int currentpage=Integer.parseInt(request.getParameter("page"));
		List<House> house=houseService.getHouseByPage(loc, (currentpage-1)*Constant.MAX_COUNT, Constant.MAX_COUNT);
		Util.returnJson(response, house);
		return null;
	}
	@Action(value="searchhouse")
	public String searchHouseByKey()throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		  String key=request.getParameter("key");
		  System.out.println(key);
		List<House> house=houseService.getHouseByKey(key);
		Util.returnJson(response, house);
		return null;
	}
	@Action(value="searchhousebycon")
	public String searchHouseByCondition()throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String []con=request.getParameterValues("searchChar");
		String city=request.getParameter("city");
		con[0]=con[0].substring(1);
		for(int i=0;i<3;i++){
			
			System.out.println(con[i]);
		}
		SearchConditionVo scv=new SearchConditionVo();
		scv.setLocation(city);
		scv.setDeloc(con[0]);
		scv.setPricearea(con[1]);
		scv.setHousekind(con[2]);
		//System.out.println(scv.getHousekind());
		List<House> house=houseService.getHouseByCondition(scv);
		Util.returnJson(response, house);
		return null;
	}
	@Action(value="showmyhouse")
	public String showMyHouse()throws Exception{
		System.out.println("进来了");
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		User user=(User) request.getSession().getAttribute("user");
		int userid=user.getId();
		List<House> house=houseService.getHousesByUser(userid);
		Util.returnJson(response, house);
		return null;
	}
	
	@Action(value="requesthouse")
	public String getReqList() throws IOException{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		int id=Integer.parseInt(request.getParameter("id"));
		List<Request> list=houseService.getReqList(id);
		Util.returnJson(response, list);
		return null;
	}
}
