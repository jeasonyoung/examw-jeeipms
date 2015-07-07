package com.changh.jeeipms.agencycms.entity;

import java.util.List;

import com.changh.jeeipms.common.entity.agency.VideoEntity;

public class VideoList {
	private List<VideoEntity> list;
	private String courseId;

	public List<VideoEntity> getList() {
		return list;
	}

	public void setList(List<VideoEntity> list) {
		this.list = list;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	
}
