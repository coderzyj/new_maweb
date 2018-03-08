package com.zyj.common;

import java.io.Serializable;

/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:36:06
 * @version 1.0
 */
public class MyComment implements Serializable {
	String name;
	String time;
	String content;
	String number;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
}
