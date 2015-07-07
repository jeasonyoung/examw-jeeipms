package com.changh.jeeipms.common.service.agency;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.entity.content.FrontPage;

public interface PhotoServiceI extends CommonService{
	/**
	 * 按条件获取分页 课程列表
	 * @param page
	 * @param course
	 * @param type
	 * @return
	 */
	public Page<PhotoEntity> find(Page<PhotoEntity> page, PhotoEntity photo);
	/**
	 * 
	 */
	public FrontPage<PhotoEntity> getPhotoList(String agencyId,FrontPage<PhotoEntity> page);
}
