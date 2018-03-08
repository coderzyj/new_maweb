package com.zyj.common;

import java.io.Serializable;
/**
 * 
 * @author 张勇杰
 * @date:日期:2017年11月10日时间:下午11:49:27
 * @version 1.0
 */
public class MyCart implements Serializable {
	String success;
	String content;

	public MyCart() {
	}

	public MyCart(String success, String content) {
		this.success = success;
		this.content = content;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
