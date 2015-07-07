package com.changh.jeeipms.common.model;

import java.util.List;

import com.changh.jeeipms.common.entity.order.CourseItemEntity;

public class OrderItem {
	private boolean success = true;// 是否成功
	private int state = 0;// 提示信息
	private List<CourseItemEntity> list = null;// 订单详细
	private String msg="";

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public List<CourseItemEntity> getList() {
		return list;
	}

	public void setList(List<CourseItemEntity> list) {
		this.list = list;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
