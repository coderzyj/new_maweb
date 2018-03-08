package com.zyj.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:40:27
 * @version 1.0
 */
public class Util {

	private Log log = LogFactory.getLog(this.getClass());


	/**
	 * 返回json(Object)
	 * @param response
	 * @param o
	 * @param <T>
	 * @throws IOException
	 */
	public static <T> void returnJson(HttpServletResponse response,T o) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		//response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(o);
		System.out.println(jsonlist);
		out.println(jsonlist);
		out.flush();
		out.close();
	}


	/**
	 * 返回json(List)
	 * @param response
	 * @param o
	 * @param <T>
	 * @throws IOException
	 */
	public static <T> void returnJson(HttpServletResponse response, List<T> o) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		//response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonlist = objectMapper.writeValueAsString(o);
		System.out.println(jsonlist);
		out.println(jsonlist);
		out.flush();
		out.close();
	}
}
